# Copyright (c) 2015, Mitchell Cooper
package FF;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util qw(blessed weaken dualvar);
use List::Util qw(any all none);
use Ferret::Core::Conversion qw(
    fstring ffunction ferror pbool pstring plist
    FUNC_SCOPE FUNC_SELF FUNC_THIS FUNC_INS FUNC_RET FUNC_ARGS
    ref_to_list
);

our $pos;
my $ret_func = sub { wantarray ? (@_) : shift };

# fetch the global Ferret.
sub get_ferret {
    return $Ferret::ferret ||= Ferret->new;
}

# fetch true, false, undefined objects
sub get_constant_objects {
    return (Ferret::true, Ferret::false, Ferret::undefined, $ret_func);
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
    my ($base, $file) = @_;

    # remember we tried this file.
    $Ferret::file_map{ (caller)[1] } = $base;
    $Ferret::tried_files{"$base.pm"}++;

    # create a function to make dualvar positions.
    my $posfunc = sub { $pos = dualvar shift, $file };

    return $posfunc;
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
    my %pairs;
    while (my ($key, $value) = splice @$pairs, 0, 2) {
        $pairs{ pstring($key) } = $value;
    }
    return Ferret::Object->new($f, initial_props => \%pairs);
}

# create a hash.
sub create_hash {
    my ($f, $pairs) = @_;
    my %pairs;
    while (my ($key, $value) = splice @$pairs, 0, 2) {
        $pairs{ pstring($key) } = $value;
    }
    return Ferret::Hash->new($f, pairs => \%pairs);
}

# create a list.
sub create_list {
    my ($f, $items) = @_;
    return Ferret::List->new($f, items => $items);
}

# create a set.
sub create_set {
    my ($scope, $first_item, @other_items) = @_;

    # TODO: use ->best_common_class to determine the
    # type the list should be.

    return Ferret::List->new($scope->f, items => [ $first_item, @other_items ]);
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

# $ret_func within loops returns 'return' as the status.
# other statuses include: 'last', 'next', 'redo'
my $loop_ret_func = sub {
    return ('return', @_);
};

# $ret_func within other once-executed constructs such as
# inside and do work the same way.
my $once_ret_func = $loop_ret_func;

# iterate over a list.
sub iterate {
    my ($f, $outer_scope, $collection, $var_name, $code, $pos) = @_;
    my $iterator = $collection->iterator;
    while (Ferret::truth($iterator->property('more'))) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);
        my $value = $iterator->property('nextElement');
        $scope->set_property($var_name => $value);

        # call the code.
        my ($status, $ret) = $code->($scope, $loop_ret_func);

        if ($status) {

            # loop control.
            next if $status eq 'next';
            last if $status eq 'last';
            redo if $status eq 'redo';

            # return the outside function.
            return ('return', $ret) if $status eq 'return';

        }
    }

    # if we never reached 'return' status, the loop returns nothing.
    return 'void';
}

# iterate over a hash.
sub iterate_pair {
    my ($f, $outer_scope, $collection,
        $var1_name, $var2_name, $code, $pos) = @_;
    my $iterator = $collection->iterator;

    while (Ferret::truth($iterator->property('more'))) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # nextElements for a pair
        my $values = $iterator->property('nextElements');
        if ($values) {
            my ($key, $value) = plist($values);
            $scope->set_property($var1_name => $key);
            $scope->set_property($var2_name => $value);
        }

        # otherwise just use nextElement
        else {
            my $value = $iterator->property('nextElement');
            $scope->set_property($var1_name => $value);
        }

        # call the code.
        my ($status, $ret) = $code->($scope, $loop_ret_func);

        if ($status) {

            # loop control.
            next if $status eq 'next';
            last if $status eq 'last';
            redo if $status eq 'redo';

            # return the outside function.
            return ('return', $ret) if $status eq 'return';

        }
    }

    # if we never reached 'return' status, the loop returns nothing.
    return 'void';
}

sub indefinitely {
    my ($f, $outer_scope, $code, $pos) = @_;
    for (;;) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # call the code.
        my ($status, $ret) = $code->($scope, $loop_ret_func);

        if ($status) {

            # loop control.
            next if $status eq 'next';
            last if $status eq 'last';
            redo if $status eq 'redo';

            # return the outside function.
            return ('return', $ret) if $status eq 'return';

        }

    }

    # if we never reached 'return' status, the loop returns nothing.
    return 'void';
}

