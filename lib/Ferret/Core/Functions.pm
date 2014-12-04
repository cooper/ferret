# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

sub _say {
    my ($self, $arguments, $from_scope, $scope, $return) = @_;
    say $arguments->{message}{value} // $arguments->{message};
    return $return;
}

1
