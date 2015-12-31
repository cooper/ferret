# Copyright 2015, Mitchell Cooper
package F::NodeExpression;

use warnings;
use strict;

use parent qw(F::Node F::Expression);

sub desc {
    my $exp = shift;
    return $exp->SUPER::desc(@_) unless $exp->{parameter_for};
    return sprintf "expression ('%s' parameter)", $exp->{parameter_for};
}

sub perl_fmt {
    my $inner = join('', map $_->perl_fmt_do, shift->children);
    return expression => { content => $inner } if length $inner;
    return;
}

1
