# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Verifier;

use warnings;
use strict;
use 5.010;

my $error;

our %errors = (
    UndeclaredVariableReference => {
        message => "Reference to lexical variable '\$%s' without previous declaration",
        hint_0  => "Note that '\$%s' is later declared in this scope on line %d",
        hint_1  => "Note that '\$%s' is the variable being assigned to; it cannot be referenced within its own assignment value"
    },
    RedundantPrivateIndicator => {
        message => "Redundant private indicator (underscore) on lexical variable '\$%s'",
        hint_0  => 'Lexical variables are assumed to be private unless explicitly shared'
    },
    RecursiveTypeDeclaration => {
        message => "Type '%s' is recursive",
        hint_0  => "The 'isa' condition on line %d refers to the type itself"
    },
    BarewordDeclarationConflict => {
        message => "Found multiple declarations using the name '%s' in the same scope",
        hint_0  => "The first is a %s, declared on line %d",
        hint_1  => "The second is a %s, declared on line %d"
    }
);

sub error_string {
    my ($el, $type, $hints, @args) = @_;

    # hints provided.
    my @hints = @$hints;
    my @hint_msgs;
    for my $i (keys @hints) {
        my $found = $hints[$i];

        # it's hint $i with arguments
        if (ref $found eq 'ARRAY') {
            my $hint_msg = sprintf $errors{$type}{"hint_$i"}, @$found;
            push @hint_msgs, $hint_msg;
            next;
        }

        # it's hint $found without arguments
        push @hint_msgs, $errors{$type}{"hint_$found"};

    }

    my $msg = sprintf $errors{$type}{message}, @args;
    $msg .= ".\n$_" foreach @hint_msgs;

    return $msg;
}

sub verify {
    my $main_node = shift;
    my $v = { };
    undef $error;

    # determine where variables become available
    identify_lexical_variable_declarations($v, $main_node) and return;

    # raise error if referring to an undeclared variable
    verify_lexical_variables($v, $main_node) and return;

    # raise error for type T { isa T }
    identify_recursive_type_declarations($v, $main_node) and return;

    # raise error for multiple bareword declarations by same name in same scope
    identify_duplicate_barewords($v, $main_node) and return;

}

sub identify_lexical_variable_declarations {
    my ($v, $main_node) = @_;

    # WantNeed variable declarations
    # ------------------------------

    # find all the declarations.
    my @wantneeds = $main_node->filter_descendants(type => 'WantNeed');

    # filter the ones which are lexical variable declarations.
    @wantneeds = grep {
        $_->variable->type eq 'LexicalVariable'
    } @wantneeds;

    foreach my $wn (@wantneeds) {

        # the scope of interest is the one containing the assignment
        my $soi = $wn->first_upper_scope;

        # process the declaration.
        my $var = $wn->variable;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $wn->{close_pos});

    }

    # Shared variable declarations
    # ----------------------------

    my @shares = $main_node->filter_descendants(type => 'SharedDeclaration');

    foreach my $share (@shares) {

        # the scope of interest is the one containing the declaration
        my $soi = $share->first_upper_scope;

        # process the declaration.
        my $var = $share->variable;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $share->{close_pos});

    }

    # Local variable declarations
    # ----------------------------

    my @locals = $main_node->filter_descendants(type => 'LocalDeclaration');

    foreach my $local (@locals) {

        # the scope of interest is the one containing the declaration
        my $soi = $local->first_upper_scope;

        # process the declaration.
        my $var = $local->variable;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $local->{close_pos});

    }

    # Assignments
    # -----------

    # find all the assignments.
    my @assignments = $main_node->filter_descendants(type => 'Assignment');

    # filter the ones which are lexical variable assignments.
    @assignments = grep {
        $_->assign_to->type eq 'LexicalVariable'
    } @assignments;
    $v->{assignments}{ $_->{close_pos} } = $_ for @assignments;

    foreach my $a (@assignments) {

        # the scope of interest is the one containing the assignment
        my $soi = $a->first_upper_scope;

        # process the assignment.
        my $var = $a->assign_to;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $a->{close_pos});

    }

    # For iterations
    # --------------

    # find all for loops.
    my @fors = $main_node->filter_descendants(type => 'For');

    # filter the ones which are iterations.
    @fors = grep {
        $_->{for_type} eq 'iteration'
    } @fors;

    foreach my $for (@fors) {
        my ($var1, $var2) = $for->handle_vars;

        # the scope of interest is the body of the loop.
        my $soi = $for->body->scope;

        # process the assignment.
        $var1->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var1->{var_name}, $for->body->{create_pos});

        # there may or may not be a second variable.
        if ($var2) {
            $var2->{could_be_declaration} = 1;
            $soi->process_lex_declaration($var2->{var_name}, $for->body->{create_pos});
        }

    }

    return;
}

