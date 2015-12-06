# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Verifier;

use warnings;
use strict;
use 5.010;

my $error;

our %errors = (
    UndeclaredVariableReference => {
        message => "Reference to lexical variable '\$%s' without previous declaration",
        hint_0  => "Note that '\$%s' is later declared in this scope on line %d"
    }
);

sub error_string {
    my ($el, $type, $hints, @args) = @_;

    # hints provided.
    my @hints = @$hints;
    my @hint_msgs;
    for my $i (keys @hints) {
        my $hint_msg = sprintf $errors{$type}{"hint_$i"}, @{ $hints[$i] };
        push @hint_msgs, $hint_msg;
    }

    my $msg = sprintf $errors{$type}{message}, @args;
    $msg .= ".\n$_" foreach @hint_msgs;

    return $msg;
}

sub verify {
    my $main_node = shift;
    my $v = { };
    undef $error;
    identify_lexical_variable_declarations($v, $main_node)  and return;
    verify_lexical_variables($v, $main_node)                and return;
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
        $soi->process_lex_declaration($var->{var_name}, $var->{create_pos});

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
        $soi->process_lex_declaration($var->{var_name}, $var->{create_pos});

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
        $soi->process_lex_declaration($var->{var_name}, $var->{create_pos});

    }

    # Assignments
    # -----------

    # find all the assignments.
    my @assignments = $main_node->filter_descendants(type => 'Assignment');

    # filter the ones which are lexical variable assignments.
    @assignments = grep {
        $_->assign_to->type eq 'LexicalVariable'
    } @assignments;

    foreach my $a (@assignments) {

        # the scope of interest is the one containing the assignment
        my $soi = $a->first_upper_scope;

        # process the assignment.
        my $var = $a->assign_to;
        $var->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var->{var_name}, $var->{create_pos});

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

        # the scope of interest is the one containing the for loop,
        # NOT the body of the loop. use the first var. it always exists.
        my $soi = $var1->first_upper_scope;

        # process the assignment.
        $var1->{could_be_declaration} = 1;
        $soi->process_lex_declaration($var1->{var_name}, $var1->{create_pos});

        # there may or may not be a second variable.
        if ($var2) {
            $var2->{could_be_declaration} = 1;
            $soi->process_lex_declaration($var2->{var_name}, $var2->{create_pos});
        }

    }

    return;
}

sub verify_lexical_variables {
    my ($v, $main_node) = @_;
    my @vars = $main_node->filter_descendants(type => 'LexicalVariable');

    foreach my $var (@vars) {

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
        my ($this_line, $other_line) = ($var->{create_line}, int $earliest);
        if (defined $earliest) {
            $hints[0] = [ $var->{var_name}, $other_line ];
        }

        # throw an exception.
        return $var->throw(\@hints,
            UndeclaredVariableReference => $var->{var_name}
        );

    }

    return;
}

1
