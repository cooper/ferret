# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Context;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Context';

use Ferret::Core::Conversion qw(ferret_list);

my %functions = (
    say     => [ '_say',     qw(message)   ],
    dump    => [ '_dump',    qw(value)     ],
    inspect => [ '_inspect', qw(value)     ],
    require => [ '_require', qw(test)      ],
    any     => [ '_any', qw(value1 value2) ],    # FIXME: values...
    all     => [ '_all', qw(value1 value2) ],
);

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;
    my $context = $class->SUPER::new($f, %opts, is_core => 1);

    # set the object initializer.
    $context->set_property(Object => $f->{object_initializer});
    $context->set_property(Obj    => $f->{object_initializer});

    # global special variables.
    $context->{special}->set_property(argv => [ sub { ferret_list(\@ARGV) }]);

    return $context;
}

sub add_global_functions {
    my $context = shift;
    my $f = $context->f;

    # add global functions.
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

        $event->inside_scope($name, $context, $context, undef);
    }
}

1
