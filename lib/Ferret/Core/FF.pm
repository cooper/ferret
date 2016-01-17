# Copyright (c) 2015, Mitchell Cooper
package FF;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(fstring ffunction ferror pbool);
use Scalar::Util qw(blessed weaken);
use List::Util qw(any all none);

# fetch the global Ferret.
sub get_ferret {
    return $Ferret::ferret ||= Ferret->new;
}

# fetch true, false, undefined objects
sub get_constant_objects {
    return (Ferret::true, Ferret::false, Ferret::undefined);
}

# fetch the current context and private file scope.
sub get_context {
    my ($f, $name) = @_;
    my $context = $f->get_context($name);
    my $scope = Ferret::Scope->new($f, parent => $context);
    return ($scope, $context);
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

    # the symbol exists.
    return $f->{symbols}{$name} if $f->{symbols}{$name};

    # create a new one.
    my $sym = Ferret::Symbol->new($f, init_args => { from => fstring($name) });
    weaken($f->{symbols}{$name} = $sym);

    return $sym;
}

# attach an event callback.
sub on {
    my ($obj, $event_name, $self, $scope, $on_func, $_opts) = @_;
    my %opts = $_opts && ref $_opts eq 'HASH' ? %$_opts : ();

    # if $event_name is an object, hashify it.
    $event_name = $event_name->hash_string if blessed $event_name;
    my $event = $obj->property($event_name);

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
        $event = $obj->own_property($event_name); # set last_parent.
    }

    # add the function.
    @opts{'self', 'outer_scope'} = ($self, $scope);
    $event->add_function_with_opts(\%opts, $on_func);

    return;
}

my %loop_returns = map {
    my $r = $_;
    $r => sub { return $r };
} qw(next last redo);

# iterate over a list.
sub iterate {
    my ($f, $outer_scope, $collection, $var_name, $code, $pos) = @_;
    foreach ($collection->iterate($pos)) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);
        $scope->set_property($var_name => $_);

        # call the code.
        my $ret = $code->($scope, \%loop_returns);
        next if !$ret;

        next if $ret eq 'next';
        last if $ret eq 'last';
        redo if $ret eq 'redo';
    }
    return;
}

# iterate over a hash.
sub iterate_pair {
    my ($f, $outer_scope, $collection,
        $var1_name, $var2_name, $code, $pos) = @_;
    foreach ($collection->iterate_pair($pos)) {

        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # ->iterate_pair returns arrayref [key, value].
        $scope->set_property($var1_name => $_->[0]);
        $scope->set_property($var2_name => $_->[1]);

        # call the code.
        my $ret = $code->($scope, \%loop_returns);
        next if !$ret;

        next if $ret eq 'next';
        last if $ret eq 'last';
        redo if $ret eq 'redo';
    }
    return;
}

sub indefinitely {
    my ($f, $outer_scope, $code, $pos) = @_;
    for (;;) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # call the code.
        my $ret = $code->($scope, \%loop_returns);
        next if !$ret;

        next if $ret eq 'next';
        last if $ret eq 'last';
        redo if $ret eq 'redo';
    }
    return;
}

sub while_true {
    my ($f, $outer_scope, $condition_code, $code, $pos) = @_;
    while (Ferret::truth($condition_code->())) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # call the code.
        my $ret = $code->($scope, \%loop_returns);
        next if !$ret;

        next if $ret eq 'next';
        last if $ret eq 'last';
        redo if $ret eq 'redo';
    }
    return;
}

# set a required function argument.
# return false if failed.
sub need {
    my ($scope_or_self, $args, $var_name, $var_pos, $value_maybe) = @_;

    # must be present.
    my $value = $args->{$var_name} or return;

    # if a value exists, the value must be equal to it.
    if ($value_maybe) {
        return unless pbool($value->equal_to($value_maybe));
    }

    # set the variable.
    $scope_or_self->set_property($var_name => $value, $var_pos);

    return $value;
}

sub want {
    my ($scope_or_self, $args, $var_name, $var_pos, $value_maybe) = @_;
    my $value = $args->{$var_name};

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
    my ($f, $context, $file_scope, $name, $version, $generics) = @_;
    my $class;

    # create the class only if it does not exist.
    my $created;
    if (not $class = $f->get_class($context, $name)) {
        $class = Ferret::Class->new($f,
            name    => $name,
            version => $version
        );
        $context->set_property($name => $class);
        $created++;
    }

    # create a scope inheriting from the class and the file scope.
    my $scope = Ferret::Scope->new($f, parent_scope => $file_scope);
    $scope->add_parent($class);

    # special properties, accessible in class variables.
    $scope->{special}->set_property_weak(class => $class);

    # consider: what should we do if $created is true, and generics were
    # provided? we can't add generics to an existing class.
    $class->add_generics(@$generics) if $generics;

    return ($class, $class, $class->prototype, $scope);
}

