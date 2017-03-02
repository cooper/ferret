# Copyright (c) 2015, Mitchell Cooper
package F::Bareword;

use warnings;
use strict;
use 5.010;
use parent 'F::Expression';

sub desc {
    my $el = shift;
    my $desc = "bareword '$$el{bareword_value}'";
    return $desc;
}

sub perl_fmt {
    return bareword => { name => shift->{bareword_value} };
}

1
