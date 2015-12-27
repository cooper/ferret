# Copyright (c) 2015, Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util 'blessed';
use Ferret::Shared::Utils qw(ns_to_slash build_name);

our (
    $ferret,            $core_context,
    %tried_files,       %file_map,
    %class_bindings,    %delay_class_bindings,
    %specials,          @ferret_libs
);

# create a new ferret.
sub new {
    my ($class, %opts) = @_;
    my $f = bless {}, $class;

    # create the global special object.
    $f->{special} = Ferret::Object->new($f);
    $f->{special}->set_property($_ => $specials{$_})
        foreach keys %specials;

    # create the global object initializer.
    $f->{object_initializer} = Ferret::Function->new($f,
        name => 'objectInitializer',
        code => sub {
            my (undef, $arguments) = @_;
            my $new = Ferret::Object->new($f);
            $new->set_property($_ => $arguments->{$_})
                foreach keys %$arguments;
            return $new;
        }
    );

    # create the core and main context objects.
    $f->{context}{CORE} ||=
        $core_context   ||= Ferret::Core::Context->new($f,
        %opts,
        name => 'CORE'
    );
    $f->{context}{main} ||= Ferret::Context->new($f,
        %opts,
        name   => 'main',
        parent => $f->{context}{CORE}
    );

    # add the Perl bindings.
    $f->{context}{CORE}->add_global_functions();
    $f->add_bindings(%class_bindings) unless $f->{no_bindings};

    return $f;
}

##############
### VALUES ###
##############

# object constants.
my $undefined;
sub true  () { state $true  = Ferret::Boolean->new($ferret, bool_value => 1, real => 1) }
sub false () { state $false = Ferret::Boolean->new($ferret, bool_value => 0, real => 1) }

# fetch undefined value or test if a value is undefined.
sub undefined(;$) {
    $undefined ||= Ferret::Object->new($ferret, faketype => 'Undefined');
    return $undefined if !@_;
    my $test = shift;
    return 1 if !defined $test;
    return $test == $undefined;
}

# returns Perl boolean of whether a Ferret value is true.
sub truth {
    # TODO: actually make rules for truth of values
    my $val = shift;
    return if !defined $val;
    return if $val == false;
    return if undefined $val;
    return if $val->{is_return} && $val->empty_return;
    return !!$val;
}

# returns Perl boolean of whether or not a value is a valid Ferret value.
sub valid_value {
    defined(my $value = shift) or return;

    # everything below this line is pending deletion
    return blessed $value && $value->isa('Ferret::Object');

    # if it's one of these non-object values, it's good.
    if ($value == undefined || $value == true || $value == false) {
        return 1;
    }

    # if it's an object, it's good.
    if (blessed($value) && $value->isa('Ferret::Object')) {
        return 1;
    }

    # it is none of these; not good.
    return;

}

sub zero {
    my $f = shift;
    return $f->{zero} ||= Ferret::Number->new($f,
        num_value => 0,
        zero => 1
    );
}

################
### CONTEXTS ###
################

sub main_context { shift->{context}{main}   }
sub core_context { shift->{context}{CORE}   }

# fetch a context or create it.
sub get_context  {
    my ($f, $name) = @_;
    return $f->{context}{$name} if $f->{context}{$name};

    # something exists here which is not a context.
    if (my $c = $f->core_context->property($name)) {
        return $c if $c->isa('Ferret::Context');
        return;
    }

    # create a context.
    my $context = Ferret::Context->new($f,
        name   => $name,
        parent => $f->core_context
    );
    $f->core_context->set_property($name => $context);

    return $f->{context}{$name} = $context;
}

# determine whether to reuse or create a class.
sub get_class {
    my ($f, $context, $class_name) = @_;
    my ($class, $owner) = $context->_property($class_name);
    return unless $class && $class->isa('Ferret::Class');

    # if the context owns the class, use it.
    return $class if $owner == $context;

    # if the owner is the core context
    # and the class context is the main context,
    # go ahead and use it.
    #
    # for example, from the main package:
    # class String   will extend the CORE::String
    #
    return $class if $owner   == $f->core_context &&
                     $context == $f->main_context;

    # don't use this class
    return;

}

##################
### NAMESPACES ###
##################

# fetch a class or namespace.
# if necessary, load it.
sub space {
    my ($context, $caller, $space) = @_;
    my $file = build_name(ns_to_slash("$space.frt.pm"));

    # already tried this file, or the namespace/class exists.
    # ignore the value unless the owner is this context.
    my ($val, $owner) = $context->_property($space);
    return $val if $val && $owner == $context;
    return $val if $tried_files{$file};

    $tried_files{$file} = 1;
    do $file or do { print "error in $file: $@" and return if $@ };

    return $context->property($space);
}

