# Copyright (c) 2014, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed);
use List::Util qw(sum product);

use Ferret::Core::Conversion qw(
    ferret_number perl_number
    ferret_boolean perl_list
);

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
    toString => {
        code => \&_to_string
    }
);

my @functions = (
    sum => {
        need => '$nums:Num...',
        code => \&_sum
    },
    product => {
        need => '$nums:Num...',
        code => \&_product
    },
    equal => {
        need => '$nums:Num...',
        code => \&_equal
    }
);

Ferret::bind_class(
    name      => 'Number',
    alias     => 'Num',
    methods   => \@methods,
    functions => \@functions,
    init      => \&init,
    init_want => '$from',
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($num, $arguments) = @_;

    # from other value.
    if (my $from = $arguments->{from}) {
        $num->{num_value} = perl_number($from);
    }
    $num->{num_value} = 0 if !defined $num->{num_value};

    # evenness.
    my $odd = $num->{num_value} % 2;
    $num->set_property(odd  => ferret_boolean($odd));
    $num->set_property(even => ferret_boolean(!$odd));

}

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

sub _to_string {
    my $num = shift;
    return Ferret::String->new($num->f, str_value => $num->{num_value});
}

sub description {
    return shift->{num_value};
}

sub _sum {
    my ($class, $arguments) = @_;
    my $sum = sum map { perl_number($_) } perl_list($arguments->{nums});
    return ferret_number($sum);
}

sub _product {
    my ($class, $arguments) = @_;
    my $sum = product map { perl_number($_) } perl_list($arguments->{nums});
    return ferret_number($sum);
}

sub equal {
    shift if !blessed $_[0];
    my ($num1, $num2) = @_;
    return $num1->{num_value} == $num2->{num_value};
}

sub _equal {
    my ($num_class, $arguments) = @_;
    my ($first_num, @rest_nums) = perl_list($arguments->{nums});
    foreach (@rest_nums) {
        return Ferret::false if !$first_num->equal($_);
    }
    return Ferret::true;
}

1
