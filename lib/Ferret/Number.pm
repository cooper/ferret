# Copyright (c) 2014, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use List::Util qw(sum);

my @methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Num'
    },
    op_sub => {
        code => \&op_sub,
        need => '$other:Num'
    },
    op_div => {
        code => \&op_div,
        need => '$other:Num'
    },
    op_mul => {
        code => \&op_mul,
        need => '$other:Num'
    },
    op_pow => {
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
    my $new_value = $num->{value} + $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

# number minus number
sub op_sub {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} - $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

# number divided by number
sub op_div {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} / $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

# number times number
sub op_mul {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} * $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

# number to a number power
sub op_pow {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} ** $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

sub _sum {
    # TODO: more than two arguments.
    my ($class, $arguments) = @_;
    my $sum = sum map { $_->{value} } values %$arguments;
    return Ferret::Number->new($class->ferret, value => $sum);
}

1
