# Copyright (c) 2015, Mitchell Cooper
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

sub full_name {
    my $context = shift;
    return $context->{full_name} if length $context->{full_name};
    return $context->{name};
}

1
