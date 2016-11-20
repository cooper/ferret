# Copyright 2016, Mitchell Cooper
package F::ThisVariable;

use warnings;
use strict;
use parent qw(F::Expression F::Assignable F::PropertyOwner);

sub property_name { shift->{var_name}   }
sub property_code { '$this'             }

sub desc {
    my $var = shift;
    return "this variable '\%$$var{var_name}'";
}

sub perl_fmt {
    this_var => { name => shift->{var_name} };
}

1
