# Copyright (c) 2015, Mitchell Cooper
package Ferret::Perl;

use warnings;
use strict;
use 5.010;

sub F::Element::perl_fmt { }

sub F::Element::perl_fmt_do {
    my @args = shift->perl_fmt;
    my @fmts;
    while (my @a = splice @args, 0, 2) {
        push @fmts, F::get_format('Perl', @a);
    }
    return join ";\n", @fmts;
}

sub F::get_perl_fmt { F::get_format('Perl', @_) }

1
