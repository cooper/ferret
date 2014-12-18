# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Operations;

use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    no strict 'refs';
    foreach my $star (qw/pow mul div add _sub/) {
        *$star = sub { op_star($star, @_) };
    }
}

sub op_star {
    my ($star, $scope, @items) = @_;
    $star = 'sub' if $star eq '_sub';

    # TODO: errors.
    my $op   = "op_$star";
    @items   = grep { $_->has_property($op) } @items;
    my $left = shift @items or return;

    while (@items) {
        my $right = shift @items;
        $left = $left->property($op)->call({ other => $right }, $scope);
    }

    return $left;
}

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{ "${package}::$_" } = *{ "${this_package}::$_" } foreach @_;
}

sub num { Ferret::Number->new(shift, value => shift) }
sub str { Ferret::String->new(shift, value => shift) }

1
