# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

sub _say {
    my $arguments = shift;
    say $arguments->{message}{value} // $arguments->{message};
    return; # returning nothing means an empty object.
}

1
