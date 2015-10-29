# Copyright (c) 2014, Mitchell Cooper
package Ferret::Class;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util 'weaken';

Ferret::bind_class(
    name => 'Class',

    # this relates to the class called Class.
    # it emulates a real class, but it's not truly such.
    #
    # explicitly setting the proto and proto class allows
    # functions such as Str.*isa(Class) to behave as expected.
    #
    on_bind => sub {
        my $class = shift;
        my $proto = _global_class_prototype($class->f);
        $class->set_property_weak(proto => $proto);
        weaken($proto->{proto_class} = $class);
    }
);

sub new {
    my ($class_name, $f, %opts) = @_;

    # create a prototype if necessary
    $opts{prototype} ||= Ferret::Prototype->new($f);

    # create a class
    my $class = $class_name->SUPER::new($f,
        faketype => 'Class',
        %opts
    );

    # class/prototype relations
    weaken($class->prototype->{proto_class} ||= $class);
    $class->add_parent(_global_class_prototype($f));
    $class->set_property_weak(proto => $class->prototype);

    # class name
    $class->set_property(name => [ sub {
        Ferret::String->new($f, str_value => $class->{name})
    }]);

    return $class;
}

sub add_var {
    # add a class variable
}

sub add_ivar {
    # add an instance variable
}

sub prototype { shift->{prototype} }

# "calling" a class is creating an instance.
sub call {
    my ($class, $arguments) = @_;

    # create a new object.
    my $obj = Ferret::Object->new($class->f);

    # initialize it; return the instance.
    my $ret = $class->init($obj, $arguments);
    return $ret->property('instance');

}

# initialize an object.
sub init {
    my ($class, $obj, $arguments) = @_;

    # add the class prototype to the object.
    $obj->add_parent($class->prototype);

    # fetch or create return object.
    my $ret = Ferret::Return->new($class->f);
    if ($class->has_property('_init_')) {
        my $init = $class->property('_init_');
        $init->call_with_self(
            $obj,
            $arguments,
            $class->{outer_scope},
            $ret
        );
    }

    # strong override.
    $obj = $obj->{override_init_obj} if $obj->{override_init_obj};

    # inject instance properties.
    $ret->set_property(instance => $obj);
    $ret->set_property(lc $class->{name} => $obj);

    return $ret;
}

# bind a method or class function, creating an event
sub bind_function { _bind_function(0, @_) }
sub bind_method   { _bind_function(1, @_) }

sub _bind_function {
    my ($is_method, $class, $name, %opts) = @_;
    my $f = $class->f;

    # fetch or create event.
    my $where = $is_method ? $class->prototype : $class;
    my $event = $where->has_property($name) ?
        $class->property($name) : do {
        my $e = Ferret::Event->new($f,
            name      => $name,
            is_method => $is_method,
            class     => $class
        );
        $where->set_property($name => $e);
        $e;
    };

    # create function.
    my $func = Ferret::Function->new($f,
        name      => $opts{callback} || 'default',
        code      => $opts{code},
        need      => $opts{need},
        want      => $opts{want},
        is_method => $is_method
    );

    # add the function.
    $event->add_function(undef, $func);

}

# return the global ferret protocol from which all classes inherit.
sub _global_class_prototype {
    my $f = shift;
    return $f->{class_proto} ||= do {
        my $proto = Ferret::Prototype->new($f);
        $proto->set_property(init => _global_init($f));
        $proto;
    };
}

sub _global_init {
    my $f = shift;
    my $func = Ferret::Function->new($f,
        name        => 'init',
        is_method   => 1,
        code        => sub {
            my ($class, $arguments) = @_;
            my $obj = delete $arguments->{obj};
            return Ferret::Function->new($f,
                mimic => $class->property('_init_') || undef,
                code  => sub {
                    my (undef, $arguments) = @_;
                    return $class->init($obj, $arguments);
                }
            );
        }
    );
    $func->add_argument(name => 'obj');
    return $func;
}

1
