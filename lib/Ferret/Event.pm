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
    my $event = $class->SUPER::new($f,
        functions => [],
        %opts
    );

    # conveniently create an event with a function.
    if (my $func = delete $event->{default_func}) {
        $func->{name} = 'default';
        $event->add_function($func);
    }

    return $event;
}

sub add_function {
    my ($event, $func) = @_;
    # function name is basically callback name.
    $event->{function}{ $func->{name} } = $func if $func->has_name;
    push @{ $event->{functions} }, $func;
}

sub call {
    my ($event, $arguments, $from_scope) = @_;

    # arguments for the default function.
    if (ref $arguments eq 'ARRAY') {
        my $default = $event->{function}{default} or return;
        $arguments = $default->handle_arguments($arguments);
    }

    # sort functions by priority.
    my @sorted = sort {
        $b->{priority} <=> $a->{priority}
    } @{ $event->{functions} };

    # call each function. if the dependencies can't be satisfied,
    # ->call will do nothing.
    my (@returns, %returns);
    foreach my $func (@sorted) {
        $func->{last_parent} = $event->{last_parent}; # for $self
        my $ret = $func->call($arguments, $from_scope);
        $returns{ $func->{name} } = $ret if $func->has_name;
        push @returns, $ret;
    }

    return (\@returns, \%returns);
}

1
