# Copyright 2015, Mitchell Cooper
package F::MaybeOwner;

use warnings;
use strict;
use parent 'F::Node';

sub maybe_fmt {
    my ($node, $maybe_n) = (shift, 0);
    my @maybes = @{ $node->{maybes} };
    my $doc = $node->document;

    # my $maybe...
    my $definitions = '';
    foreach my $maybe (@maybes) {
        $doc->{required_operations}{bool}++;
        $maybe->{n} = $maybe_n++;
        $definitions .= sprintf "my %s = %s;\n",
            $maybe->perl_fmt_do,
            $maybe->exp_fmt_do;
    }

    # if ($maybe...)
    my $conditionals = '';
    if (@maybes == 1) {
        $conditionals = $maybes[0]->perl_fmt_do;
    }
    elsif (@maybes) {
        $doc->{required_operations}{all_true}++;
        $conditionals = F::get_perl_fmt(operation => {
            operation => 'all_true',
            items     => join(', ', map $_->perl_fmt_do, @maybes)
        });
    }

    return maybe_owner => {
        definitions  => $definitions,
        conditionals => $conditionals,
        format       => F::get_perl_fmt($node->simple_fmt)
    };
}

1
