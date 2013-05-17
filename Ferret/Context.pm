# Copyright (c) 2013, Mitchell Cooper
package Ferret::Context;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Scope';

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;
    
    # create a new scope.
    my $context = $class->SUPER::new($f, %opts);

    return $context;
}

1
