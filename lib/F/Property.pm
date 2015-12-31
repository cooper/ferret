# Copyright 2015, Mitchell Cooper
package F::Property;

use warnings;
use strict;
use parent qw(F::NodeExpression F::Assignable);


sub desc {
    my $prop = shift;
    return ($prop->is_special ? 'special ' : '')."property '$$prop{prop_name}'";
}

sub is_special {
    return substr(shift->{prop_name}, 0, 1) eq '*';
}

sub prop_name { shift->{prop_name}              }
sub left      { shift->first_child->perl_fmt_do }

sub perl_fmt {
    my $prop = shift;
    return property => {
        name => $prop->prop_name,
        left => $prop->left
    };
}

1
