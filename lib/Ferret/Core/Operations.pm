# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Operations;

use warnings;
use strict;
use utf8;
use 5.010;

sub add {
    my ($scope, @items) = @_;
    # TODO: errors.
    return if grep { !$_->can('op_add') } @items;

    my $left = shift @items;
    while (@items) {
        my $right = shift @items;
        $left = $left->property('op_add')->call({ other => $right }, $scope);
    }

    return $left;
}

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{$package.'::'.$_} = *{$this_package.'::'.$_} foreach @_;
}

1
