# Copyright (c) 2015, Mitchell Cooper
package FF;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(ferret_string perl_boolean);

# fetch the global Ferret.
sub get_ferret {
    return $Ferret::ferret ||= Ferret->new;
}

# fetch true, false, undefined objects
sub get_constant_objects {
    return (Ferret::true, Ferret::false, Ferret::undefined);
}

# fetch the current context.
sub get_context {
    my ($f, $name) = @_;
    return $f->get_context($name);
}

# load the CORE module.
sub load_core {
    my $name = shift;

    # this is the CORE module, or it's already been done.
    return if $name eq 'CORE' || $INC{'CORE.frt.pm'};

    do 'build/CORE.frt.pm' or die "Core error: ".($@ || $!);
    return;
}

# things to do before evaluating runtime content.
sub before_content {
    my $base = shift;

    # remember we tried this file.
    $Ferret::file_map{ (caller)[1] } = $base;
    $Ferret::tried_files{"$base.pm"}++;

    return;
}

# things to do after evaluating runtime content.
sub after_content {

    # start the runtime.
    Ferret::runtime();

    # file returns true.
    return 1;

}

# load namespaces.
sub load_namespaces {
    my ($context, @namespaces) = @_;
    my @caller = caller;

    # consider package first.
    # e.g. Point -> Math::Point, Point
    my $pkg = $context->{name};
    if ($pkg ne 'CORE' && $pkg ne 'main') {
        my @map =
            map  { $pkg.'::'.$_ }
            grep { $pkg ne $_ && !/^\Q$pkg\E::/ } @namespaces;
        @namespaces = (@map, @namespaces);
    }

    Ferret::space($context, \@caller, $_) for @namespaces;
    return;
}

# create a simple object.
sub create_object {
    my ($f, $pairs) = @_;
    return Ferret::Object->new($f, initial_props => $pairs);
}

# create a hash.
sub create_hash {
    my ($f, $pairs) = @_;
    return Ferret::Hash->new($f, pairs => $pairs);
}

# create a list.
sub create_list {
    my ($f, $items) = @_;
    return Ferret::List->new($f, items => $items);
}

# create a set.
sub create_set {
    my ($scope, $first_item, @other_items) = @_;
    return $first_item->create_set($scope, @other_items);
}

# get a set type.
sub get_set_type {
    my ($f, $scope, $type_name) = @_;

    # the type class does not exist.
    my $class_maybe = $scope->property($type_name);
    if (!$class_maybe || !$class_maybe->isa('Ferret::Class')) {
        return Ferret::undefined;
    }

    return $class_maybe->property_u('Set');
}

sub get_symbol {
    my ($f, $name) = @_;
    return $f->{symbols}{$name} || Ferret::Symbol->new($f, init_args => {
        from => ferret_string($name)
    });
}

# attach an event callback.
sub on {
    my ($obj, $event_name, $self, $scope, $on_func, $_opts) = @_;
    my $event = $obj->property($event_name);
    my %opts  = $_opts && ref $_opts eq 'HASH' ? %$_opts : ();

    # if $event exists and is not an event, runtime error.
    if ($event && !$event->isa('Ferret::Event')) { # TODO: proper type checking
        die; # FIXME
        throw();
    }

    # create the event if it doesn't exist.
    if (!$event) {
        $obj->set_property($event_name =>
            Ferret::Event->new($obj->f, name => $event_name)
        );
        $event = $obj->property($event_name); # set last_parent.
    }

    # add the function.
    @opts{'self', 'outer_scope'} = ($self, $scope);
    $event->add_function_with_opts(\%opts, $on_func);

    return;
}

# iterate over a list.
sub iterate {
    my ($f, $outer_scope, $collection, $var_name, $code) = @_;
    foreach ($collection->iterate) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);
        $scope->set_property($var_name => $_);
        $code->($scope);
    }
    return;
}

# iterate over a hash.
sub iterate_pair {
    my ($f, $outer_scope, $collection, $var1_name, $var2_name, $code) = @_;
    foreach ($collection->iterate_pair) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # ->iterate_pair returns arrayref [key, value].
        $scope->set_property($var1_name => $_->[0]);
        $scope->set_property($var2_name => $_->[1]);

        $code->($scope);
    }
    return;
}

# set a required function argument.
# return false if failed.
sub need {
    my ($scope_or_self, $arguments, $var_name, $var_pos, $value_maybe) = @_;

    # must be present.
    my $value = $arguments->{$var_name} or return;

    # if a value exists, the value must be equal to it.
    if ($value_maybe) {
        return unless perl_boolean($value->equal_to($value_maybe));
    }

    # set the variable.
    $scope_or_self->set_property($var_name => $value, $var_pos);

    return $value;
}

sub want {
    my ($scope_or_self, $arguments, $var_name, $var_pos, $value_maybe) = @_;
    my $value = $arguments->{$var_name};

    # if a value exists, it is the fallback value.
    if ($value_maybe && !$value) {
        $value = $value_maybe;
    }

    $scope_or_self->set_property($var_name => $value, $var_pos);
}

# set any object as scope.
sub inside {
    my ($f, $outer_scope, $obj, $code) = @_;
    my $scope = Ferret::Scope->new($f, parent => $outer_scope);
    $code->($scope, $obj);
    return;
}

# class definition or extension.
sub get_class {
    my ($f, $context, $name, $version) = @_;
    my $class;

    # create the class only if it does not exist.
    if (not $class = $f->get_class($context, $name)) {
        $class = Ferret::Class->new($f,
            name    => $name,
            version => $version
        );
        $context->set_property($name => $class);
    }

    # create a scope inheriting from the class and the context.
    my $scope = Ferret::Scope->new($f, parent_scope => $context);
    $scope->add_parent($class);

    # special properties, accessible in class variables.
    $scope->{special}->set_property_weak(class => $class);

    return ($class, $class, $class->prototype, $scope);
}

# anonymous function definition.
sub function_def {
    my ($f, $scope, $name, $arg_ref, $code) = @_;
    undef $name if !length $name;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => $name,
        code => $code,
        anonymous => 1
    );

    # add arguments.
    $func->add_argument(%$_) foreach @$arg_ref;

    return $func;
}

# function definition as event.
sub function_event_def {
    my ($f, $scope, $name, $arg_ref, $code) = @_;
    undef $name if !length $name;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => 'default',
        code => $code
    );

    # add arguments.
    $func->add_argument(%$_) foreach @$arg_ref;

    # create the event.
    my $event = Ferret::Event->new($f,
        name => $name,
        default_func => [ undef, $func ]
    );

    return $event;
}

# method definition as event.
sub method_event_def {
    my ($f, $scope, $name, $arg_ref, $code) = @_;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => 'default',
        code => $code,
        is_method => 1
    );

    # add arguments.
    $func->add_argument(%$_) foreach @$arg_ref;

    # create the event.
    my $event = Ferret::Event->new($f,
        name => $name,
        default_func => [ undef, $func ]
    );

    return $event;
}

# shared variable declaration without a value.
sub share {
    my ($scope, $prop_name, $pos) = @_;
    return if $scope->property($prop_name);
    $scope->set_property($prop_name => Ferret::undefined);
}

1
