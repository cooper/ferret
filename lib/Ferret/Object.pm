# Copyright (c) 2015, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Evented::Object';

use Scalar::Util qw(blessed weaken reftype);
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
    $f ||= $Ferret::ferret;
    my $obj = bless {
        isa => [],
        listeners => [],
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
    weaken($obj->{ferret});
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
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);

    # special properties can never be assigned to from Ferret.
    if (substr($prop_name, 0, 1) eq '*') {
        throw(AssignmentToSpecialProperty => $pos, [
            Object   => $obj->description_ol,
            Property => $prop_name
        ], $prop_name);
    }

    # ensure that it is a valid Ferret value.
    my $r = ref $value;
    if ($r ne 'CODE' && $r ne 'ARRAY' && !Ferret::valid_value($value)) {
        return;
    }

    $obj->reset_property($prop_name);

    # store the value.
    $obj->{properties}{$prop_name} = $value;
    delete $obj->{properties}{$prop_name} if !defined $value;

    # good.
    return $value; # object or ref
}

# set a property or overwrite an inherited property.
sub set_property_ow {
    my ($obj, $scope_limit, $prop_name, $value, $pos) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);
    my $owner = $obj->has_property($prop_name);

    # never overwrite inherited context properties.
    # this saves time over reaching the bottom.
    if (!$owner || $owner->isa('Ferret::Context')) {
        return $obj->set_property($prop_name => $value);
    }

    # if the owner is the scope limit or any scope inheriting from it,
    # it's OK to overwrite
    if ($scope_limit && any { $_ == $scope_limit } $owner, $owner->all_ancestors) {
        return $owner->set_property($prop_name => $value);
    }

    return $obj->set_property($prop_name => $value);
}

# deletes a property.
# $obj->delete_property('someProperty')
#
# this is different from setting a value to undefined.
# an undefined value is still a value. deleting a property makes it valueless.
#
# returns true if something was deleted, false otherwise.
# only deletes the object's own property.
#
sub delete_property {
    my ($obj, $prop_name, $pos) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);
    $obj->reset_property($prop_name);
    return defined delete $obj->{properties}{$prop_name};
}

# deletes a property, even if inherited.
sub delete_property_ow {
    my ($obj, $prop_name, $pos) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);
    my $owner = $obj->has_property($prop_name);
    return if !$owner;
    return $owner->delete_property($prop_name);
}

sub reset_property {
    my ($obj, $prop_name) = @_;
    delete $obj->{actual_props}{$prop_name};
    delete $obj->{actual_inherited}{$prop_name};
    delete $obj->{underlying_property_code}{$prop_name};
}

# fetches a property.
# $obj->property('someProperty')
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub property {
    my ($obj, $prop_name, $pos) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    return ($obj->_property($prop_name))[0];
}

# wraps ->property, returning Ferret::undefined rather than Perl undef.
sub property_u {
    my ($obj, $prop_name, $pos) = @_;
    return _U(scalar $obj->property($prop_name), $prop_name);
}

