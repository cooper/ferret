# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;

use Scalar::Util 'blessed';

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
sub property {
    my ($obj, $prop_name) = @_;

    # try the local property first.
    # this is done separately first because hopefully,
    # we won't even need to generate ->parents.
    return $obj->{properties}{$prop_name}
        if exists $obj->{properties}{$prop_name};

    # try inheritance.
    foreach my $o ($obj->parents) {
        my $value = $o->property($prop_name);
        return $value if defined $value;
    }

    return;
}

# fetches a property.
# does not take inheritance into account.
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub own_property {
    shift->{properties}{+shift};
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

################
### FETCHERS ###
################

# fetch the ferret.
sub ferret {
    shift->{ferret};
}

1
