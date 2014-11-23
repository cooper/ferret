# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Expression;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub type { 'Expression' }
sub desc {
    my $exp = shift;
    my $str = 'Expression';
    $str .= sprintf " ('%s' parameter)", $exp->{parameter_for}
        if $exp->{parameter_for};
    return $str;
}

sub perl_fmt_do {
    my $inner = join('', map $_->perl_fmt_do, shift->children);
    return length $inner ? "($inner)" : '';
}

1