# this should not be used directly.
# it returns a property value and its owner.
#
# some subclasses of Object may override this function, but
# they must NOT override ->property or ->property_u, as those methods
# only rely on whichever custom implemention of ->_property exists.
#
sub _property {
    my ($obj, $prop_name, $borrow_obj,
        $simple_only, $no_compute, $no_recursion) = @_;

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
            die 'not code!' unless ref $p eq 'CODE'; # FIXME: lazy
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
        my ($ctx, %tried) = $borrow_obj;
        while ($prop_name =~ s/^(.+?):://) {
            $ctx = $ctx->property($1);
            return if !$ctx || $tried{$ctx}++;
        }
        return $ctx->_property($prop_name);
    }

    # try inheritance.
    my $i = 0;
    foreach my $o ($obj->parents) { $i++;
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
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    # the one means don't compute
    my ($obj_or_ref, $owner) = $obj->_property($prop_name, undef, undef, 1);
    return $owner if defined $obj_or_ref;
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

# set underlying property code. used for computed properties.
# deleted on overwrite and deletion.
sub set_underlying_property_code {
    my ($obj, $prop_name, $func_or_event) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    weaken($obj->{underlying_property_code}{$prop_name} = $func_or_event);
}

# fetch underlying property code.
sub underlying_property_code {
    my ($obj, $prop_name) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    my $owner = $obj->has_property($prop_name);
    return $owner->{underlying_property_code}{$prop_name};
}

sub property_uncomputed {
    my ($obj, $prop_name) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    my ($obj_or_ref) = $obj->_property($prop_name, undef, undef, 1);
    return $obj_or_ref if $obj_or_ref && blessed $obj_or_ref;
    return $obj->underlying_property_code($prop_name);
}

sub own_property_uncomputed {
    my ($obj, $prop_name) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    my ($obj_or_ref, $owner) = $obj->_property($prop_name, undef, 1, 1);
    return undef if !$obj_or_ref || $owner != $obj;
    return $obj_or_ref if blessed $obj_or_ref;
    return $obj->underlying_property_code($prop_name);
}

# fetches a property.
# does not take inheritance into account.
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub own_property {
    my ($obj, $prop_name) = (shift, shift);
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    my ($value, $owner) = $obj->_property($prop_name, @_);
    return undef if !$value || $owner != $obj;
    return $value;
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
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);
    return if !defined $obj->{properties}{$prop_name};
    weaken($obj->{properties}{$prop_name});
    return 1;
}

# FIXME!!!!!! these aren't implemented
*weaken_property_ow = *weaken_property;

# convenience method:
# sets a property, then weakens it.
#
sub set_property_weak {
    my ($obj, $prop_name, $value, $pos) = @_;
    $prop_name = $prop_name->hash_string if blessed $prop_name;
    $obj->_check_prop_alteration($prop_name, $pos);
    my $res = $obj->set_property($prop_name => $value);
    $obj->weaken_property($prop_name);
    return $res;
}

