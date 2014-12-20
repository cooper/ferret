# Copyright 2014 Mitchell Cooper
package F::Expression;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Expression' }
sub desc {
    my $exp = shift;
    my $str = 'expression';
    $str .= sprintf " ('%s' parameter)", $exp->{parameter_for}
        if $exp->{parameter_for};
    return $str;
}

sub perl_fmt {
    my $inner = join('', map $_->perl_fmt_do, shift->children);
    return expression => { content => $inner } if length $inner;
    return;
}

1
