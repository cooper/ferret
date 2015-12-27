# Copyright (c) 2015, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;
use parent 'Evented::Object';

use Scalar::Util qw(blessed weaken);
use List::Util qw(first);

use Ferret::Core::Conversion qw(
    _pdescription _pstring
    _pnumber _pbool
);
use Ferret::Core::Errors qw(throw);

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
# consider: since the addition of the ! operator, should we give up the
# concept of computed properties altogether?
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
    return 1;

}

# set a property or overwrite an inherited property.
sub set_property_ow {
    my ($obj, $context, $prop_name, $value, $pos) = @_;
    $obj->_check_prop_alteration($prop_name, [caller], $pos);

    my $owner = $obj->has_property($prop_name) || $obj;

    # if the owner is a context, but not the call context,
    # do not overwrite that value.
    #
    # for example, if you set a variable $x in the CORE context
    #
    # $x = "hi";
    #
    # then do
    #
    # package Hello
    # $x = "hello";
    #
    # $x will not overwrite the original "hi", even though
    # it would otherwise have been inherited from the main context.
    #
    if ($owner->isa('Ferret::Context') && $owner != $context) {
        $owner = $obj;
    }

    return $owner->set_property($prop_name => $value);
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
sub property   { (shift->_property(@_))[0] }
sub property_u {
    my ($obj, $prop_name) = (shift, shift);
    return $obj->property($prop_name, @_) || do {
        my $undef = Ferret::undefined;
        $undef->{last_name} = $prop_name;
        $undef;
    };
}

# this should not be used directly.
# it returns a property value and its owner.
#
# some subclasses of Object may override this function, but
# they must NOT override ->property or ->property_u, as those methods
# only rely on whichever custom implemention of ->_property exists.
#
sub _property {
    my ($obj, $prop_name, $borrow_obj, $simple_only) = @_;

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
        if (ref $p eq 'ARRAY') {
            $setting = 1;
            $p = shift @$p;
            die unless ref $p eq 'CODE'; # FIXME: lazy
        }

        # code reference is a computed property.
        if (ref $p eq 'CODE') {
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

        return ($p, $obj);
    }

    # try a different context.
    if (!$simple_only && index($prop_name, '::') != -1) {
        my ($context, $real_prop_name) = ($prop_name =~ m/^(.+)::(.+?)$/);
        $context = $obj->f->get_context($context) or return;
        return $context->_property($real_prop_name, undef, $simple_only);
    }

    # try inheritance.
    foreach my $o ($obj->parents) {
        my @v = $o->_property($prop_name, $borrow_obj, $simple_only);
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

sub simple_property_u { (shift->simple_property(@_)) || Ferret::undefined }

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

sub own_property_u { (shift->own_property(@_)) || Ferret::undefined }

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

sub instance_of {
    my ($obj, $class_maybe) = @_;
    return if !$class_maybe;
    return 1 if $class_maybe == $obj->f->{object_initializer}; # i.e. $o.*isa(Obj)
    return defined first { $_ == $class_maybe } $obj->parent_classes;
}

#####################
### MISCELLANEOUS ###
#####################

# create an object that represents a set of objects.
sub create_set {
    my ($obj, $call_scope, @other_objs) = @_;
    my $class = $obj->best_common_class(@other_objs);
    my $new = $class                ?
        $class->property_u('Set')   :
        $obj->f->get_class($obj->f->core_context, 'Set');
    return $new->call([ $obj, @other_objs ], $call_scope);
}

sub description {
    my ($obj, $own_only) = @_;

    return 'undefined' if Ferret::undefined($obj);
    return 'true'      if $obj == Ferret::true;
    return 'false'     if $obj == Ferret::false;

    # description method
    if (!$obj->{is_proto} and my $d_func = $obj->property('description')) {
        return _pstring($d_func->call);
    }

    my ($skipped, $prop_str) = (0, '');
    my @parents = $obj->parent_names;
    foreach my $prop_name ($obj->properties(1)) {
        my ($value, $owner) = $obj->_property($prop_name);

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
        $value     = join "\n    ", split /\n/, _pdescription($value, $own_only);
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
        Line  => int $pos
    ]);

}

sub call_u {
    return (shift->call(@_)) || Ferret::undefined;
}

# garbage disposal - remove object from Ferret instance.
sub DESTROY {
    my $obj = shift;
    my $f = $obj->f or return;
    delete $f->{objects}{$obj + 0};
}

###############
### INDICES ###
###############

# call getValue.
sub get_index_value {
    my ($obj, $arguments, $call_scope) = @_;
    return $obj->call_prop(getValue => $arguments, $call_scope);
}

# call setValue.
# because the number of indices can be variable, the value is always first.
sub set_index_value {
    my ($obj, $arguments, $value, $call_scope) = @_;
    unshift @$arguments, $value;
    return $obj->call_prop(setValue => $arguments, $call_scope);
}

###############################
### EQUALITY AND INEQUALITY ###
###############################

# test object equality, return Ferret boolean
sub equal_to {
    my ($left_obj, $right_obj, $scope) = @_;

    # try normal equality first.
    # TODO: maybe check equality for each class implementing comparison?
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
    $obj->property($prop_name)->call(@_);
}

################
### FETCHERS ###
################

# fetch the ferret.
sub f {
    shift->{ferret};
}

1
