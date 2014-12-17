# Copyright 2014 Mitchell Cooper
package F::Number;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'Number' }
sub desc {
    my $num = shift;
    return "Number '$$num{value}'";
}

sub perl_fmt {
    my $num = shift;
    $num->document->{required_operations}{num}++;
    return number => { num => $num->{value} };
}

1
