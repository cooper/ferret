# Copyright (c) 2014, Mitchell Cooper
package Ferret::Event;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

use Scalar::Util qw(weaken);
use Ferret::Core::Conversion qw(ferret_method ferret_hash);

Ferret::bind_class(
    name => 'Event',

    # this relates to the class called Event.
    # it emulates a real class, but it's not truly such.
    #
    # explicitly setting the proto and proto class allows
    # functions such as say.*isa(Event) to behave as expected.
    #
    on_bind => sub {
        my $class = shift;
        my $proto = _global_event_prototype($class->f);
        $class->set_property_weak(proto => $proto);
        weaken($proto->{proto_class} = $class);
    }
);

# creates a new event.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new object.
    my $event = $class->SUPER::new($f,
        function => {},
        %opts
    );
    $event->{id} = 'E'.($event + 0);

    # make the event inherit from the global event prototype.
    $event->add_parent(_global_event_prototype($f));

    # conveniently create an event with a function.
    # [ obj, func ]
    if (my $func = delete $event->{default_func}) {
        $func->[1]{name} = 'default';
        $event->add_function(@$func);
    }

    # consider: this could change if default func changes.
    $event->set_property(signature => [ sub {
        my $event = $_[1];
        Ferret::String->new($f, str_value => $event->signature_string)
    } ]);

    $event->set_property(name => [ sub {
        my $event = $_[1];
        Ferret::String->new($f, str_value => $event->{name})
    } ]);

    $event->set_property(id => [ sub {
        my $event = $_[1];
        Ferret::String->new($f, str_value => $event->{id})
    } ]);

    return $event;
}

sub add_function           { shift->add_function_with_opts(undef, @_) }
sub add_function_with_opts {
    my ($event, $_opts, $obj, $func) = @_;
    my %opts = $_opts && ref $_opts eq 'HASH' ? %$_opts : ();
    #
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

    my $self_maybe = delete $opts{self};
    my $outer_scope_maybe = delete $opts{outer_scope};

    # function name is basically callback name.
    $opts{name} = $func->{name} ||= $func->{id};
    $event->{function}{ $opts{name} } = $func; # consider: weaken?
    $opts{priority} = 100 if $opts{name} eq 'default';

    my $code = sub {
        my (
            $fire, $obj, $class, $outer_scope,
            $arguments, $call_scope, $return
        ) = @_;

        # force outer scope
        $outer_scope = $outer_scope_maybe if $outer_scope_maybe;

        # forward function scope variables.
        # some of these are not overwritten intentionally.
        # outer_scope, for example, often differs for each callback.
        $func->{class}       ||= $class;
        $func->{outer_scope} ||= $outer_scope;
        $func->{outer_scope}   = $outer_scope if $outer_scope_maybe;
        $func->{is_method}     = $event->{is_method};
        $func->{event_name}    = $event->{name};


        # *this is like *self except it's always the object
        # from which the event is being fired
        $func->{this} = $obj;

        # call the function.
        my $ret = $func->call_with_self(
            $arguments->{_self} || $self_maybe || $obj,
            $arguments,
            $call_scope,
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
        $obj->on($event->{id} => $code, %opts);
    }
    else {
        $event->on(call => $code, %opts);
    }

}

sub description {
    my $event = shift;
    return "Event" if !length $event->{name};
    return "Event '$$event{name}'";
}

sub call_with_self {
    my ($event, $self) = (shift, shift);
    $event->{force_self} = $self;
    return $event->call(@_);
}

sub call {
    my ($event, $arguments, $call_scope, $return) = @_;

    # arguments for the default function.
    $arguments ||= {};
    if (ref $arguments eq 'ARRAY') {
        my $default = $event->default_func or return;
        $arguments = $default->handle_arguments($arguments);
    }

    # find the object
    my $obj =
        $arguments->{_self}         ||
        delete $event->{force_self} ||
        $event->{last_parent}
    or warn "no last parent for $$event{name}" and return;


    # call each function. if the dependencies can't be satisfied,
    # ->call will do nothing.
    $return ||= Ferret::Return->new($event->f);
    my @args = (
        $obj,
        $event->{class},
        $event->{outer_scope},
        $arguments,
        $call_scope,
        $return
    );

    my $fire = Evented::Object::fire_events_together(
        [ $event, call         => @args ],
        [ $obj,   $event->{id} => @args ]
    );
    $event->{most_recent_fire} = $fire;

    return $fire->{override_return} // $return;
}

sub signature_string {
    my $event = shift;
    my $default = $event->default_func or return '';
    return $default->signature_string;
}

sub inside_scope {
    #
    # $name     =   the name of the event within the containing scope, or undef if anonymous
    # $scope    =   the containing scope of the function definition
    # $owner    =   the owner of the function: a scope, class, or prototype
    # $class    =   the containing class of the function (if any)
    # $is_prop  =   the event is a computed property
    # $p_set    =   the computed property should be set after evaluating
    #
    my ($event, $name, $scope, $owner, $class, $is_prop, $p_set) = @_;
    $event->{class} = $class;
    $event->{outer_scope} = $scope;

    $owner->set_property($name => $is_prop ? sub {
        Ferret::Function::_handle_property($event, $p_set ? $name : undef, @_);
    } : $event) if defined $name;

    return $event;
}

# return the global ferret prototype from which all events inherit.
sub _global_event_prototype {
    my $f = shift;
    return $f->{event_proto} ||= do {
        my $proto = Ferret::Prototype->new($f);
        $proto->set_property(callbacks => [ sub {
            ferret_method(sub {
                my $event = shift;
                return ferret_hash($event->{function});
            })
        } ]);
        $proto;
    };
}

sub default_func { shift->{function}{default} }
sub is_method    { shift->{is_method} }

1