####################
### PERL BINDING ###
####################

sub bind_class {
    my %opts = @_;
    my $call = caller;
    $opts{perl_package} = $call;
    $class_bindings{$call} = \%opts;
    $ferret->add_binding(%opts) if $ferret;
}

sub add_bindings {
    my ($f, %bindings) = @_;
    $f->add_binding(%$_) foreach values %bindings;
}

sub add_binding {
    my ($f, %opts) = @_;

    # already bound.
    my $exists = $class_bindings{ $opts{perl_package} }{class};
    return $exists if $exists;

    # find the context.
    my $context = $f->core_context;
    if (length $opts{package}) {
        $context = $f->get_context($opts{package});
    }

    # find parent class.
    my $parent_class;
    if (length $opts{parent}) {
        $parent_class = $f->_bind_get_class($opts{parent});

        # not yet available.
        if (!$parent_class) {
            push @{ $delay_class_bindings{ $opts{parent} } ||= [] }, \%opts;
            return;
        }
    }

    # create a class.
    my $class = Ferret::Class->new($f,
        name         => $opts{name},
        version      => $opts{version},
        perl_package => $opts{perl_package},
        parent_class => $parent_class
    );

    # add functions.
    while (my ($name, $opts) = splice @{ $opts{functions} }, 0, 2) {
        $class->bind_function($name, %$opts);
    }

    # add methods.
    while (my ($name, $opts) = splice @{ $opts{methods} }, 0, 2) {
        $class->bind_method($name, %$opts);
    }

    # add init.
    if (my $init = $opts{init}) {
        $class->bind_function('_init_', code => sub {
            bless $_[0], $opts{perl_package};
            $init->(@_);
            # return value is ignored here
        }, need => $opts{init_need}, want => $opts{init_want});
    }

    # define the event in the context.
    $context->set_property($_ => $class)
        foreach ($class->{name}, split /\s+/, $opts{alias} || '');

    # on_bind callback with class object.
    $opts{on_bind}($class) if $opts{on_bind};

    # other binding was delayed.
    if (my $delayed = $delay_class_bindings{ $class->{name} }) {
        $f->add_binding(%$_) foreach @$delayed;
        delete $delay_class_bindings{ $class->{name} };
    }

    return $class_bindings{ $opts{perl_package} }{class} = $class;
}

sub bind_constructor {
    my ($perl_class, $f, %opts) = @_;

    # find the class object.
    my $class = $class_bindings{$perl_class}{class} or return;

    # find init arguments.
    my $arguments = delete $opts{init_args} || {};

    # create and bless an object.
    my $obj = Ferret::Object->new($f, %opts);
    bless $obj, $perl_class;

    # initialize it; return the instance.
    my $ret = $class->init($obj, $arguments);
    return $ret->property('instance');

}

sub _bind_get_class {
    my ($f, $name) = @_;
    return undef if !length $name;

    # find context.
    # FIXME: if $name has a namespace, respect that.
    my $context = $f->core_context; # temporary.

    # find class.
    my $class_maybe = $context->property($name);
    return $class_maybe if $class_maybe && $class_maybe->isa('Ferret::Class');

    return undef;
}

###############
### RUNTIME ###
###############

my ($loop, @notifiers);
our $keep_alive = 0;

sub init_runtime {
    return $loop if $loop;
    require IO::Async::Loop;
    $loop = IO::Async::Loop->new;
}

sub add_notifier {
    my $notifier = shift;
    init_runtime();
    $loop->add($notifier);
    push @notifiers, $notifier;
}

sub remove_notifier {
    my $notifier = shift;
    return unless $loop;
    $loop->remove($notifier);
    @notifiers = grep { $_ != $notifier } @notifiers;
}

sub loop_connect {
    init_runtime() if !$loop;
    return $loop->connect(@_);
}

my $looping;
sub runtime {
    return 1 unless $loop;
    return 1 if $looping;
    $looping = 1;
    while (@notifiers || $keep_alive) {
        $loop->loop_once;
    }
    undef $looping;
    return 1;
}

################
### INCLUDES ###
################

use Ferret::Object;
use Ferret::String;
use Ferret::Number;
use Ferret::Context;
use Ferret::Function;
use Ferret::Event;
use Ferret::Class;
use Ferret::Prototype;
use Ferret::List;
use Ferret::Hash;
use Ferret::Set;
use Ferret::Boolean;
use Ferret::Symbol;

use Ferret::Core::Functions;
use Ferret::Core::Specials;
use Ferret::Core::Context;
use Ferret::Core::Errors;
use Ferret::Core::FF;

use Evented::Object;

1