# anonymous function definition.
sub function_def {
    my ($f, $owner, $name, $arg_ref, $code) = @_;
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
    my ($f, $owner, $name, $callback_name, $arg_ref, $code) = @_;
    undef $name if !length $name;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => $callback_name // 'default',
        code => $code,

        # tell Function.pm we want to be added to an event
        pending_add => 1
    );

    # add arguments.
    $func->add_argument(%$_) foreach @$arg_ref;

    return $func;
}

# method definition as event.
sub method_event_def {
    my ($f, $scope, $name, $arg_ref, $code) = @_;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => 'default',
        code => $code,
        is_method => 1,
        pending_add => 1
    );

    # add arguments.
    $func->add_argument(%$_) foreach @$arg_ref;

    return $func;
}

# shared variable declaration without a value.
sub share {
    my ($scope, $prop_name, $pos) = @_;
    return if $scope->property($prop_name);
    $scope->set_property($prop_name => Ferret::undefined);
}

# type definitions.
sub typedef {
    my ($scope, $scope_or_class, $type_name, $code, $lazy) = @_;
    my $typedef = sub {

        # this sub returns a function which returns Ferret true if
        # a method requirement is satisfied.
        my $create_can = sub {
            my ($method_name, $obj) = @_;
            my $can_func = ffunction(sub {
                my (undef, $args) = @_;

                # TODO: how am I going to tell if arguments are unnamed?
                # there is no way to tell from $args what was passed.

                return Ferret::false if !$obj->has_property($method_name);
                return Ferret::true;
            });

            return $can_func;
        };

        # this sub takes a Ferret function and the $ins and calls that function.
        # the return value overwrites $ins. if undefined, the condition fails.
        my $transform = sub {
            my ($func, $obj) = @_;

            # if it's not a function, just use the value. it is likely the
            # value of a method or property or other expression
            return $func
                if !$func->isa('Ferret::Function') && !$func->isa('Ferret::Event');

            # return whatever the transform returns.
            return $func->call([ $obj ], $scope);

        };

        # create a function.
        my $func = ffunction(sub {
            my (undef, $args) = @_;
            my $obj = $args->{obj};
            my $res = $code->($obj, $create_can, $transform);
            return $res || Ferret::undefined;
        }, $type_name, '$obj');

        $func->{is_typedef} = 1;
        return $func;
    };

    $scope_or_class->set_property($type_name =>
        $lazy ? [ $typedef ] : $typedef->()
    ); # TODO: pos
}

sub typedef_check {
    my ($scope, $scope_or_class, $obj, %opts) = @_;

    # all conditions must return Ferret true.
    my $conditions = delete $opts{conditions} || [];
    return unless all { pbool($_) } @$conditions;

    # there are no equality requirements.
    my $equal_to = delete $opts{equal_to};
    return 1 if !$equal_to;

    # something is equal.
    return 1 if any { pbool($obj->equal_to($_)) } @$equal_to;

    return;
}

sub lex_assign {
    my ($owner, $name, $value, $scope_limit_if_ow, $pos) = @_;
    $owner->set_property_ow($scope_limit_if_ow, $name => $value, $pos);
    return $value;
}

sub try_catch {
    my ($f, $outer_scope, $instr_code, $catch_code, $var_name) = @_;

    # called if there's an error, fatal or nonfatal.
    my $do_error = sub {
        my $err = shift;

        # create a scope for the catch body.
        my $scope = Ferret::Scope->new($f, parent_scope => $outer_scope);
        $scope->set_property($var_name => $err) if defined $var_name;

        # call the body.
        return $catch_code->($scope);
    };

    # attempt the instruction.
    $Ferret::in_catch++;
    my $ret = eval { $instr_code->() };
    $Ferret::in_catch--;

    # a fatal error occured.
    if (!$ret && $@) {
        my $err = ferror($@) if !blessed $@ || !$@->isa('Ferret::Error');
        return $do_error->($err || $@);
    }

    # a nonfatal error was returned.
    if (blessed $ret && $ret->isa('Ferret::Return')) {
        my $err = $ret->property('error');
        undef $err if !blessed $err || !$err->isa('Ferret::Error');
        return $do_error->($err) if $err;
    }

    # all is good.
    return $ret;

}

sub gather {
    my ($f, $outer_scope, $gather_code) = @_;

    # create a list and a take function.
    my $list = Ferret::List->new($f);
    my $take = sub { $list->push(shift) };

    # create a scope.
    my $scope = Ferret::Scope->new($f, parent_scope => $outer_scope);

    # call the gather code with the scope and take function.
    $gather_code->($scope, $take);

    return $list;
}

sub throw {
    my $err = shift;
    Ferret::Core::Errors::throw($err, [caller]);
}

1
