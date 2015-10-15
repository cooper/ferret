# Copyright 2014 Mitchell Cooper
package F::Property;

use warnings;
use strict;
use parent qw(F::Node F::Structure F::Expression);

sub type { 'Property' }
sub desc {
    my $prop = shift;
    return ($prop->is_special ? 'special ' : '')."property '$$prop{prop_name}'";
}

sub is_special {
    return substr(shift->{prop_name}, 0, 1) eq '*';
}

sub perl_fmt {
    my $prop = shift;
    return property => {
        name => $prop->{prop_name},
        left => $prop->first_child->perl_fmt_do
    };
}

1
