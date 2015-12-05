# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Verifier;

use warnings;
use strict;
use 5.010;

sub verify {
    my $main_node = shift;
    my $v = { };
    identify_lexical_variable_declarations($v, $main_node);
    verify_lexical_variables($v, $main_node);
    return 1;
}

sub identify_lexical_variable_declarations {
    my ($v, $main_node) = @_;

    # find all the assignments.
    my @assignments = $main_node->filter_descendants(type => 'Assignment');

    # filter the ones which are lexical variable assignments.
    @assignments = grep {
        $_->assign_to->type eq 'LexicalVariable'
    } @assignments;

}

sub verify_lexical_variables {
    my ($v, $main_node) = @_;
    my @vars = $main_node->filter_descendants(type => 'LexicalVariable');
}

1
