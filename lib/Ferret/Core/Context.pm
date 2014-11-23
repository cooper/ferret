# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Context;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Context';

my %functions = (
    say => [ \&_say, qw(message) ]
);

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;
    my $context = $class->SUPER::new($f, %opts);
    foreach my $name (keys %functions) {
        my ($code, @args) = @{ $functions{$name} };

        # create function with proper requirements.
        my $func = Ferret::Function->new($f,
            name => 'default',
            code => $code
        );
        $func->add_argument(name => $_) foreach @args;

        # create and bind an event for the function.
        my $event = Ferret::Event->new($f, default_func => $func);
        $context->bind_event($name => $event);

    }
    return $context;
}

sub _say {
    my $arguments = shift;
    print $arguments->{message}, $/;
}

1
