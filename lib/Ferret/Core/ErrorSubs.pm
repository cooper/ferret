# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::ErrorSubs;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Errors qw(throw);
use Ferret::Conversion qw(ferret_string perl_string);

sub Ferret::Object::call {
    my $obj = shift;
    throw(CallOnNonFunction => [caller], join(', ', $obj->parent_names));
}

1
