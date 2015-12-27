# Copyright 2015, Mitchell Cooper
package F::PropertyVariable;

use warnings;
use strict;
use parent qw(F::Expression F::Assignable);

sub type { 'PropertyVariable' }

sub desc {
    my $var = shift;
    return "property variable '.$$var{var_name}'";
}

sub perl_fmt {
    property_var => { name => shift->{var_name} };
}

1
