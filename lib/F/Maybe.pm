# Copyright 2015, Mitchell Cooper
package F::Maybe;

use warnings;
use strict;
use parent qw(F::NodeExpression);


sub fake { 1 }

sub perl_fmt {
    return maybe => { n => shift->{n} };
}

sub exp_fmt_do { shift->first_child->perl_fmt_do }

1
