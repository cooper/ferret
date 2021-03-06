# Copyright (c) 2015, Mitchell Cooper
package Ferret::Class;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Context';

use Scalar::Util qw(weaken blessed);
use Ferret::Core::Conversion qw(
    plist ferror fmethod pcoderef_normalized
    FUNC_V1 FUNC_RET FUNC_ARGS FUNC_POS
);

Ferret::bind_class(
    name => 'Class',
    init => sub {
        my $ret = $_[FUNC_RET];
        my $err = ferror(
            'Classes cannot be created with the Class class constructor; '.
            'use the class keyword instead',
            'InvalidInitialization'
        );
        return $ret->fail($err);
    },

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
    $opts{prototype} ||= Ferret::Prototype->new($f, proto_name => $opts{name});

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

    return $class;
}

######################
### INITIALIZATION ###
######################

# "calling" a class is creating an instance.
sub call {
    my ($class, $args, undef, undef, $pos) = @_;

    # if passed an instance, return the instance.
    if (ref $args eq 'ARRAY' && @$args == 1) {
        return $args->[0] if $args->[0]->instance_of($class);
    }

    # create a new object.
    my $obj = Ferret::Object->new($class->f);

    # initialize it.
    my $ret = $class->init($obj, $args, $pos);

    # if it failed, return the return object with no instance.
    # it will yield a boolean false value.
    if ($ret->failed) {
        $ret->delete_property('instance');
        return $ret;
    }

    # otherwise, return the instance.
    return $ret->property('instance');
}

# initialize an object.
sub init {
    my ($class, $obj, $args, $pos) = @_;

    # add the class prototype to the object.
    $obj->add_parent($class->prototype)
        unless $obj->has_parent($class->prototype);

    # before the initializer is called, the generics are still available.
    # if no generics are currently available, set them to Any.
    $class->set_generics([]) if !$class->{force_generics};
    $obj->{generics}{$class} = delete $class->{force_generics};

    # fetch or create return object.
    my $fire;
    my $ret = Ferret::Return->new($class->f);

    # make sure the right number of generics are available.
    my $need = $class->generics_required;
    my $have = $obj->{generics}{$class} ?
        scalar keys %{ $obj->{generics}{$class} } : 0;
    if ($have < $need) {
        return $ret->fail(ferror(
            "Not enough generic types. $need generics are required."
        ));
    }

    # call the initializer.
    my $init_ret;
    if ($class->has_property('initializer__')) {
        my $init = $class->property('initializer__');
        $init_ret = $init->call_with_self(
            $obj,
            $args,
            $class->{outer_scope},
            $ret,
            $pos
        );
        $fire = $init->{most_recent_fire};
        Ferret::inspect($ret) if $$class{name} eq 'K';
    }

    # override return object from a Perl implementation
    $obj = delete $obj->{override_init_obj}
        if $obj->{override_init_obj};

    # in Ferret code, another object was explicitly returned. this cannot
    # happen for init functions written in Perl, because the bind_method call
    # purposely masks the return value. in Perl you can only override_init_obj.
    $obj = $init_ret if
        $init_ret != $obj                   &&
        !Ferret::undefined($init_ret)       &&
        !$init_ret->isa('Ferret::Return');

    # all initializers failed
    if ($ret->failed) {
        $obj->remove_parent($class->prototype);
        $ret->delete_property('instance');
        return $ret;
    }

    # inject instance property
    $ret->set_property(instance => $obj);

    # # if init's default func failed (returned undef),
    # # a need was not satisfied. in this case, we will return instance as
    # # the empty object. therefore a class call will return undef.
    # # FIXME: this probably needs updated since adding multiple initializers
    # if ($fire && !defined $fire->return_of('default')) {
    #     $obj->remove_parent($class->prototype);
    # }


    return $ret;
}

###############
### BINDING ###
###############

# bind a method or class function, creating an event
sub bind_function { _bind_function(0, @_) }
sub bind_method   { _bind_function(1, @_) }

sub _bind_function {
    my ($is_method, $class, $name, %opts) = @_;
    my $f = $class->f;

    # create function.
    my $func = Ferret::Function->new($f,
        code        => pcoderef_normalized($opts{code}),
        name        => $opts{cbnm}      || $opts{cb_name} || 'default',
        need        => $opts{need},
        want        => $opts{want},
        rtrn        => $opts{rtrn},
        mimic       => $opts{mimic},
        all_opt     => $opts{all_opt},
        is_method   => $is_method,
        pending_add => 1
    );

    # assign the event to the property.
    my $where = $is_method ? $class->prototype : $class;
    $func->inside_scope($name =>
        undef,          # outer scope
        $where,         # owner
        $class,         # class
        undef,          # ins
        $opts{prop},    # is computer property?
        $opts{pset}     # set property after evaluating?
    );
}