sub verify_lexical_variables {
    my ($v, $main_node) = @_;
    my @vars = $main_node->filter_descendants(type => 'LexicalVariable');

    foreach my $var (@vars) {

        ### Check that the variable is not starting with underscore ###

        if ($var->{could_be_declaration} &&
          substr($var->{var_name}, 0, 1) eq '_') {
            $var->throw([ 0 ], RedundantPrivateIndicator => $var->{var_name});
        }

        ### Check that the variable is declared ###

        # this is in a WantNeed or Assignment which has been checked.
        next if $var->{could_be_declaration};

        # the scope of interest is the one containing the reference
        my $soi = $var->first_upper_scope;

        # no problem here.
        next if $soi->is_lex_reference_ok($var->{var_name}, $var->{create_pos});

        # oh no. it's not ok.
        my @hints;

        # maybe we can provide useful info on when it was first declared.
        my $earliest = $soi->earliest_lex_declaration($var->{var_name});
        my ($this_line, $other_line) = ($var->{create_line}, $earliest);
        if (defined $earliest) {
            $hints[0] = [ $var->{var_name}, int $other_line ];
        }

        # maybe if the variable is within the assignment, that's helpful.
        if (defined $earliest and my $a = $v->{assignments}{$earliest}) {
            if ($var->somewhere_inside($a)) {
                delete $hints[0];
                $hints[1] = [ $var->{var_name} ];
            }
        }

        # throw an exception.
        return $var->throw(\@hints,
            UndeclaredVariableReference => $var->{var_name}
        );

    }

    return;
}

sub identify_recursive_type_declarations {
    my ($v, $main_node) = @_;
    foreach my $type ($main_node->filter_descendants(type => 'Type')) {

        # find requirements.
        my @req = map $_->first_child,
            $type->body->filter_children(type => 'Instruction.TypeRequirement');

        # filter out isa.
        foreach my $isa (grep { $_->{req_type} eq 'isa' } @req) {

            # only interest if it's a bareword type.
            next if scalar $isa->children != 1;
            my $c = $isa->first_child;
            next if $c->type ne 'Bareword';

            my @hints = ([ int $isa->{create_pos} ]);
            return $isa->throw(\@hints,
                RecursiveTypeDeclaration => $type->{type_name})
                if $c->{bareword_value} eq $type->{type_name};
        }
    }
    return;
}

sub identify_duplicate_barewords {
    my ($v, $main_node) = @_;
    my %taken;

    my $err = sub {
        my ($name, $second, $first) = (shift, shift, $taken{+shift});
        state $what = {
            Function   => 'function',
            Method     => 'method',
            Assignment => 'bareword alias',
            Type       => 'type interface'
        };
        my @hints;
        $hints[0] = [ $what->{ $first->type  }, int  $first->{create_pos} ];
        $hints[1] = [ $what->{ $second->type }, int $second->{create_pos} ];
        $second->throw(\@hints, BarewordDeclarationConflict => $name);
    };

    # functions and methods
    foreach my $fm ($main_node->filter_descendants(type => 'Function Method')) {
        my ($owner) = $fm->owner;
        my $key = "$owner/$$fm{name}";

        return $err->($fm->{name}, $fm, $key) if $taken{$key};
        $taken{$key} = $fm;
    }

    # aliases
    foreach my $as ($main_node->filter_descendants(type => 'Assignment')) {
        my $bw = $as->assign_to;
        next if $bw->type ne 'Bareword'; print "$bw\n";
        my ($owner) = $as->owner;
        my $key = "$owner/$$bw{bareword_value}";

        return $err->($bw->{bareword_value}, $as, $key) if $taken{$key};
        $taken{$key} = $as;
    }

    # types
    foreach my $type ($main_node->filter_descendants(type => 'Type')) {
        my ($owner) = $type->owner;
        my $key = "$owner/$$type{type_name}";

        return $err->($type->{type_name}, $type, $key) if $taken{$key};
        $taken{$key} = $type;
    }

    return;
}

1
