# Copyright 2015, Mitchell Cooper
package F::Number;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(quote);

sub desc {
    my $num = shift;
    return 'constant zero' if $num->{zero};
    return "number '$$num{value}'";
}

sub perl_fmt {
    my $num = shift;
    my $doc = $num->document;
    $doc->{required_operations}{num}++;
    return 'zero' if $num->{zero};
    return number => { num => quote($num->{value}) };
}

1
