# Copyright (c) 2015, Mitchell Cooper
package Ferret::Event;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

use Scalar::Util qw(weaken);
use Ferret::Core::Conversion qw(
    fmethod ffunction fhash pdescription ferror
    FUNC_RET
);

my @functions = (
    callTogether => {
        code => \&_call_together,
        need => '$events:Event...'
    }
);

Ferret::bind_class(
    name => 'Event',
    init => sub {
        my $ret = $_[FUNC_RET];
        my $err = ferror(
            'Events cannot be created with the Event class constructor; '.
            'use the func keyword instead',
            'InvalidInitialization'
        );
        return $ret->fail($err);
    },

    # this relates to the class called Event.
    # it emulates a real class, but it's not truly such.
    #
    # explicitly setting the proto and proto class allows
    # functions such as say.*instanceOf(Event) to behave as expected.
    #
    on_bind => sub {
        my $class = shift;
        my $proto = _global_event_prototype($class->f);
        $class->set_property_weak(proto => $proto);
        weaken($proto->{proto_class} = $class);
    },

    functions => \@functions
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

    # the name of the event, mostly for debugging purposes.
    $event->set_property(name => [ sub {
        my $event = $_[1];
        Ferret::String->new($f, str_value => $event->{name})
    } ]);

    # the event ID, based on its memory address.
    $event->set_property(id => [ sub {
        my $event = $_[1];
        Ferret::String->new($f, str_value => $event->{id})
    } ]);

    return $event;
}

#######################################
### ATTACHING FUNCTIONS (CALLBACKS) ###
#######################################

# add a function with default options.
sub add_function { shift->add_function_with_opts(undef, @_) }

# add a function with custom options.
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
        $obj  = undef if $obj->{is_scope};
    }

    # if 'self' option is specified, the event holds a strong reference to
    # that object, and it will always be preferred for *self over any other
    # best-guess alternatives. only ->call_with_self() or the special _self
    # argument will override this.
    #
    # the optional outer scope will be set as each function's outer scope
    # only if there is not a scope set already.
    #
    my $outer_self        = delete $opts{self};
    my $outer_scope_maybe = delete $opts{outer_scope};

    # the function name translates to the Evented::Object callback name.
    # the priority, if unspecified, is zero. for 'default', it is always 100.
    $opts{name}     = $func->{name} ||= $func->{id};
    $opts{priority} = 100 if $opts{name} eq 'default';

    # store the function.
    weaken($event->{default_func} = $func) if !$event->{default_func};
    push @{ $event->{all_funcs} ||= [] }, $func;

    # create the code.
    weaken(my $weak_event = $event);
    weaken(my $weak_func  = $func);
    my $code = sub {
        if (!$weak_event || !$weak_func) {
            warn 'event or function was destroyed during call';
            return;
        }

        # find and call the function(s) by this name.
        $weak_event->_handle_call(
            $weak_func,
            $outer_self,
            $outer_scope_maybe,
            @_
        );
    };

    # choose the appropriate target.
    # for object-specific callbacks, the callback is registered to
    # the object (instance) itself. otherwise, it is registered to
    # this event object.
      $obj->on($event->{id} => $code, %opts)  if  $obj;
    $event->on(call         => $code, %opts)  if !$obj;

}

##################################
### CALLING (FIRING) THE EVENT ###
##################################

# fire with certainty that *self will be the provided object.
sub call_with_self {
    my ($event, $self) = (shift, shift);
    $event->{force_self} = $self;
    return $event->call(@_);
}

sub prepare {
    my ($event, $arguments, $call_scope, $return, $pos, $detail) = (shift, @_);

    # if the arguments are provided as an arrayref, use the signature of the
    # default function to translate them.
    $arguments ||= {};
    if (ref $arguments eq 'ARRAY') {
        my $default = $event->default_func or return;
        $arguments = $default->_handle_arguments($arguments);
    }

    bless $arguments, 'Ferret::Arguments';

    # find the object. this will certainly be *this.
    # it may also be *self, depending on the context.
    my $obj = $event->{last_parent};

    # create the return object and call arguments.
    $return ||= Ferret::Return->new($event->f);
    my @args = (
        $obj,
        $event->{class},
        $event->{outer_scope},
        $arguments,
        $call_scope,
        $return
    );

    # prepare the events.
    my @events  = [ $event, call         => @args ];
    push @events, [ $obj,   $event->{id} => @args ] if $obj;

    return ($return, $detail, \@events);
}

# fire the event.
sub call {
    my $event = shift;
    my ($return, $detail, $events) =
        $event->prepare(@_);
    my ($fire, $ret) = _do_call($return, $detail, $events);
    $event->{most_recent_fire} = $fire;
    return $ret;
}