sub while_true {
    my ($f, $outer_scope, $condition_code, $code, $pos) = @_;
    while (Ferret::truth($condition_code->())) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # call the code.
        my ($status, $ret) = $code->($scope, $loop_ret_func);

        if ($status) {

            # loop control.
            next if $status eq 'next';
            last if $status eq 'last';
            redo if $status eq 'redo';

            # return the outside function.
            return ('return', $ret) if $status eq 'return';

        }

    }

    # if we never reached 'return' status, the loop returns nothing.
    return 'void';
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

    return $scope_or_self->set_property($var_name => $value, $var_pos);
}

sub want {
    my ($scope_or_self, $args, $var_name, $var_pos, $value_maybe) = @_;
    my $value = $args->{$var_name};

    # if a value exists, it is the fallback value.
    if ($value_maybe && !$value) {
        $value = $value_maybe;
    }

    return $scope_or_self->set_property($var_name => $value, $var_pos);
}

# set any object as scope.
sub inside {
    my ($f, $outer_scope, $obj, $code) = @_;
    my $scope = Ferret::Scope->new($f, parent => $outer_scope);
    my ($status, $ret) = $code->($scope, $obj, $once_ret_func);
    return $ret if $status eq 'return';
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
            version => $version,
            just_created => 1
        );
        $context->set_property($name => $class);
        $created++;
    }

    # create a scope inheriting from the class and the file scope.
    my $scope = Ferret::Scope->new($f, parent_scope => $file_scope);
    $scope->add_parent($class);

    # special properties, accessible in class scope.
    $scope->{special}->set_property_weak(class => $class);

    # add generics. if this fails, ->add_generics() returns false.
    if ($generics && !$class->add_generics(@$generics)) {
        # TODO: throw()
        die; # FIXME
    }

    delete $class->{just_created};
    return ($class, $class, $class->prototype, $scope);
}

# anonymous function definition.
sub function_def {
    my ($f, $owner, $name, $arg_ref, $ret_ref, $code) = @_;
    undef $name if !length $name;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => $name,
        code => $code,
        anonymous => 1
    );

    # add arguments and returns.
    $func->add_argument(%$_) foreach ref_to_list $arg_ref;
    $func->add_return(%$_)   foreach ref_to_list $ret_ref;

    return $func;
}

# function definition as event.
sub function_event_def {
    my ($f, $owner, $name, $callback_name, $arg_ref, $ret_ref, $code) = @_;
    undef $name if !length $name;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => $callback_name // 'default',
        code => $code,

        # tell Function.pm we want to be added to an event
        pending_add => 1
    );

    # add arguments and returns.
    $func->add_argument(%$_) foreach ref_to_list $arg_ref;
    $func->add_return(%$_)   foreach ref_to_list $ret_ref;

    return $func;
}

# method definition as event.
sub method_event_def {
    my ($f, $scope, $name, $arg_ref, $ret_ref, $code) = @_;

    # create a default function.
    my $func = Ferret::Function->new($f,
        name => 'default',
        code => $code,
        is_method => 1,
        pending_add => 1
    );

    # add arguments.
    $func->add_argument(%$_) foreach ref_to_list $arg_ref;
    $func->add_return(%$_)   foreach ref_to_list $ret_ref;

    return $func;
}

