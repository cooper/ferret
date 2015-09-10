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

sub _dump {
    my ($self, $arguments, $from_scope, $scope, $return) = @_;
    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;
    print Dumper($arguments->{value}), "\n";
    return $return;
}

1
