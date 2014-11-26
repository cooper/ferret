# Copyright (c) 2014 Mitchell Cooper
package F::Bareword;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

sub type { 'Bareword' }
sub desc {
    my $el = shift;
    my $desc  = "Bareword '$$el{bareword_value}'";
    return $desc;
}

sub perl_fmt {
    return lexical_var => { name => shift->{bareword_value} };
}

1
