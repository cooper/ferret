# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Operations;

use warnings;
use strict;
use utf8;
use 5.010;

sub add {
    my ($scope, $left, $right) = @_;
    # TODO: errors.
    return if !$left->property('op_add');
    return if !$right->property('op_add');
    return $left->property('op_add')->call({ other => $right }, $scope);
}

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{$package.'::'.$_} = *{$this_package.'::'.$_} foreach @_;
}

1
