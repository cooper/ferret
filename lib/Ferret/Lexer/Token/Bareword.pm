# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Token::Bareword;

use warnings;
use strict;
use 5.010;
use parent 'Ferret::Lexer::Element';

sub type { 'Bareword' }
sub desc {
    my $el = shift;
    my $desc  = "Bareword '$$el{bareword_value}'";
    return $desc;
}

sub perl_fmt {
    return global_var => { prop_name => shift->{bareword_value} };
}

1
