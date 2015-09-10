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
my $undefined = \'undefined';                # TODO
sub true      () { state $true  = \'true'  } # TODO
sub false     () { state $false = \'false' } # TODO

# fetch undefined value or test if a value is undefined.
sub undefined(;$) {
    my $test = shift;
    return $undefined if not defined $test;
    return $test == $undefined;
}

# returns Perl boolean of whether a Ferret value is true.
sub truth {
    # TODO: actually make rules for truth of values
    my $val = shift;
    return if !defined $val;
    return if $val == false;
    return if undefined($val);
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

    # create a class.
    my $class = Ferret::Class->new($f,
        name         => $opts{name},
        version      => $opts{version},
        perl_package => $opts{perl_package}
    );

    my $add_func = sub {
        my ($is_method, $name, %opts) = @_;

        # fetch or create event.
        my $where = $is_method ? $class->prototype : $class;
        my $event = $where->has_property($name) ?
            $class->property($name) : do {
            my $e = Ferret::Event->new($f,
                name      => $name,
                is_method => $is_method
            );
            $where->set_property($name => $e);
            $e;
        };

        # create function.
        my $func = Ferret::Function->new($f,
            name      => $opts{callback} || 'default',
            code      => $opts{code},
            class     => $class, # sometimes changed by ->inside_scope()
            is_method => $is_method
        );

        # add needs.
        $func->add_argument(
            name   => $_->{name}
            # type => $_->{type}
        ) foreach _parse_method_args($opts{need});

        # add wants.
        $func->add_argument(
            name     => $_->{name},
            # type   => $_->{type},
            optional => 1
        ) foreach _parse_method_args($opts{want});

        # add the function.
        $event->add_function($func);

    };

    # add functions.
    while (my ($name, $opts) = splice @{ $opts{functions} }, 0, 2) {
        $add_func->(0, $name, %$opts);
    }

    # add methods.
    while (my ($name, $opts) = splice @{ $opts{methods} }, 0, 2) {
        $add_func->(1, $name, %$opts);
    }

    # find the context.
    my $context = $f->main_context;
    if (length $opts{package}) {
        $context = $f->get_context($opts{package});
    }
    
    $context->set_property($_ => $class)
        foreach ($class->{name}, split /\s+/, $opts{alias} || '');
    return $class;
}

sub _parse_method_args {
    my ($str, @args) = shift;
    return if not defined $str;
    foreach my $arg (split /\s+/, $str) {
        my ($name, $type) = split /:/, $arg, 2;
        $name =~ s/^\$//;
        push @args, {
            name => $name,
            type => $type
        };
    }
    return @args;
}

sub bind_constructor {
    my ($class, $f, %opts) = @_;
    # consider: what if you want a different context?
    # consider: what if you want constructor arguments?
    my $class_name = $class_bindings{$class}{name};
    my $obj = $f->main_context->property($class_name)->call([ ]);
    %$obj = (%$obj, %opts);
    return $obj;
}

###############
### RUNTIME ###
###############

my (@notifiers, $loop);

sub init_runtime {
}

sub add_notifier {
    my $notifier = shift;
    push @notifiers, $notifier;
    $loop->add($notifier) if $loop;
}

sub remove_notifier {
    my $notifier = shift;
    @notifiers = grep { $_ != $notifier } @notifiers;
    $loop->remove($notifier) if $loop;
}

sub runtime {
    return unless @notifiers;
    require IO::Async::Loop;
    $loop = IO::Async::Loop->new;
    $loop->add($_) foreach @notifiers;
    while ($loop->notifiers) {
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

1
