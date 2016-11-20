# Copyright 2015, Mitchell Cooper
package F::InstanceVariable;

use warnings;
use strict;
use parent qw(F::Expression F::Assignable F::PropertyOwner);

sub property_name { shift->{var_name}   }
sub property_code { '$self'             }

sub desc {
    my $var = shift;
    return "instance variable '\@$$var{var_name}'";
}

sub perl_fmt {
    instance_var => { name => shift->{var_name} };
}

1
