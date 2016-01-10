# Copyright (c) 2015, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;
use parent 'Evented::Object';

use Scalar::Util qw(blessed weaken);
use List::Util qw(first any);

use Ferret::Core::Conversion qw(
    _pdescription _pstring
    _pnumber _pbool _psym
);
use Ferret::Core::Errors qw(throw);

use Ferret::Tie;
use overload
    fallback => 1,
    '${}'    => \&__scalar,
    '&{}'    => \&__code;

# create a new object.
sub new {
    my ($class, $f, %opts) = @_;
    my $obj = bless {
        isa => [],
        %opts,
        ferret => $f
    }, $class;

    # add parents.
    $obj->add_parent($_) foreach @{
        delete $obj->{parents}    ||
        [ delete $obj->{parent} ] ||
        [ ]
    };

    # set special, if available.
    weaken($obj->{special} = $f->{special})
        if !$obj->{special} && $f->{special};

    # set initial properties.
    if (my $pairs = delete $obj->{initial_props}) {
        $obj->set_property($_ => $pairs->{$_}) foreach keys %$pairs;
    }

    # save object location.
    weaken($f->{objects}{$obj + 0} = $obj);

    return $obj;
}

##################
### PROPERTIES ###
##################

# sets a property.
# $obj->set_property(someProperty => $someValue)
#
# where $someValue is one of
#
# a) a Ferret::Object (or something that inherits from Object)
# b) a special Ferret value such as Ferret::undefined, true, false
# c) a Perl reference to code that returns a Ferret::Object or special value
#
# returns true if set successfully, false otherwise.
#
sub set_property {
    my ($obj, $prop_name, $value, $pos) = @_;
    my $caller = [caller];
    $obj->_check_prop_alteration($prop_name, $caller, $pos);

    # special properties can never be assigned to from Ferret.
    if (substr($prop_name, 0, 1) eq '*') {
        throw(AssignmentToSpecialProperty => $caller, [
            Object   => $obj->description,
            Property => $prop_name,
            File     => $Ferret::file_map{ $caller->[1] } || 'unknown file',
            Line     => int $pos
        ], $prop_name);
    }

    # ensure that it is a valid Ferret value.
    my $r = ref $value;
    if ($r ne 'CODE' && $r ne 'ARRAY' && !Ferret::valid_value($value)) {
        return;
    }

    # store the value.
    $obj->{properties}{$prop_name} = $value;
    delete $obj->{properties}{$prop_name} if !defined $value;

    # good.
    return $value if blessed $value && $value->isa('Ferret::Object');
    return 1;

}

# set a property or overwrite an inherited property.
sub set_property_ow {
    my ($obj, $scope_limit, $prop_name, $value, $pos) = @_;
    $obj->_check_prop_alteration($prop_name, [caller], $pos);
    my $owner = $obj->has_property($prop_name);

    # never overwrite inherited context properties.
    # this saves time over reaching the bottom.
    if (!$owner || $owner->isa('Ferret::Context')) {
        return $obj->set_property($prop_name => $value, $pos);
    }

    # if the owner is the scope limit or any scope inheriting from it,
    # it's OK to overwrite
    if (any { $_ == $scope_limit } $owner, $owner->all_ancestors) {
        return $owner->set_property($prop_name => $value, $pos);
    }

    return $obj->set_property($prop_name => $value, $pos);
}

# deletes a property.
# $obj->delete_property('someProperty')
#
# this is different from setting a value to undefined.
# an undefined value is still a value. deleting a property makes it valueless.
#
# returns true if something was deleted, false otherwise.
#
sub delete_property {
    my ($obj, $prop_name, $pos) = @_;
    $obj->_check_prop_alteration($prop_name, [caller], $pos);
    return defined delete $obj->{properties}{$prop_name};
}

# fetches a property.
# $obj->property('someProperty')
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub property { (shift->_property(@_))[0] }

# wraps ->property, returning Ferret::undefined rather than Perl undef.
sub property_u {
    my ($obj, $prop_name) = (shift, shift);
    return _U(scalar $obj->property($prop_name, @_), $prop_name);
}

