# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Expression::SpecialVariable;

use warnings;
use strict;
use parent 'Ferret::Lexer::Expression';

sub type { 'LexicalVariable' }
sub desc {
    my $var = shift;
    return "Special variable '*$$var{var_name}'";
}

1
