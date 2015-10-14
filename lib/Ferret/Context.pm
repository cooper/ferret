# Copyright (c) 2013, Mitchell Cooper
package Ferret::Context;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Scope';

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new scope.
    my $context = $class->SUPER::new($f,
        faketype => 'Context',
        %opts
    );

    return $context;
}

sub closest_context { shift }

1
