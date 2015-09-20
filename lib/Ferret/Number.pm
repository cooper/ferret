# Copyright (c) 2014, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Conversion qw(ferret_number perl_number);
use List::Util qw(sum);

my @methods = (
    opAdd => {
        code => \&op_add,
        need => '$other:Num'
    },
    opSub => {
        code => \&op_sub,
        need => '$other:Num'
    },
    opDiv => {
        code => \&op_div,
        need => '$other:Num'
    },
    opMul => {
        code => \&op_mul,
        need => '$other:Num'
    },
    opPow => {
        code => \&op_pow,
        need => '$other:Num'
    },
    sum => {
        code => \&_sum,
        need => '$num1:Num num2:Num',
        main => 1
    }
);

Ferret::bind_class(
    name      => 'Number',
    alias     => 'Num',
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

# number plus number
sub op_add {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_number($num) + perl_number($other);
    return ferret_number($new_value);
}

# number minus number
sub op_sub {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_number($num) - perl_number($other);
    return ferret_number($new_value);
}

# number divided by number
sub op_div {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_number($num) / perl_number($other);
    return ferret_number($new_value);
}

# number times number
sub op_mul {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_number($num) * perl_number($other);
    return ferret_number($new_value);
}

# number to a number power
sub op_pow {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_number($num) ** perl_number($other);
    return ferret_number($new_value);
}

sub _sum {
    # TODO: more than two arguments.
    my ($class, $arguments) = @_;
    my $sum = sum map { perl_number($_) } values %$arguments;
    return ferret_number($sum);
}

1
