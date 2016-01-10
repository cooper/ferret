# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Verifier;

use warnings;
use strict;
use 5.010;

use Ferret::Shared::Utils qw(regex_str);

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
    },
    InvalidRegularExpression => {
        message => "Failed to compile constant regular expression /%s/%s",
        hint_0  => "Engine: %s"
    }
);

sub error_string {
    my ($el, $type, $hints, @args) = @_;

    # hints provided.
    my @hints = @$hints;
    my @hint_msgs;
    for my $i (keys @hints) {
        my $found = $hints[$i] or next;

        # it's hint $i with arguments
        if (ref $found eq 'ARRAY') {
            my $hint_msg = sprintf $errors{$type}{"hint_$i"}, @$found;
            $hint_msg =~ s/(\s|\.)$//g;
            push @hint_msgs, $hint_msg;
            next;
        }

        # it's hint $found without arguments
        push @hint_msgs, $errors{$type}{"hint_$found"};

    }

    my $msg = sprintf $errors{$type}{message}, @args;
    $msg .= ".\n$_" foreach grep length, @hint_msgs;

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

    # check validity of constant regular expressions.
    verify_regular_expressions($v, $main_node) and return;

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

        # remember the location.
        $v->{lex_declarations}{ $wn->{close_pos} } = [ $wn, $wn->variable ];

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

        # remember the location.
        $v->{lex_declarations}{ $share->{close_pos} } =
            [ $share, $share->variable ];

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

        # remember the location.
        $v->{lex_declarations}{ $local->{close_pos} } =
            [ $local, $local->variable ];

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

    foreach my $as (@assignments) {

        # the scope of interest is the one containing the assignment
        my $soi = $as->first_upper_scope;
        my $p = $as->{close_pos};

        # remember the location.
        $v->{lex_declarations}{$p} = [ $as, $as->assign_to ];

        # process the assignment.
        my $var = $as->assign_to;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $p);

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
        my $p = $for->body->{open_pos};

        # remember the location.
        $v->{lex_declarations}{$p} = [ $for, $var1 ];

        # process the assignment.
        $var1->{could_be_declaration} = 1;
        $var1->{available_scope} = $soi;
        $soi->process_lex_declaration($var1->{var_name}, $p);

        # there may or may not be a second variable.
        if ($var2) {
            $v->{lex_declarations}{$p} = [ $for, $var1, $var2 ];
            $var2->{could_be_declaration} = 1;
            $var2->{available_scope} = $soi;
            $soi->process_lex_declaration($var2->{var_name}, $p);
        }

    }

    # Catch
    # --------------

    # find all catch parameters.
    my @catches = $main_node->filter_descendants(type => 'Catch');

    foreach my $catch (@catches) {
        my $var = $catch->param_exp->first_child or next;

        # the scope of interest is the catch body.
        my $soi = $catch->body->scope;
        my $p = $catch->body->{open_pos};

        # remember the location.
        $v->{lex_declarations}{$p} = [ $catch, $var ];

        # process the declaration.
        $var->{could_be_declaration} = 1;
        $var->{available_scope} = $soi;
        $soi->process_lex_declaration($var->{var_name}, $p);

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

        # the scope of interest is the one containing the reference
        my $soi = $var->first_upper_scope;

        ### If declared, check if it is the declaration itself. ###

        # this might be a declaration.
        if ($var->{could_be_declaration}) {

            # the scope where it was declared might not be the same
            # as the scope where it becomes available.
            my $sfi = $var->{available_scope} || $soi;

            # find the position of where the variable is first declared.
            my $pos = $sfi->where_lex_declared($var->{var_name}) or die;

            # find the declaration at that position.
            # this could be a SharedDeclaration, LocalDeclaration, Assignment...
            my $decl_a = $v->{lex_declarations}{$pos} or die;
            my ($decl, @decl_vars) = @$decl_a;

            # if any of the variables in this declaration are this variable,
            # tell the declaration node that it should respect that.
            my $i = 1;
            foreach my $decl_var (@decl_vars) {
                if ($var == $decl_var) {
                    $decl->{"var${i}_declaration"} = 1;
                    last;
                }
                $i++;
            }

            next;
        }

        # not a declaration, but it's an OK reference.
        next if $soi->is_lex_reference_ok($var->{var_name}, $var->{create_pos});

        ### Below this line: undeclared variable reference ###

        my @hints;

        # maybe we can provide useful info on when it was first declared.
        my $earliest = $soi->earliest_lex_declaration($var->{var_name});
        if (defined $earliest) {
            $hints[0] = [ $var->{var_name}, int $earliest ];
        }

        # if the variable is within the assignment, that's helpful
        $earliest ||= $soi->where_lex_declared($var->{var_name});
        if (defined $earliest &&
          $var->somewhere_inside($v->{lex_declarations}{$earliest}[0])) {
            delete $hints[0];
            $hints[1] = [ $var->{var_name} ];
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
        next if !$owner;
        my $key = "$owner/$$fm{name}";

        return $err->($fm->{name}, $fm, $key) if $taken{$key};
        $taken{$key} = $fm;
    }

    # aliases
    foreach my $as ($main_node->filter_descendants(type => 'Assignment')) {
        my $bw = $as->assign_to;
        next if $bw->type ne 'Bareword';

        my ($owner) = $as->owner;
        next if !$owner;
        my $key = "$owner/$$bw{bareword_value}";

        return $err->($bw->{bareword_value}, $as, $key) if $taken{$key};
        $taken{$key} = $as;
    }

    # types
    foreach my $type ($main_node->filter_descendants(type => 'Type')) {

        my ($owner) = $type->owner;
        next if !$owner;
        my $key = "$owner/$$type{type_name}";

        return $err->($type->{type_name}, $type, $key) if $taken{$key};
        $taken{$key} = $type;
    }

    return;
}

sub verify_regular_expressions {
    my ($v, $main_node) = @_;
    my @regexes = $main_node->filter_descendants(type => 'Regex');
    foreach my $regex (@regexes) {
        my $regex_str = regex_str(@$regex{'value', 'mods'});
        next if eval { qr/$regex_str/; 1 };
        (my $msg = $@) =~ s/ at (.+?)\.pm line (\d+)//g;
        return $regex->throw([ [$msg] ], InvalidRegularExpression =>
            $regex->{value} // '',
            $regex->{mods}  // ''
        );
    }
}

1