# type definitions.
sub typedef {
    my ($scope, $scope_or_class, $type_name, $code, $lazy) = @_;
    my $f = $scope->f;
    my $create_typedef = sub {

        # this sub returns a function which returns Ferret true if
        # a method requirement is satisfied.
        my $create_can = sub {
            my ($method_name, $args, $rets, $obj) = @_;

            # $args is [ argName => 'Type' ]
            # if $args is undef, it's can .property
            # if $args is empty list, it's can .method()

            my $can_func = ffunction(sub {
                my $NO = Ferret::false;
                return $NO if !$obj->has_property($method_name);

                # obj, code, array. the one means don't compute.
                my ($obj_or_ref) =
                    $obj->_property($method_name, undef, undef, 1);

                # attempt to find a function from the Code. even if
                # $obj_or_ref is a reference (computed property), this might
                # still be a function representing it.
                my $func_maybe = blessed $obj_or_ref ? $obj_or_ref :
                    $obj->underlying_property_code($method_name);
                $func_maybe = $func_maybe->can('default_func') ?
                    $func_maybe->default_func                  :
                    $func_maybe                                if $func_maybe;

                # if there are args, check that they can be satisfied.
                if ($args) {

                    # first of all, any requirement with an arg list means that
                    # the property has to be a Code. it can't computed.
                    return $NO if !blessed $obj_or_ref || !$obj_or_ref->is_code;

                    # OK now check each argument
                    return $NO if !$func_maybe;
                    return $NO unless $func_maybe->_types_satisfy_requirements(
                        $args, 'signatures'
                    );
                }

                # if there is NOT an arg list, make sure that this is NOT
                # an object but is in fact an unblessed reference
                # (indicating a computed property)
                else {
                    return $NO if blessed $obj_or_ref;
                }

                # if there are return types, check that they can be satisfied.
                if ($rets) {
                    return $NO if !$func_maybe;
                    return $NO unless $func_maybe->_types_satisfy_requirements(
                        $rets, 'returns'
                    );
                }
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
            return $func if !$func->is_code;

            # return whatever the transform returns.
            return $func->call([ $obj ], $scope);

        };

        # create a prototype.
        my $proto = Ferret::Prototype->new($f, proto_name => $type_name)
            if $lazy;

        # create a function.
        my $func = ffunction(sub {
            my (undef, $args) = @_;
            my $obj = $args->{obj};

            # already an instance of this type.
            return $obj if $proto && $obj->has_parent($proto);

            # compute the result and make it an instance of this type.
            my $res = $code->($obj, $create_can, $transform);
            $res->add_parent($proto) if $proto;

            return $res || Ferret::undefined;
        }, $type_name, '$obj');

        $func->set_property(proto => $proto) if $proto;
        $func->{is_typedef} = 1;
        return $func;
    };

    $scope_or_class->set_property($type_name => $create_typedef->());
}

sub typedef_check {
    my ($scope, $scope_or_class, $obj, $typedef_id, %opts) = @_;

    # Disabled: this logic was formerly used to cache object conformity to a
    # type interface. Now types are evaluated each time unless they are marked
    # as lazy (created with the type? keyword). In this case, the type has a
    # prototype object associated with it, and conformance is cached by storing
    # the prototype as a parent of the object.
    #
    # # if ISA hasn't changed since the last check,
    # # the obj probably still conforms to the interface.
    # my $new_changes = $obj->{isa_changes} || 0;
    # my $old_changes = $obj->{type_conformity}{$typedef_id};
    # return 1 if defined $old_changes && $old_changes == $new_changes;
    # $obj->{type_conformity}{$typedef_id} = $obj->{isa_changes} || 0;

    # all conditions must return Ferret true.
    my $conditions = delete $opts{conditions} || [];
    return unless all { pbool($_->()) } @$conditions;

    # there are no equality requirements.
    my $equal_to = delete $opts{equal_to};
    return 1 if !$equal_to;

    # something is equal.
    return 1 if any { pbool($obj->equal_to($_->())) } @$equal_to;

    return;
}

# shared variable declaration without a value.
sub share {
    my ($scope, $prop_name, $pos) = @_;
    my $existing = $scope->property($prop_name);
    return $existing if $existing;
    return $scope->set_property($prop_name => Ferret::undefined);
}

# used for both lexical assignment and share when there's a value.
sub var {
    my ($owner, $name, $value, $scope_limit_if_ow, $pos) = @_;
    return $owner->set_property_ow($scope_limit_if_ow, $name => $value, $pos);
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
    my ($status, $ret) = $gather_code->($scope, $take, $once_ret_func);

    # Gather return is interesting.
    # unlike loops and inside and such, it actually has a return value
    # of its own, since gather is an expression. as a result, we must return
    # a status here, either 'list' or 'return'

    # if the gather returned, return the outer.
    return ($status, $ret) if $status && $status eq 'return';

    # otherwise, return 'list' status.
    return ('list', $list);
}

sub throw {
    my ($err, $pos) = @_;
    $err->{pos} = $pos;
    Ferret::Core::Errors::throw($err, [caller]);
}

sub type_with_generics {
    my ($f, $scope, $class, $generics) = @_;

    # make sure that the class actually is a class.
    if (Ferret::undefined($class) || !$class->isa('Ferret::Class')) {
        # TODO: throw()
        return Ferret::undefined;
    }

    # make sure none of the generics are undefined.
    foreach my $type (@$generics) {
        next unless Ferret::undefined($type);
        # TODO: throw()
        return Ferret::undefined;
    }

    require Ferret::TypedClass;
    return Ferret::TypedClass->new($f,
        main_class  => $class,
        other_types => $generics
    );
}

# function args
# never change this, just add new versions
sub args_v1 {
    # my ($scope, $self, $this, $args, $ret) = &FF::args_v1;
    state $v1 = [
        FUNC_SCOPE, FUNC_SELF,  FUNC_THIS,
        FUNC_INS,   FUNC_ARGS,  FUNC_RET
    ];
    return @_[@$v1];
}

1
