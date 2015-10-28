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

sub bool {
    return Ferret::truth(@_);
}

sub _not {
    my $val = shift;
    return $val == Ferret::true ? Ferret::false : Ferret::true;
}

sub U {
    my $val = shift;
    return $val || Ferret::undefined;
}

sub on {
    my ($obj, $event_name, $self, $scope, $on_func) = @_;
    my $event = $obj->property($event_name);

    # if $event exists and is not an event, runtime error.
    if ($event && !$event->isa('Ferret::Event')) { # TODO: proper type checking
        die; # FIXME
        throw();
    }

    # create the event if it doesn't exist.
    if (!$event) {
        $obj->set_property($event_name =>
            Ferret::Event->new($obj->f, name => $event_name)
        );
        $event = $obj->property($event_name); # set last_parent.
    }

    # add the function.
    $event->add_function_with_self_and_scope($self, $scope, $on_func);

}

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{ "${package}::$_" } = *{ "${this_package}::$_" } foreach @_;
}

sub num { Ferret::Number->new(shift, num_value => shift) }
sub str { Ferret::String->new(shift, str_value => shift) }

1
