# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;
use parent 'Evented::Object';

use Scalar::Util qw(blessed weaken);

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
    my ($obj, $prop_name, $value) = @_;

    # ensure that it is a valid Ferret value.
    if (ref $value ne 'CODE' && !Ferret::valid_value($value)) {
        return;
    }

    # store the value.
    $obj->{properties}{$prop_name} = $value;

    # good.
    return 1;

}

# set a property or overwrite an inherited property.
sub set_property_ow {
    my ($obj, $prop_name, $value) = @_;
    my $owner = $obj->has_property($prop_name) || $obj;
    return $owner->set_property($prop_name => $value);
    return
}

# deletes a property.
# $obj->delete_property('someProperty')
#
# this is different from setting a value to undefined.
# an undefined value is still a value. deleting a property makes it valueless.
# if you
#
# returns true if something was deleted, false otherwise.
#
sub delete_property {
    my ($obj, $prop_name) = @_;
    return defined delete $obj->{properties}{$prop_name};
}

# fetches a property.
# $obj->property('someProperty')
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub property { (&_property)[0] }

# this should not be used directly.
# it returns a property value and its owner.
sub _property {
    my ($obj, $prop_name, $borrow_obj) = @_;
    $borrow_obj ||= $obj; # the object inheriting the property.

    # try the local property first.
    # this is done separately first because hopefully,
    # we won't even need to generate ->parents.
    if (defined $obj->{properties}{$prop_name}) {
        my $p = $obj->{properties}{$prop_name};
        weaken($p->{last_parent} = $borrow_obj) if blessed $p;
        return ($p, $obj);
    }

    # try a different context.
    if (index($prop_name, '::') != -1) {
        my ($context, $real_prop_name) = ($prop_name =~ m/^(.+)::(.+?)$/);
        $context = $obj->ferret->get_context($context);
        return $context->_property($real_prop_name);
    }

    # try inheritance.
    foreach my $o ($obj->parents) {
        my @v = $o->_property($prop_name, $obj);
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

# weaken a property.
# this only applies to local properties.
#
sub weaken_property {
    my ($obj, $prop_name) = @_;
    weaken($obj->{properties}{$prop_name});
}

# convenience method:
# sets a property, then weakens it.
#
sub set_property_weak {
    my ($obj, $prop_name, $value) = @_;
    my $res = $obj->set_property($prop_name => $value);
    $obj->weaken_property($prop_name);
    return $res;
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
        $found{$class_1}++;
        return $class_2 if $found{$class_2};
    }
    return undef;
    # TODO: it eventually should never return undef but instead Object.
}

#####################
### MISCELLANEOUS ###
#####################

# create an object that represents a set of objects.
sub create_set {
    my ($obj, $from_scope, @other_objs) = @_;
    return Ferret::Set->new($obj->ferret,
        primary_obj => $obj,
        other_objs  => \@other_objs,
        all_objs    => [ $obj, @other_objs ],
        set_class   => best_common_class($obj, @other_objs),
        set_scope   => $from_scope
    );
}

# call getValue.
sub get_index_value {
    my ($obj, $arguments, $from_scope) = @_;
    return $obj->property('getValue')->call($arguments, $from_scope);
}

# call setValue.
# because the number of indices can be variable, the value is always first.
sub set_index_value {
    my ($obj, $arguments, $value, $from_scope) = @_;
    unshift @$arguments, $value;
    return $obj->property('setValue')->call($arguments, $from_scope);
}

################
### FETCHERS ###
################

# fetch the ferret.
sub ferret {
    shift->{ferret};
}

1
