# Copyright 2014 Mitchell Cooper
package F::InstanceVariable;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'InstanceVariable' }

sub desc {
    my $var = shift;
    return "Instance variable '\@$$var{var_name}'";
}

sub perl_fmt {
    instance_var => { name => shift->{var_name} };
}

1
