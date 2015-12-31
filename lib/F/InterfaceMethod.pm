# Copyright 2015, Mitchell Cooper
package F::InterfaceMethod;

use warnings;
use strict;
use parent 'F::Call';


sub desc { 'method requirement' }

sub func_fmt_do {
    my $mreq = shift;
    my $name = $mreq->method_name;
    return "\$create_can->('$name', \$ins)";
}

sub method_name {
    my $var = shift->function;
    return $var->{var_name};
}

1
