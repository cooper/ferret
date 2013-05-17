# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;

use Scalar::Util 'blessed';

# create a new object.
sub new {
    my ($class, $f, %opts) = @_;
    my $obj = bless { ferret => $f }, $class;
    return $obj;
}
##################
### PROPERTIES ###
##################

# sets a property.
# $obj->set_property(someProperty => $someValue)
#
# where $someValue is either
#
# a) a Ferret::Object (or something that inherits from Object)
# b) a reference to code that returns a Ferret::Object
#
# returns Perl boolean true if set successfully, false otherwise.
#
sub set_property {
    my ($obj, $prop_name, $value) = @_;
    
    # ensure that it is a valid Ferret value.
    if (ref $value ne 'CODE' && !Ferret::valid_value($value)) {
        return;
    }
    
    # if we are setting it undefined, that just means we're deleting it.
    if ($value == Ferret::undefined) {
    
        # XXX: delete method.
        delete $obj->{properties}{$prop_name};
        
        return 1;
    }
    
    # store the value.
    $obj->{properties}{$prop_name} = $value;
    
    # good.
    return 1;
    
}

##########################
### SPECIAL PROPERTIES ###
##########################

###################
### INHERITANCE ###
###################

################
### FETCHERS ###
################

# fetch the ferret.
sub ferret {
    shift->{ferret};
}

1