# property names
sub properties {
    my ($obj, $include_inherited) = @_;
    return if $obj->{is_special};
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
    my ($obj, $prop_name, $pos) = @_;
    return 1 unless $obj->{ro_properties};
    throw(AlterationOfReadOnlyProperty => $pos, [
        Object   => $obj->description_ol,
        Property => $prop_name
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
    $obj->{isa_changes}++;
    my $isa = $obj->{isa};
    # TODO: if $new_parent is a Ferret array, convert to Perl array ref.
    push @$isa, $new_parent;
    weaken($isa->[$#$isa]);
}

# revoke an object of parenthood.
sub remove_parent {
    my ($obj, $old_parent) = @_;
    my $isa = $obj->{isa};
    my $i = -1;
    foreach $i (0..$#$isa) {
        next if $isa->[$i] != $old_parent;
        last;
    }
    return if $i == -1;
    $obj->{isa_changes}++;
    delete $isa->[$i];
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
            next if !defined || $done{$_};
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

    return "Prototype '$$obj{proto_name}'"  if $obj->isa('Ferret::Prototype');
    return "Context '$$obj{name}'"          if $obj->isa('Ferret::Context');

    foreach my $parent ($obj->parents) {

        # it's a prototype
        if ($parent->{proto_class}) {
            push @parents, $parent->{proto_class}->full_name;
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
        next unless $parent->isa('Ferret::Prototype') && $parent->{proto_class};
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
}

# returns Perl true if the object is an instance of a class
sub instance_of {
    my ($obj, $class_maybe) = @_;
    return if !$class_maybe;
    return defined first { $_ == $class_maybe } $obj->parent_classes;
}

# returns Ferret true or undefined
sub instance_of_u { &instance_of ? Ferret::true : Ferret::undefined }

# returns Perl true if the object fits a type
# more specifically, returns the object or a transformed version of it
sub fits_type {
    my ($obj, $class_or_func) = @_;

    # not blessed. this is a string name.
    if (!blessed $class_or_func) {
        $class_or_func = $obj->f->main_context->property($class_or_func);
    }

    # at this point, it has to be an object.
    return if !$class_or_func || !Ferret::valid_value($class_or_func);

    # undefined fits undefined
    return Ferret::undefined
        if Ferret::undefined($obj) && Ferret::undefined($class_or_func);

    # could be an instance of this class
    if ($class_or_func->isa('Ferret::Class')) {
        return $obj if $obj->instance_of($class_or_func);
    }

    # could satisfy this type interface
    if ($class_or_func->is_code) {
        return if !$class_or_func->{is_typedef};
        my $ret = $class_or_func->call([ $obj ]);
        return $ret unless Ferret::undefined($ret);
        return;
    }

    return;
}

# returns Ferret true or undefined
sub fits_type_u { &fits_type ? Ferret::true : Ferret::undefined }

# add an object as listener.
sub add_listener {
    my ($obj, $new_listener, $arguments) = @_;
    return unless $new_listener;
    undef $arguments
        if !ref $arguments || reftype $arguments ne 'HASH' || !%$arguments;
    unshift @{ $obj->{listeners} }, [ $new_listener, $arguments ];
}

# revoke an object of listener status.
sub remove_listener {
    my ($obj, $old) = @_;
    @{ $obj->{listeners} } = grep { $_->[0] != $old } @{ $obj->{listeners} };
}

sub has_listener {
    my ($obj, $maybe) = @_;
    return 1 if first { $_ == $maybe } $obj->listeners;
}

sub listeners {
    my $obj = shift;
    return map $_->[0], @{ $obj->{listeners} };
}

sub listeners_and_arguments {
    my $obj = shift;
    return @{ $obj->{listeners} };
}

#####################
### MISCELLANEOUS ###
#####################

sub _ignore {
    my ($ignore, $obj) = @_;
    return if $obj->isa('Ferret::String') || $obj->isa('Ferret::Number');
    return $ignore->{$_}++;
};

# %opts = (
#   own_only    true if we should omit inherited properties
#   compute     true if we should compute computed properties
#   no_method   true if we should NOT check the object for a description method
#   ignore      hashref of objects to ignore, to prevent recursion
# )
sub description {
    my ($obj, %opts) = @_;
    return 'undefined' if Ferret::undefined($obj);
    return 'true'      if $obj == Ferret::true;
    return 'false'     if $obj == Ferret::false;

    # prepare options
    $opts{ignore} ||= {};
    $opts{ignore}{$obj}++;
    my $no_method = delete $opts{no_method};

    # Perl description method
    my $code = $obj->can('description');
    if (!$no_method && $code != __PACKAGE__->can('description')) {
        return $code->($obj, %opts);
    }

    # Ferret description method
    if (!$no_method && !$obj->isa('Ferret::Prototype') && !$obj->{is_special}
      and my $ret = $obj->property('description')) {
        $ret = $ret->call if $ret->is_code;
        return _pstring($ret);
    }

    my ($skipped, @lines) = 0;
    my @parents = $obj->parent_names;
    foreach my $prop_name ($obj->properties(1)) {

        # fetch value
        # if it's computed, it will return the arrayref or coderef.
        my ($value, $owner) =
            $obj->_property($prop_name, undef, undef, !$opts{compute}, 1);

        # skip other contexts
        if ($owner != $obj && $owner->isa('Ferret::Context')) {
            $skipped++;
            next;
        }

        # skipping all inherited
        if ($owner != $obj && $opts{own_only}) {
            $skipped++;
            next;
        }

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value = _ignore($opts{ignore}, $value) ? '(recursion)' :
            blessed $value ? join "\n    ", split /\n/,
            _pdescription($value, %opts) : '(computed)';
        push @lines, split /\n/, "$prop_name = $value";

    }

    # mention skipped properties
    if ($skipped) {
        my $y = $skipped == 1 ? 'y' : 'ies';
        push @lines, "$skipped inherited propert$y"
    }
    
    # one parent or comma-separated list
    my $parents;
    if (@parents > 1) {
        $parents = join(', ', @parents);
        $parents = "[ $parents ]";
    }
    else {
        $parents = $parents[0];
    }

    my $prop_str = @lines > 1 ?
        join("\n", '', map("    $_", @lines), '') : "@lines";
    return sprintf '%s (%s)', $parents, $prop_str;
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

# true if Event or Function
sub is_code {
    my $func = shift;
    return $func->isa('Ferret::Function') || $func->isa('Ferret::Event');
}

# calling a non-function.
sub call {
    my $obj = shift;
    my $pos = $_[2];

    # try to convert to a function.
    if (my $to_func = $obj->property('toFunction')) {
        return $to_func->call_u(@_)->call(@_);
    }

    throw(CallOnNonFunction => $pos, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol
    ]);
}

sub call_u {
    return (shift->call(@_)) || Ferret::undefined;
}

# iterating over a non-function.
sub iterator {
    my ($obj, $pos) = @_;

    # find the iterator and ensure it fits the Iterator.
    # if not, throw an error for an invalid iteration.
    my $iterator = $obj->property('iterator');
    if (!$iterator || !$iterator->fits_type('Iterator')) {
        throw(InvalidIteration => $pos, [
            Name  => $obj->{last_name},
            Value => $obj->description_ol
        ]);
    }

    return $iterator;
}

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
    $prop_name = $prop_name->hash_string if blessed $prop_name;
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
        die 'not hashable!';
    }

    # if $hash_value is sym, returns the sym_value.
    # otherwise returns str_value.
    return _psym($hash_value);
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
    throw(IndexOnNonCollection => $pos, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown'
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
    throw(SetIndexOnNonCollection => $pos, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown'
    ]) if !$evt;

    return $evt->call_u($args, $call_scope);
}

# call deleteValue.
sub delete_index {
    my ($obj, $idx_exp, $pos) = @_;

    my $evt = $obj->property_u('deleteValue');
    undef $evt if !$evt->isa('Ferret::Event');

    # no event setValue
    throw(ModifyIndexOnNonCollection => $pos, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown'
    ]) if !$evt;

    return $evt->call_u([ $idx_exp ]); #, $call_scope);
}

# call weakenValue.
sub weaken_index {
    my ($obj, $idx_exp, $pos) = @_;

    my $evt = $obj->property_u('weakenValue');
    undef $evt if !$evt->isa('Ferret::Event');

    # no event setValue
    throw(ModifyIndexOnNonCollection => $pos, [
        Value    => $obj->description_ol,
        Name     => $obj->{last_name} // 'unknown'
    ]) if !$evt;

    return $evt->call_u([ $idx_exp ]); #, $call_scope);
}

###############################
### EQUALITY AND INEQUALITY ### 
###############################
# These are used only internally and retained for historical purposes


# test object equality, return Ferret boolean
sub equal_to {
    my ($left_obj, $right_obj, $scope) = @_;
    return Ferret::Core::Operations::op_star('equal', $scope, undef, $left_obj, $right_obj);
}

# test exact object equality, return Ferret boolean
sub equal_to_exactly {
    my ($left_obj, $right_obj, $scope) = @_;
    return $left_obj == $right_obj ? Ferret::true : Ferret::false;
}

# test object inequality, return Ferret boolean
sub less_than {
    my ($left_obj, $right_obj, $scope) = @_;
    return Ferret::Core::Operations::op_star('less', $scope, undef, $left_obj, $right_obj);
}

# test object inequality or equality, return Ferret boolean
sub less_than_equal {
    return Ferret::true if Ferret::truth(&less_than);
    return &equal_to;
}

# test object inequality, return Ferret boolean
sub gr8r_than {
    my ($left_obj, $right_obj, $scope) = @_;
    return Ferret::Core::Operations::op_star('gr8r', $scope, undef, $left_obj, $right_obj);
}

# test object inequality or equality, return Ferret boolean
sub gr8r_than_equal {
    return Ferret::true if Ferret::truth(&gr8r_than);
    return &equal_to;
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
