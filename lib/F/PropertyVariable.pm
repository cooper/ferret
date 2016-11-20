# Copyright 2015, Mitchell Cooper
package F::PropertyVariable;

use warnings;
use strict;
use parent qw(F::Expression F::Assignable F::PropertyOwner);

sub property_name { shift->{var_name}   }
sub property_owner_code { '$ins'              }

sub desc {
    my $var = shift;
    return "topic variable '\$_'" if $var->{var_name} eq '*self';
    return "property variable '.$$var{var_name}'";
}

sub perl_fmt {
    my $var = shift;
    return topic_var => { } if $var->{var_name} eq '*self';
    return property_var => { name => $var->{var_name} };
}

1