# wraps ->property, evaluating the $prop_name_exp object to a string.
sub property_eval {
    my ($obj, $prop_name_exp) = (shift, shift);
    my $prop_name = $prop_name_exp->hash_string;
    return $obj->property($prop_name, @_);
}

# wraps ->property_eval, returning Ferret::undefined rather than Perl undef.
sub property_eval_u {
    my ($obj, $prop_name) = (shift, shift);
    return _U(scalar $obj->property_eval($prop_name, @_), $prop_name);
}

# this should not be used directly.
# it returns a property value and its owner.
#
# some subclasses of Object may override this function, but
# they must NOT override ->property or ->property_u, as those methods
# only rely on whichever custom implemention of ->_property exists.
#
sub _property {
    my ($obj, $prop_name, $borrow_obj, $simple_only, $no_compute) = @_;

    # if the prop name starts with asterisk, it's a special property.
    my $first = \substr($prop_name, 0, 1);
    if (!$simple_only && $$first eq '*') {
        $$first = '';
        $borrow_obj = $obj; # pretend the property belongs to the object
        $obj = $obj->{special} or return;
    }

    $borrow_obj ||= $obj; # the object inheriting the property.

    # try the local property first.
    # this is done separately first because hopefully,
    # we won't even need to generate ->parents.
    if (defined $obj->{properties}{$prop_name}) {
        my $p = $obj->{properties}{$prop_name};

        # array ref containing code means that after computing the value,
        # we should actually set the property to that value.
        my $setting;
        if (ref $p eq 'ARRAY' && !$no_compute) {
            $setting = 1;
            $p = shift @$p;
            die unless ref $p eq 'CODE'; # FIXME: lazy
        }

        # code reference is a computed property.
        if (ref $p eq 'CODE' && !$no_compute) {
            $p = $p->($borrow_obj, $obj); # (obj inheriting, obj owner)

            # if the code returns an array ref, the second arg is the "real"
            # value of the property. this is used for computed properties.
            # in such a case, $p is the result of a function of the computation,
            # and $f is the function itself.
            #
            my $f;
            ($p, $f) = @$p if ref $p eq 'ARRAY';
            if ($f) {
                weaken($borrow_obj->{actual_inherited}{$prop_name} = $f);
                weaken($obj->{actual_props}{$prop_name} = $f);
            }

            $obj->set_property($prop_name => $p) if $setting;
        }

        if (blessed $p) {
            weaken($p->{last_parent} = $borrow_obj);
            $p->{last_name} = $prop_name;
        }

        return ($p, $obj, $prop_name);
    }

    # try a different context.
    if (!$simple_only && index($prop_name, '::') != -1) {
        my ($context, $real_prop_name) = ($prop_name =~ m/^(.+)::(.+?)$/);
        $context = $obj->f->get_context_or_class($context) or return;
        return $context->_property($real_prop_name, undef, $simple_only);
    }

    # try inheritance.
    foreach my $o ($obj->parents) {
        my @v = $o->_property(
            $prop_name, $borrow_obj, $simple_only, $no_compute
        );
        return (@v) if @v;
    }

    return;
}

# has a property, either its own or inherited.
# returns the owner of the property or Perl undef.
sub has_property {
    my ($obj, $prop_name) = @_;
    my ($value, $owner) = $obj->_property($prop_name);
    return $owner if defined $value;
}

# fetches a property, either its own or inherited,
# ignoring special properties and namespace accessors.
sub simple_property {
    my ($obj, $prop_name) = @_;
    return $obj->property($prop_name, undef, 1);
}

sub simple_property_u {
    my ($obj, $prop_name) = (shift, shift);
    return _U($obj->simple_property($prop_name, @_), $prop_name);
}

# fetches a property.
# does not take inheritance into account.
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub own_property {
    # TODO: this needs to do the same extras as ->property.
    shift->{properties}{+shift};
}

sub own_property_u {
    my ($obj, $prop_name) = (shift, shift);
    return _U($obj->own_property($prop_name, @_), $prop_name);
}

# weaken a property.
# this only applies to local properties.
#
sub weaken_property {
    my ($obj, $prop_name, $pos) = @_;
    $obj->_check_prop_alteration($prop_name, [caller], $pos);
    return if !defined $obj->{properties}{$prop_name};
    weaken($obj->{properties}{$prop_name});
    return 1;
}

