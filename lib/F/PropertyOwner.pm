# Copyright 2016, Mitchell Cooper
package F::PropertyOwner;

use warnings;
use strict;
use parent 'F::Element';

# PropertyOwners are nodes that can be traced back to a property on an object.
# They must be able to provide code to access this object as well as either
# a string property name or some code which evaluates to a property name.

sub property_name       { } # one of ->property_name or ->property_name_code
sub property_name_code  { } # must be implemented.
sub property_owner_code { } # ->property_owner_code must be implemented.

1