sub _do_call {
    my ($return, $detail, $events) = @_;
    my $fire = Evented::Object::fire_events_together(@$events);
    $return->detail if $detail;
    return ($fire, $return->final_return);
}

# this CODE is used for all Evented::Object callbacks.
sub _handle_call {
    my (
        $event, $func, $outer_self, $outer_scope_maybe,
        $fire, $obj_maybe, $class, $outer_scope,
        $arguments, $call_scope, $return
    ) = @_;

    # force outer scope.
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
    $func->{this} = $arguments->{_this} || $obj_maybe;

    # store the fire object in the return object.
    weaken($return->{fire} = $fire);

    # determine self
    my $self = $arguments->{_self}  ||
        delete $event->{force_self} ||
        $outer_self                 ||
        $obj_maybe;

    # call the function.
    $func->{force_is_event} = 1;
    my $ret = $func->call_with_self(
        $self,
        $arguments,
        $call_scope,
        $return
    );

    # override the return if it returns something besides $return.
    # if $ret were undef, Function.pm would have returned Ferret::undefined.
    return $return->return($ret);
}

###################################
### LEXICAL ENVIRONMENT (SCOPE) ###
###################################

# sets scope information.
sub inside_scope {
    #
    # $name     =   the name of the function within the containing scope.
    #               it can be undef for a nameless anonymous function.
    #
    # $scope    =   the containing scope of the function definition.
    #               always available.
    #
    # $owner    =   the owner of the function: a scope, class, or prototype.
    #               for anonymous functions, this is undef.
    #
    # $class    =   the containing class of the function (if any)
    #               it is available for all functions and methods within a class
    #               construct, even if they are private, etc.
    #
    # $ins      =   the $ins in the scope where the function is defined
    #
    # $is_prop  =   the function is a computed property.
    #               only makes sense if this is a method.
    #
    # $p_set    =   the computed property should be set after evaluating
    #               only makes sense with $is_prop.
    #
    my ($event, $name, $scope, $owner, $class, $ins, $is_prop, $p_set) = @_;

    $event->{class}       = $class;
    $event->{outer_scope} = $scope;
    $event->{ins}         = $ins;

    weaken($event->{class}) if $event->{class};
    weaken($event->{ins})   if $event->{ins};

    $owner->set_property($name => $is_prop ? sub {
        Ferret::Function::_handle_property($event, $p_set ? $name : undef, @_);
    } : $event) if defined $name;
    $owner->set_underlying_property_code($name => $event)
        if defined $name && $is_prop;

    return $event;
}

#####################
### MISCELLANEOUS ###
#####################

# returns the default function's signature.
sub signature_string {
    my $event = shift;
    my $default = $event->default_func or return '';
    return $default->signature_string;
}

# returns the default function's detailed signature.
sub detailed_signature_string {
    my $event = shift;
    my $default = $event->default_func or return '';
    return $default->detailed_signature_string;
}

# fetch the global ferret prototype from which all events inherit.
sub _global_event_prototype {
    my $f = shift;
    return $f->{event_proto} ||= do {
        my $proto = Ferret::Prototype->new($f, proto_name => 'Event');
        $proto->set_property(signature => sub {
            my ($event) = @_;
            Ferret::String->new($f, str_value => $event->signature_string)
        });
        $proto->set_property(detailedSignature => sub {
            my ($event) = @_;
            Ferret::String->new($f, str_value => $event->detailed_signature_string)
        });
        $proto;
    };
}

sub _call_together {
    my ($event_class, $arguments, $call_scope) = @_;
    my @event_objs = $arguments->plist('events') or return;
    my $e_return = Ferret::Return->new($event_class->f);

    return fmethod(sub {
        my (undef, $e_arguments) = @_;

        # prepare each event.
        my @raw_events;
        foreach my $event (@event_objs) {
            # ($arguments, $call_scope, $return, $pos, $detail)
            my $events = $event->prepare($e_arguments, $call_scope, $e_return);
            push @raw_events, @$events;
        }

        # _do_call($return, $detail $events) -> ($fire, $ret)
        my ($fire, $ret) = _do_call($e_return, undef, \@raw_events);
        $_->{most_recent_fire} = $fire for @event_objs;

        return $ret;
    }, 'callTogether');
}

sub default_func { shift->{default_func} }
sub is_method    { shift->{is_method} }

sub description {
    my $event = shift;
    my $type = 'Event';
    $type  .= " '$$event{name}'" if length $event->{name};
    my $sig = $event->detailed_signature_string;
    $type  .= " { $sig }" if length $sig;
    return $type;
}

1
