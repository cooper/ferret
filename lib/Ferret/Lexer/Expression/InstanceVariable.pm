# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Expression::InstanceVariable;

use warnings;
use strict;
use parent 'Ferret::Lexer::Expression';

sub type { 'InstanceVariable' }
sub desc {
    my $var = shift;
    return "Instance variable '\@$$var{var_name}'";
}

1
