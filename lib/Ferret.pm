# Copyright (c) 2015, Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util 'blessed';
use Ferret::Shared::Utils qw(file_for_space);

our (
    $ferret,                # the global Ferret instance
    %tried_files,           # which .pm's have we tried to load?
    %file_map,              # map .pm to .frt
    %specials,              # special properties for all objects
    $ferret_libs            # array ref of lib dirs from configuration
);

my (
    %class_bindings,        # class bindings by Perl package name
    %delay_class_bindings   # class bindings pending Class creation
);

sub FUNC_SELF   () { 0 }
sub FUNC_ARGS   () { 1 }
sub FUNC_CSCOPE () { 2 }
sub FUNC_SCOPE  () { 3 }
sub FUNC_RET    () { 4 }
sub FUNC_FUNC   () { 5 }
sub FUNC_THIS   () { 6 }
sub FUNC_INS    () { 7 }

# create a new ferret.
sub new {
    my ($class, %opts) = @_;

    # create a Ferret. set $ferret such that ffunction(), etc. will work.
    $ferret ||= my $f = bless {}, $class;

    # create the global special object.
    $f->{special} = Ferret::Object->new($f, is_special => 1);
    $f->{special}->set_property($_ => $specials{$_})
        foreach keys %specials;

    # create the core and main context objects.
    $f->{context}{CORE} ||= Ferret::Core::Context->new($f,
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
    $undefined ||= Ferret::Undefined->new($ferret);
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
    return if blessed $val && $val->isa('Ferret::Return') && !$val->true_return;
    return !!$val;
}

# returns Perl boolean of whether or not a value is a valid Ferret value.
sub valid_value {
    defined(my $value = shift) or return;
    return blessed $value && $value->isa('Ferret::Object');
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
    my ($f, $name, $pos) = @_;

    # might already have this context cached.
    return $f->{context}{$name} if $f->{context}{$name};
    my @parts = split /::/, $name;

    # create/find contexts
    my $full_name;
    my $c = $f->main_context; # changed 03/01/2017 from core
    for my $part (@parts) {
        $full_name = length $full_name ? "${full_name}::$part" : $part;
        
        # context already exists here
        my $new = $c->property($part);
        if ($new) {
            $c = $new;
            next;
        }
        
        # try loading a context here
        # ($context, $file_name, $die, $pos, @acceptable)
        $new = space($c, undef, undef, undef, $part);
        if ($new) {
            $c = $new;
            next;
        }
        
        # create a new context here
        $new = Ferret::Context->new($f,
            name      => $part,
            full_name => $full_name,
            parent    => $c,
        );
        $c->set_property($part => $new);
        $c = $new;
    }
    continue {
        Ferret::Core::Errors::throw(ExtensionOfNonContext => $pos, [
            Object => $c->description_ol
        ], $name, $full_name)
            if !$c->isa('Ferret::Context') && !$c->isa('Ferret::Class');
    }

    return $f->{context}{$name} = $c;
}

sub get_context_or_class { eval { &get_context } || &_bind_get_class }

# determine whether to reuse or create a class.
sub get_class {
    my ($f, $context, $class_name) = @_;

    # default to main context
    if (!defined $class_name) {
        $class_name = $context;
        $context = $f->main_context;
    }

    my ($class, $owner) = $context->_property($class_name);
    space($context, undef, undef, undef, $class_name) if !$class;
    ($class, $owner) = $context->_property($class_name);

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
    my ($context, $file_name, $die, $pos, @acceptable) = @_;
    @acceptable = grep defined, @acceptable;
    foreach my $space (@acceptable) {
        
        # before all else, check if this exists
        my $existing = $context->property($space);
        return $existing if $existing;
        
        # ok, at this point we will try to load the file

        # already tried this file
        my $file = file_for_space($space);
        return $existing
            if $tried_files{$file}++;

        # do the file
        do $file or do {
            if ($@) {
                die "error in $file: ".$@->description."\n" if ref $@;
                local $@ = "\n    $@" if !index($@, 'error in');
                die "error in $file: $@\n";
                return;
            }
            next if $!; # not found
            die "error in $file: did not return a true value\n";
            return;
        };

        return $context->property($space);
    }

    # if $die, throw an error
    Ferret::Core::Errors::throw(
        UnresolvedDependencies => $pos, undef,
        $acceptable[-1]
    ) if $die;

    # otherwise store it for the after_content() check
    push @{ $context->f->{pending_spaces}{$file_name} ||= [] },
        [ $context, @acceptable ] if defined $file_name;
}

sub check_spaces {
    my ($f, $file_name, $pos, $die) = @_;
    my @spaces = @{ $f->{pending_spaces}{$file_name} || [] };
    return if !@spaces; # success
    SPACE: for (@spaces) {
        my ($context, @acceptable) = @$_;

        # try to load again
        next if space($context, $file_name, $die, $pos, @acceptable);

        # failed
        return join '|', @acceptable;
    }
    return; # success
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
        $class->bind_function('initializer__', code => sub {
            bless $_[FUNC_SELF], $opts{perl_package};
            $init->(@_);
            $_[FUNC_RET]; # ignore whatever Perl implementation returns
        }, need => $opts{init_need}, want => $opts{init_want});
    }

    # add generics.
    if (my $generics = $opts{generics}) {
        $class->add_generics(@$generics);
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
    $arguments->{$_} = Ferret::Core::Conversion::ferretize($arguments->{$_})
        for keys %$arguments;

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

####################
### RUNTIME LOOP ###
####################

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

#################
### UTILITIES ###
#################

# This is for very commonly used runtime-specific utilities. Those which may be
# shared between the compiler and runtime must be in Ferret::Shared::Utils.

sub inspect {
    my $f = $ferret or return;
    my ($val, $detailed) = @_;
    $f->main_context->property('inspect')->call({
        value    => $val,
        detailed => $detailed ? true : false
    });
}

sub dump {
    my $obj = shift;
    my $type;
    if (blessed $obj) {
        my @parents = map $_->{proto_class}{name}, $obj->parents;
        my $type    = join(',', @parents);
    }

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj);
    print " = [ $type ] $obj\n" if length $type;
    print "\n";
}

################
### INCLUDES ###
################

use Ferret::Object;
use Ferret::Undefined;
use Ferret::NATIVE;
use Ferret::Error;
use Ferret::String;
use Ferret::Regex;
use Ferret::Number;
use Ferret::Context;
use Ferret::Function;
use Ferret::Event;
use Ferret::Class;
use Ferret::Prototype;
use Ferret::List;
use Ferret::Hash;
use Ferret::Boolean;
use Ferret::Symbol;
use Ferret::Error;

use Ferret::Core::Conversion;
use Ferret::Core::Functions;
use Ferret::Core::Specials;
use Ferret::Core::Context;
use Ferret::Core::Errors;
use Ferret::Core::FF;

use Evented::Object;

1
