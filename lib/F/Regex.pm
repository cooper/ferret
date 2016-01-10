# Copyright 2015, Mitchell Cooper
package F::Regex;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(quote);
use Ferret::Shared::Utils qw(dot_trim);

sub desc {
    my $rgx = shift;
    my $first = length $rgx->{value} > 13  ?
        substr($rgx->{value}, 0, 10).'...' :
        $rgx->{value};
    return "Regex /$first/";
}

sub perl_fmt {
    my $rgx = shift;
    my $doc = $rgx->document;
    $doc->{required_operations}{rgx}++;
    return regex => {
        regex => quote($rgx->{value}),
        id    => 'undef',
        mods  => length $rgx->{mods} ? quote($rgx->{mods}) : 'undef'
    };
}

1
