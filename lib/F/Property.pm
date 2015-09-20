# Copyright 2014 Mitchell Cooper
package F::Property;

use warnings;
use strict;
use parent qw(F::Node F::Structure F::Expression);

sub type { 'Property' }
sub desc {
    my $prop = shift;
    return "property '$$prop{prop_name}'";
}

sub perl_fmt {
    my $prop = shift;
    return property => {
        name => $prop->{prop_name},
        left => $prop->first_child->perl_fmt_do
    };
}

1
