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
    my $conditionals = join ' && ', map { $_->perl_fmt_do } @maybes;

    return maybe_owner => {
        definitions  => $definitions,
        conditionals => $conditionals,
        format       => $node->get_format($node->simple_fmt)
    };
}

1