# convenience method:
# sets a property, then weakens it.
#
sub set_property_weak {
    my ($obj, $prop_name, $value, $pos) = @_;
    $obj->_check_prop_alteration($prop_name, [caller], $pos);
    my $res = $obj->set_property($prop_name => $value);
    $obj->weaken_property($prop_name);
    return $res;
}

# property names
sub properties {
    my ($obj, $include_inherited) = @_;
    my %done;
    my @names = grep { defined $obj->{properties}{$_} and $done{$_} = 1 }
        keys %{ $obj->{properties} };
    if ($include_inherited) {
        push @names, grep !$done{$_}++, $_->properties($include_inherited)
            foreach $obj->parents;
    }
    return @names;
}

sub _check_prop_alteration {
    my ($obj, $prop_name, $caller, $pos) = @_;
    return 1 unless $obj->{ro_properties};
    throw(AlterationOfReadOnlyProperty => $caller, [
        Object   => $obj->description,
        Property => $prop_name,
        File     => $Ferret::file_map{ $caller->[1] } || 'unknown file',
        Line     => int $pos
    ], $prop_name);
}

##########################
### SPECIAL PROPERTIES ###
##########################

###################
### INHERITANCE ###
###################

# add an object as parent.
# typically, these objects are the prototypes of classes.
sub add_parent {
    my ($obj, $new_parent) = @_;
    return unless $new_parent;
    # TODO: if $new_parent is a Ferret array, convert to Perl array ref.
    unshift @{ $obj->{isa} }, $new_parent;
}

# revoke an object of parenthood.
sub remove_parent {
    my ($obj, $old_parent) = @_;
    @{ $obj->{isa} } = grep { $_ != $old_parent } @{ $obj->{isa} };
}

sub has_parent {
    my ($obj, $parent_maybe) = @_;
    return 1 if first { $_ == $parent_maybe } $obj->parents;
}

# returns a flattened and simplified list of parents.
sub parents {
    my $obj = shift;
    my (@parents, %done);
    my $add; $add = sub {
        foreach (@_) {
            next if $done{$_};
            $done{$_} = 1;
            if (ref $_ eq 'ARRAY') {
                $add->(@$_);
                next;
            }
            push @parents, $_;
        }
    };
    $add->(@{ $obj->{isa} });
    return @parents;
}

# returns a flattened and simplified list of all ancestors.
sub all_ancestors {
    my $obj = shift;
    my (@ancestors, %done);
    my $push = sub {
        my $obj = shift;
        return if $done{$obj}++;
        push @ancestors, $obj;
    };
    my $add; $add = sub {
        my $obj = shift;
        foreach my $p ($obj->parents) {
            $push->($p);
            $add->($p);
        }
    };
    $add->($obj);
    return @ancestors;
}

# returns a flattened and simplified list of parent names as Perl strings.
# this should be used only for debugging. it may not be consistent or reliable.
sub parent_names {
    my $obj = shift;
    my @parents;

    # only say Prototype for prototypes.
    return 'Prototype' if $obj->{is_proto};

    foreach my $parent ($obj->parents) {

        # it's a prototype
        if ($parent->{proto_class}) {
            push @parents, $parent->{proto_class}{name};
            next;
        }

        # just an object
        my @p = grep $_ ne 'Prototype', $parent->parent_names;
        push @parents, @p if @p;

    }
    unshift @parents, $obj->{faketype} if $obj->{faketype};
    push @parents, 'Object' if !@parents;
    return _uniq(@parents);
}

sub _uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

# returns a flattened and simplified list of parent classes.
# basically, it searches all parents. if a parent is a prototype object,
# it finds the class to which that prototype belongs.
sub parent_classes {
    my ($obj, @classes) = shift;
    foreach my $parent ($obj->parents) {
        next unless $parent->{is_proto};
        push @classes, $parent->{proto_class};
    }
    return @classes;
}

