# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::Math;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @functions;

# one argument
bind_math_func($_, 1) foreach qw(
    cos exp int log rand sin sqrt
    srand
);

# two arguments
bind_math_func($_, 2) foreach qw(
    atan2
);

Ferret::bind_class(
    package   => 'NATIVE',
    name      => 'Math',
    functions => \@functions
);

*new = *Ferret::bind_constructor;

sub bind_math_func {
    my ($name, $n_args) = @_;

    my $code = sub {
        my ($class, $args) = @_;

        my @args = map { $args->{"num$_"}{num_value} } 1..$n_args;
        my $value;
        {
            no strict;
            $value = *{"CORE::$name"}->(@args);
        }
        return Ferret::Number->new($class->f, num_value => $value);
    };

    push @functions, $name => {
        code => $code,
        need => join(' ', map { "\$num$_:Num" } 1..$n_args)
    };
}

1
