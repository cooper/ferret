# Copyright 2014 Mitchell Cooper
package F::Property;

use warnings;
use strict;
use parent qw(F::Structure F::Expression);

sub type { 'Property' }
sub desc {
    my $prop = shift;
    return "Property '$$prop{prop_name}'";
}

sub perl_fmt {
    return property => { name => shift->{prop_name} };
}

1