# returns the "nearest" parental class relationship between two objects.
sub best_common_class {
    my ($obj1, $obj2) = @_;
    my %found;
    my @classes_1 = $obj1->parent_classes;
    my @classes_2 = $obj2->parent_classes;

    while (@classes_1 || @classes_2) {
        my ($class_1, $class_2) = (shift @classes_1, shift @classes_2);
        return if !$class_1;
        $found{$class_1}++;
        return $class_2 if $found{$class_2};
    }

    return undef;
    # TODO: if ever implemented an Object class, return it here.
}

# FIXME: should .*instanceOf() return true for all objs for Obj?
# currently it does not. But this does not affect arguments, etc.
# because they use .*fitsType() instead.
sub instance_of {
    my ($obj, $class_maybe) = @_;
    return if !$class_maybe;
    return defined first { $_ == $class_maybe } $obj->parent_classes;
}

sub instance_of_u { &instance_of ? Ferret::true : Ferret::undefined }

#####################
### MISCELLANEOUS ###
#####################

# create an object that represents a set of objects.
sub create_set {
    my ($obj, $call_scope, @other_objs) = @_;

    # class might be provided. otherwise guess.
    my $first = $other_objs[0];
    my $class = $first && $first->isa('Ferret::Class') ?
        shift @other_objs                              :
        $obj->best_common_class(@other_objs);

    # find the constructor.
    my $new = $class                ?
        $class->property_u('Set')   :
        $obj->f->get_class($obj->f->core_context, 'Set');

    return $new->call([ $obj, @other_objs ], $call_scope);
}

sub description {
    my ($obj, $own_only, $compute, $no_method) = @_;

    return 'undefined' if Ferret::undefined($obj);
    return 'true'      if $obj == Ferret::true;
    return 'false'     if $obj == Ferret::false;

    # description method
    if (!$no_method && !$obj->{is_proto} and
      my $d_func = $obj->property('description')) {
        return _pstring($d_func->call);
    }

    my ($skipped, $prop_str) = (0, '');
    my @parents = $obj->parent_names;
    foreach my $prop_name ($obj->properties(1)) {

        # fetch value
        # if it's computed, it will return the arrayref or coderef.
        my ($value, $owner) =
            $obj->_property($prop_name, undef, undef, !$compute);

        # skip other contexts
        if ($owner != $obj && $owner->isa('Ferret::Context')) {
            $skipped++;
            next;
        }

        # skipping all inherited
        if ($owner != $obj && $own_only) {
            $skipped++;
            next;
        }

        $prop_str ||= "\n";

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value = blessed $value ? join "\n    ", split /\n/,
            _pdescription($value, $own_only, $compute) : '(computed)';
        $prop_str .= '    '.$prop_name." = $value\n";

    }
    $prop_str .= "\n    $skipped more inherited\n" if $skipped;

    return sprintf '[ %s ](%s)', join(', ', @parents), $prop_str;
}

# one-line truncated description.
sub description_ol {
    my $d = shift->description;
    $d =~ s/\s{2,}|\n/ /g;
    my $length = length $d;
    $d = substr $d, 0, 30;
    $d .= '...' if length $d < $length;
    return $d;
}

# calling a non-function.
sub call {
    my ($obj, undef, undef, undef, $pos) = @_;


    # try to convert to a function.
    if (my $to_func = $obj->property('toFunction')) {
        return $to_func->call_u->call(@_);
    }

    # throw an error.
    my $caller = [caller 0];
    $caller = [caller 1] if $caller->[0] eq __PACKAGE__;

    throw(CallOnNonFunction => $caller, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol,
        File  => $Ferret::file_map{ $caller->[1] } || 'unknown file',
        Line  => int($pos || 0)
    ]);

}

sub call_u {
    return (shift->call(@_)) || Ferret::undefined;
}

# iterating over a non-function.
sub iterate {
    my ($obj, $pos) = @_;

    # TODO: here is where we can check if it implements iterations
    # with an interface

    # throw an error.
    my ($i, $caller) = 1;
    $caller = [caller 1];

    throw(InvalidIteration => $caller, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol,
        File  => $Ferret::file_map{ $caller->[1] } || 'unknown file',
        Line  => int $pos
    ]);
}

sub iterate_pair { &iterate }

