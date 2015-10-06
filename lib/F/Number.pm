# Copyright 2014 Mitchell Cooper
package F::Number;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'Number' }
sub desc {
    my $num = shift;
    return "number '$$num{value}'";
}

sub perl_fmt {
    my $num = shift;
    my $doc = $num->document;
    $doc->{required_operations}{num}++;
    return number => { num => $num->{value} };
}

1
