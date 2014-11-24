# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Expression::LexicalVariable;

use warnings;
use strict;
use parent 'Ferret::Lexer::Expression';

sub type { 'LexicalVariable' }

sub desc {
    my $var = shift;
    return "Lexical variable '\$$$var{var_name}'";
}

sub perl_fmt {
    lexical_var => { name => shift->{var_name} };
}

1