sub full_name {
    my ($obj, $prop_name) = @_;
    my ($val, $owner, $name) = $obj->_property($prop_name) or return;
    $prop_name = $name;

    # it's a context.
    if ($owner->isa('Ferret::Context')) {
        return $owner->{name}."::$prop_name";
    }

    # it's a scope.
    if ($owner->isa('Ferret::Scope')) {
        my $ctx = $owner->closest_context;
        my $addr = $owner->{scope_id};
        return $ctx->{name}."::$addr\::$prop_name"
    }

    # it's some other object.
    my $addr = $owner + 0;
    return "$addr\::$prop_name";

}

# garbage disposal - remove object from Ferret instance.
sub DESTROY {
    my $obj = shift;
    my $f = $obj->f or return;
    delete $f->{objects}{$obj + 0};
}

sub __scalar {
	my $obj = shift;
    return \$obj->{tie} if $obj->{tie};
    $obj->{tie} = {};
    tie %{ $obj->{tie} }, 'Ferret::Tie', $obj;
    return \$obj->{tie};
}

sub __code {
    my $obj = shift;
    return sub { $obj->call_u(@_) };
}

sub _U {
    my ($val, $prop_name) = @_;
    return $val || do {

        # remember the name for runtime error.
        my $undef = Ferret::undefined;
        $undef->{last_name} = $prop_name;

        $undef;
    };
}

# convert a hashable object to a Perl string.
sub hash_string {
    my $obj = shift;
    my $hashable = $obj->f->core_context->property('Hashable') or return;

    # convert to the hash value.
    my $hash_value = $hashable->call_u([ $obj ]);

    # TODO: runtime error if not hashable.
    if (Ferret::undefined($hash_value)) {
        die;
    }

    return  _psym($hash_value);
}

###############
### INDICES ###
###############

# call getValue.
sub get_index_value {
    my ($obj, $args, $call_scope, $pos) = @_;

    my $evt = $obj->property_u('getValue');
    undef $evt if !$evt->isa('Ferret::Event');

    # no event getValue
    my $caller = [caller];
    throw(IndexOnNonCollection => $caller, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown',
        File     => $Ferret::file_map{ $caller->[1] } || 'unknown file',
        Line     => int $pos
    ]) if !$evt;

    return $evt->call_u($args, $call_scope);
}

# call setValue.
sub set_index_value {
    my ($obj, $args, $value, $call_scope, $pos) = @_;

    # because the number of indices can be variable, the value is always first.
    unshift @$args, $value;

    my $evt = $obj->property_u('setValue');
    undef $evt if !$evt->isa('Ferret::Event');

    # no event setValue
    my $caller = [caller];
    throw(SetIndexOnNonCollection => $caller, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown',
        File     => $Ferret::file_map{ $caller->[1] } || 'unknown file',
        Line     => int $pos
    ]) if !$evt;

    return $evt->call_u($args, $call_scope);
}

###############################
### EQUALITY AND INEQUALITY ###
###############################

# test object equality, return Ferret boolean
sub equal_to {
    my ($left_obj, $right_obj, $scope) = @_;

    # try normal equality first.
    if (my $cmp = $left_obj->create_set($scope, $right_obj)->property('equal')) {
        return $cmp->call;
    }

    # fallback to object equality.
    return $left_obj->equal_to_exactly($right_obj, $scope);

}

# test exact object equality, return Ferret boolean
sub equal_to_exactly {
    my ($left_obj, $right_obj, $scope) = @_;
    return $left_obj == $right_obj ? Ferret::true : Ferret::false;
}

############################
### PROPERTY CONVENIENCE ###
############################

sub pstring {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = $obj->property($prop_name);
    return $value ? _pstring($value) // $fallback : $fallback;
}

sub pnumber {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = $obj->property($prop_name);
    return $value ? _pnumber($value) // $fallback : $fallback;
}

sub pbool {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = $obj->property($prop_name);
    return $value ? _pbool($value) : $fallback;
}

sub call_prop {
    my ($obj, $prop_name) = (shift, shift);
    $obj->property_u($prop_name)->call(@_);
}

################
### FETCHERS ###
################

# fetch the ferret.
sub f {
    shift->{ferret};
}

1
