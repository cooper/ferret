# Copyright (c) 2013, Mitchell Cooper
package Ferret::Context;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Scope';

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new scope.
    my $context = $class->SUPER::new($f, %opts);
    $context->{special}{global_events} = Ferret::Object->new;

    # inherit global events.
    if (my $c = delete $context->{borrow_events}) {
        my $events = $c->{special}{global_events};
        $context->{special}{global_events}->add_parent($events);
    }

    return $context;
}

sub bind_event {
    my ($context, $name, $event) = @_;
    $context->{special}{global_events}->set_property($name => $event);
}

sub get_event {
    my ($context, $name) = @_;
    return $context->{special}{global_events}->property($name);
}

sub call_event {
    my ($context, $name, $arguments) = @_;
    get_event($context, $name)->call($arguments);
}

1
