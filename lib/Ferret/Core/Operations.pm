# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Operations;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Shared::Utils qw(import);
use List::Util qw(any all);

BEGIN {
    no strict 'refs';
    foreach my $star (qw/range pow mod mul div add _sub/) {
        *$star = sub { op_star($star, @_) };
    }
}

sub op_star {
    my ($star, $scope, @items) = @_;
    $star = 'sub' if $star eq '_sub';

    # TODO: errors.
    my $ucst = ucfirst $star;
    my $op   = "op$ucst";
    #@items   = grep { $_->has_property($op) } @items;
    my $left = shift @items or return;

    while (@items) {
        my $right = shift @items;
        my $f = $left->property($op) or next;
        $left = $f->call({ other => $right }, $scope);
    }

    return $left;
}

sub equal {
    shift;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->equal_to($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub nequal { _not(&equal) }

sub refs_equal {
    shift;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->equal_to_exactly($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub refs_nequal { _not(&refs_equal) }

sub all_true {
    shift;
    return Ferret::true if all { bool($_) } @_;
    return Ferret::false;
}

sub any_true {
    shift;
    return Ferret::true if any { bool($_) } @_;
    return Ferret::false;
}

sub bool {
    return Ferret::truth(@_);
}

sub _not {
    my $val = shift;
    return $val == Ferret::false ? Ferret::true : Ferret::false;
}

sub num { Ferret::Number->new(shift, num_value => shift) }
sub str { Ferret::String->new(shift, str_value => shift) }

1
