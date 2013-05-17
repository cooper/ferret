# Copyright (c) 2013 Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;

# create a new ferret.
sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

# returns the main context.
sub context {
    shift->{context};
}

1