################
### GENERICS ###
################

# set the generic types tempoarily.
sub set_generics {
    my ($class, $generics) = @_;

    # not enough generics.
    return if scalar @$generics < $class->generics_required;

    # map letter to type.
    my $any = $class->f->core_context->property('Any');
    my %generic_map = map {
        my $letter = $class->{generic_letters}[$_];
        $letter    = $$letter if ref $letter;
        $letter => $generics->[$_] || $any
    } 0..$#{ $class->{generic_letters} };

    # this is deleted after first use.
    # it is intended for class functions only, including the initializer.
    # for methods, the generics are fetched from the instance itself.
    $class->{force_generics} = \%generic_map;

    return 1;
}

# unset generics.
sub reset_generics {
    my $class = shift;
    delete $class->{force_generics};
}

# add generic leters.
# if passed as a reference, it is optional.
sub add_generics {
    my ($class, @generic_letters) = @_;

    # making no changes = success.
    return 1 if !@generic_letters;

    my $g = $class->{generic_letters} ||= [];
    my $had_any = !$class->{just_created};
    my @final;

    for my $i (0..$#generic_letters) {

        # if the existing def doesn't have one at this spot, accept it.
        # if it does exist, it better be the same.
        if (length $g->[$i]) {
            if (ref $g->[$i]) {
                return if !ref $generic_letters[$i];
                return if ${ $g->[$i] } ne ${ $generic_letters[$i] };
            }
            else {
                return if ref $generic_letters[$i];
                return if $g->[$i] ne $generic_letters[$i];
            }
        }

        # if this is an extension, all new ones must be optional.
        if ($had_any && !$g->[$i] && !ref $generic_letters[$i]) {
            return;
        }

        $g->[$i] = $generic_letters[$i];
    }

    return 1;
}

# returns the number of generics required.
sub generics_required {
    my $class = shift;
    return scalar grep !ref, @{ $class->{generic_letters} || [] };
}

#####################
### MISCELLANEOUS ###
#####################

sub prototype { shift->{prototype} }

# return the global ferret prototype from which all classes inherit.
sub _global_class_prototype {
    my $f = shift;
    return $f->{class_proto} ||= do {
        my $proto = Ferret::Prototype->new($f, proto_name => 'Class');
        $proto->set_property(init => _global_init($f));
        $proto->set_property(signature => sub {
            my ($class) = @_;
            Ferret::String->new(
                $class->f,
                str_value => $class->signature_string
            );
        });
        $proto->set_property(fullName => sub {
            my ($class) = @_;
            Ferret::String->new(
                $class->f,
                str_value => $class->full_name
            )
        });
        $proto;
    };
}

# SomeClass.init($obj)(initializer arguments)
sub _global_init {
    my $f = shift;
    return $f->{_global_class_init} ||= fmethod(sub {
        my ($weak_class, $args) = &FUNC_V1;
        my $obj = delete $args->{obj};
        weaken($weak_class);
        return Ferret::Function->new($obj->f,
            mimic   => $weak_class->property('initializer__') || undef,
            code    => sub {
                $weak_class->init($obj, $_[FUNC_ARGS], $_[FUNC_POS]);
            },
            all_opt => 1
        );
    }, 'init', '$obj');
}

sub generics_string {
    my $class = shift;
    return join ', ', map {
        ref() ? "$$_?" : $_
    } @{ $class->{generic_letters} || [] };
}

sub signature_string {
    my $class = shift;
    my $init = $class->property('initializer__');
    return $init ? $init->signature_string : '';
}

sub detailed_signature_string { &signature_string }

sub name {
    my $class = shift;
    return $class->{name};
}

sub full_name {
    my $class = shift;
    my $name = $class->{full_name};
    return $class->name if !length $name;
    $name =~ s/^(CORE|main):://;
    return $name;
}

sub description {
    my $class = shift;
    my $gen   = $class->generics_string;
    my $sig   = $class->signature_string;
    my $desc  = "Class '$$class{name}'";
    $desc    .= " $$class{version}" if $class->{version};
    $desc    .= " <$gen>"           if length $gen;
    $desc    .= " { $sig }"         if length $sig;
    return $desc;
}

1
