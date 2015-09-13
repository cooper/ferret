# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Context;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Context';

my %functions = (
    say  => [ '_say',  qw(message) ],
    dump => [ '_dump', qw(value)   ]
);

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;
    my $context = $class->SUPER::new($f, %opts, is_core => 1);
    foreach my $name (keys %functions) {
        my ($code, @args) = @{ $functions{$name} };
        $code = Ferret::Core::Functions->can($code) or next;

        # create function with proper requirements.
        my $func = Ferret::Function->new($f,
            name => 'default',
            code => $code
        );
        $func->add_argument(name => $_) foreach @args;

        # create and bind an event for the function.
        my $event = Ferret::Event->new($f,
            name         => $name,
            default_func => [ undef, $func ]
        );

        $context->set_property($name => $event);

    }
    return $context;
}

1
