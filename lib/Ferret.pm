# Copyright (c) 2013 Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util 'blessed';
our ($ferret, $core_context, %tried_files, %class_bindings);

# create a new ferret.
sub new {
    my ($class, %opts) = @_;
    my $f = bless {}, $class;

    # create the global object initializer.
    $f->{object_initializer} = Ferret::Function->new($f, code => sub {
        my (undef, $arguments) = @_;
        my $new = Ferret::Object->new($f);
        $new->set_property($_ => $arguments->{$_}) foreach keys %$arguments;
        return $new;
    });

    # create the core and main context objects.
    $f->{context}{core} ||=
        $core_context   ||= Ferret::Core::Context->new($f, %opts);
    $f->{context}{main} ||= Ferret::Context->new($f,
        %opts,
        parent => $f->{context}{core}
    );

    # add Perl bindings.
    $f->add_bindings(%class_bindings) unless $f->{no_bindings};

    return $f;
}

##############
### VALUES ###
##############

# object constants.
my $undefined = Ferret::Object->new;
sub true      () { state $true  = Ferret::Object->new } # TODO
sub false     () { state $false = Ferret::Object->new } # TODO

# fetch undefined value or test if a value is undefined.
sub undefined(;$) {
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
    return !!$val;
}

# returns Perl boolean of whether or not a value is a valid Ferret value.
sub valid_value {
    defined(my $value = shift) or return;

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

################
### CONTEXTS ###
################

sub main_context { shift->{context}{main}   }
sub core_context { shift->{context}{core}   }

# fetch a context or create it.
sub get_context  {
    my ($f, $name) = @_;
    return $f->{context}{$name} if $f->{context}{$name};
    # TODO: if the context is like A::B, B should inheit from A.
    my $context = Ferret::Context->new($f, parent => $f->main_context);
    return $f->{context}{$name} = $context;
}

##################
### NAMESPACES ###
##################

# fetch a class or namespace.
# if necessary, load it.
sub space {
    my ($scope, $space) = @_;
    my $file = c2s("$space.frt.pm");

    # already tried this file, or the namespace/class exists.
    my $val = $scope->property($space);
    return $val if $val || $tried_files{$file};

    # load it.
    do $file or do { print "error in $file: $@\n" if $@ };
    $tried_files{$file} = 1;
    return $scope->property($space);

}

sub c2s { my $c = shift; $c =~ s/::/\//g; $c }
sub s2c { my $s = shift; $s =~ s/\//::/g; $s }

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

    # find the context.
    my $context = $f->main_context;
    if (length $opts{package}) {
        $context = $f->get_context($opts{package});
    }

    # create a class.
    my $class = Ferret::Class->new($f,
        name         => $opts{name},
        version      => $opts{version},
        perl_package => $opts{perl_package}
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

###############
### RUNTIME ###
###############

my $loop;
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
}

sub remove_notifier {
    my $notifier = shift;
    return unless $loop;
    $loop->remove($notifier);
}

sub loop_connect {
    init_runtime() if !$loop;
    return $loop->connect(@_);
}

sub runtime {
    return unless $loop;
    while ($loop->notifiers || $keep_alive) {
        $loop->loop_once;
    }
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
use Ferret::List;
use Ferret::Hash;
use Ferret::Set;
use Ferret::Core::Functions;
use Ferret::Core::Context;

use Evented::Object;

1
