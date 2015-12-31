# Copyright (c) 2015, Mitchell Cooper
package Ferret::Class;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(plist);
use Scalar::Util qw(weaken);

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

    # add class parents' prototypes
    if (my $classes = delete $opts{parent_class} || delete $opts{parent_classes}) {
        my @classes = ref $classes eq 'ARRAY' ? @$classes : ($classes);
        $opts{prototype}->add_parent($_) for map $_->prototype, @classes;
    }

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
    my ($name, $version) = @$class{'name', 'version'};
    $class->set_property(name => Ferret::String->new($f, str_value => $name));
    $class->set_property(version =>
        Ferret::Number->new($f, num_value => $version)
    ) if $version;

    # set type.
    $class->set_property(Set => [ \&_get_set_type ])
        unless $class->{name} eq 'Set';

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
    my ($class, $args) = @_;

    # if passed an instance, return the instance.
    if (ref $args eq 'ARRAY' && @$args == 1) {
        return $args->[0] if $args->[0]->instance_of($class);
    }

    # create a new object.
    my $obj = Ferret::Object->new($class->f);

    # initialize it; return the instance.
    my $ret = $class->init($obj, $args);
    return $ret->property(lc $class->{name});

}

# initialize an object.
sub init {
    my ($class, $obj, $args) = @_;

    # add the class prototype to the object.
    $obj->add_parent($class->prototype)
        unless $obj->has_parent($class->prototype);

    # fetch or create return object.
    my $fire;
    my $ret = Ferret::Return->new($class->f);
    if ($class->has_property('_init_')) {
        my $init = $class->property('_init_');
        $init->call_with_self(
            $obj,
            $args,
            $class->{outer_scope},
            $ret
        );
        $fire = $init->{most_recent_fire};
    }

    # strong override.
    $obj = $obj->{override_init_obj} if $obj->{override_init_obj};

    # inject instance properties.
    $ret->set_property(instance => $obj);
    $ret->set_property(lc $class->{name} => $obj);

    # if init's default func failed (returned undef),
    # a need was not satisfied. in this case, we will return instance as
    # the empty object. therefore a class call will return undef.
    if ($fire && !defined $fire->return_of('default')) {
        $ret->delete_property(lc $class->{name});
        $obj->remove_parent($class->prototype);
    }

    return $ret;
}

my $dummy_cb_func = sub { $_[4] };

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
        $e->inside_scope($name =>
            undef,          # outer scope
            $where,         # owner
            $class,         # class
            $opts{prop},    # is computer property?
            $opts{pset}     # set property after evaluating?
        );
        $e;
    };

    # create function.
    my $func = Ferret::Function->new($f,
        name        => $opts{callback} || 'default',
        code        => $opts{code} || $dummy_cb_func,
        need        => $opts{need},
        want        => $opts{want},
        mimic       => $opts{mimic},
        is_method   => $is_method
    );

    # add the function.
    $event->add_function(undef, $func);

}

# return the global ferret prototype from which all classes inherit.
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
    return $f->{_global_class_init} ||= do {
        my $func = Ferret::Function->new($f,
            name        => 'init',
            is_method   => 1,
            code        => sub {
                my ($class, $args) = @_;
                my $obj = delete $args->{obj};
                return Ferret::Function->new($f,
                    mimic => $class->property('_init_') || undef,
                    code  => sub {
                        my (undef, $args) = @_;
                        return $class->init($obj, $args);
                    }
                );
            }
        );
        $func->add_argument(name => 'obj');
        $func;
    };
}

sub _get_set_type {
    my ($class, $f) = ($_[1], $_[1]->f);
    my $global_set_class = $f->get_class($f->core_context, 'Set');

    # create a class for the set type.
    my $set_type = Ferret::Class->new($f,
        name => 'Set',
        parent_class => $global_set_class
    );

    # create an initializer.
    $set_type->bind_function('_init_', code => sub {
        my ($set, $args) = @_;

        # call the normal Set initializer.
        $global_set_class->init($set, $args);

        # force the set class.
        $set->{set_class} = $class;

        return $set;
    }, mimic => $global_set_class->property('_init_'));

    $set_type->bind_function('fromList', code => sub {
        my ($set_class, $args, $call_scope) = @_;
        my @items = $args->plist('list');
        return $set_class->call([ @items ], $call_scope);
    }, need => '$list:List');

    return $set_type;
}

1
