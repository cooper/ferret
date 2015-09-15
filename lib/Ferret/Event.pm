# Copyright (c) 2014, Mitchell Cooper
package Ferret::Event;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

# creates a new event.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new object.
    my $event = $class->SUPER::new($f, %opts);

    # conveniently create an event with a function.
    # [ obj, func ]
    if (my $func = delete $event->{default_func}) {
        $func->[1]{name} = 'default';
        $event->add_function(@$func);
    }

    return $event;
}

sub add_function_with_self {
    my ($event, $self) = (shift, shift);
    $event->{force_add_self} = $self;
    return $event->add_function(@_);
}

sub add_function {
    my ($event, $obj, $func) = @_;
    # if $func is undefined, that means the $obj was omitted.
    # when $obj is omitted, the object is inferred by last_parent.
    #
    # this is NOT the same behavior as when $obj is undef, as
    # in that case, the function is added as a callback to any
    # object rather than a specific one.
    #
    if (!$func) {
        $func = $obj;
        $obj  = $event->{last_parent};
        $obj  = undef if $obj->{is_proto}; # adding to proto is for all objs
    }
    my $self_maybe = delete $event->{force_add_self};

    # function name is basically callback name.
    my %opts;
    if ($func->has_name) {
        $opts{name} = $func->{name};
        $event->{function}{ $opts{name} } = $func; # weaken?
        $opts{priority} = 100 if $opts{name} eq 'default';
    }

    my $code = sub {
        my (
            $fire, $obj, $class, $outer_scope,
            $arguments, $from_scope, $return
        ) = @_;

        # forward function scope variables.
        # some of these are not overwritten intentionally.
        # outer_scope, for example, often differs for each callback.
        $func->{class}       ||= $class;
        $func->{outer_scope} ||= $outer_scope;
        $func->{is_method}     = $event->{is_method};

        # *this is like *self except it's always the object
        # from which the event is being fired
        $func->{this} = $obj;

        # call the function.
        my $ret = $func->call_with_self(
            $self_maybe || $obj,
            $arguments,
            $from_scope,
            $fire->{override_return} // $return
            # call with override_return such that special property
            # *return will accurately represent the current return
        );

        # override the return if it returns something besides $return.
        $fire->{override_return} = $ret if $ret && $ret != $return;

        return $ret;
    };

    # choose the appropriate target.
    if ($obj) {
        $obj->on("$event" => $code, %opts);
    }
    else {
        $event->on(call => $code, %opts);
    }

}

sub call_with_self {
    my ($event, $self) = (shift, shift);
    $event->{last_parent} = $self;
    return $event->call(@_);
}

sub call {
    my ($event, $arguments, $from_scope, $return) = @_;
    my $obj = $event->{last_parent} or return;

    # arguments for the default function.
    if (ref $arguments eq 'ARRAY') {
        my $default = $event->{function}{default} or return;
        $arguments = $default->handle_arguments($arguments);
    }

    # call each function. if the dependencies can't be satisfied,
    # ->call will do nothing.
    $return ||= Ferret::Object->new($event->ferret);
    my @args = (
        $obj,
        $event->{class},
        $event->{outer_scope},
        $arguments,
        $from_scope,
        $return
    );

    my $fire = Evented::Object::fire_events_together(
        [ $event, call      => @args ],
        [ $obj,   "$event"  => @args ]
    );

    return $fire->{override_return} // $return;
}

sub inside_scope {
    # $name     =   the name of the event within the containing scope, or undef if anonymous
    # $scope    =   the containing scope of the function definition
    # $owner    =   the owner of the function: a scope, class, or prototype
    # $class    =   the containing class of the function (if any)
    my ($event, $name, $scope, $owner, $class) = @_;
    $event->{class} = $class;
    $event->{outer_scope} = $scope;
    $owner->set_property($name => $event) if length $name;
    return $event;
}

sub is_method { shift->{is_method} }

1
