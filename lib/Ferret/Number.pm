# Copyright (c) 2015, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed);
use List::Util qw(sum product min max);
use POSIX qw(ceil floor);

use Ferret::Core::Conversion qw(
    fnumber pnumber plist flist fbool
    fsym flist_fromref
    FUNC_SELF
);

my @methods = (
    opAdd => {
        code => \&op_add,
        need => '$rhs:Num'
    },
    opSub => {
        code => \&op_sub,
        need => '$rhs:Num'
    },
    opDiv => {
        code => \&op_div,
        need => '$rhs:Num'
    },
    opMul => {
        code => \&op_mul,
        need => '$rhs:Num'
    },
    opPow => {
        code => \&op_pow,
        need => '$rhs:Num'
    },
    opMod => {
        code => \&op_mod,
        need => '$rhs:Num'
    },
    opRange => {
        code => \&op_range,
        need => '$rhs:Num|undefined'
    },
    toString => {
        code => \&_to_string
    },
    floor => {
        code => \&_floor,
        prop => 1,
        pset => 1
    },
    ceil => {
        code => \&_ceil,
        prop => 1,
        pset => 1
    },
    round => {
        code => \&_round,
        prop => 1,
        pset => 1
    },
    hashValue => {
        code => \&_hash_value
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
    },
    less => {
        need => '$nums:Num...',
        code => \&_less
    },
    gr8r => {
        need => '$nums:Num...',
        code => \&_gr8r
    },
    less_e => {
        need => '$nums:Num...',
        code => \&_less_e
    },
    gr8r_e => {
        need => '$nums:Num...',
        code => \&_gr8r_e
    },
    min => {
        need => '$nums:Num...',
        code => \&_min
    },
    max => {
        need => '$nums:Num...',
        code => \&_max
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
    my ($num, $args) = @_;

    # from other value.
    if (my $from = $args->{from}) {
        $num->{num_value} = pnumber($from);
    }
    $num->{num_value} = 0 if !defined $num->{num_value};

    # force numeric context.
    $num->{num_value} += 0;

}

# number plus number
sub op_add {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) + pnumber($rhs);
    return fnumber($new_value);
}

# number minus number
sub op_sub {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) - pnumber($rhs);
    return fnumber($new_value);
}

# number divided by number
sub op_div {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) / pnumber($rhs);
    return fnumber($new_value);
}

# number times number
sub op_mul {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) * pnumber($rhs);
    return fnumber($new_value);
}

# number to a number power
sub op_pow {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) ** pnumber($rhs);
    return fnumber($new_value);
}

sub op_mod {
    my ($num, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) % pnumber($rhs);
    return fnumber($new_value);
}

sub op_range {
    my ($num, $args, $call_scope) = @_;
    my $rhs = $args->{rhs};

    # if the right operand is undefined, the result must be empty.
    if (Ferret::undefined($rhs)) {
        return flist_fromref([]);
    }

    # create the range.
    my @input = map pnumber($_), $num, $rhs;
    my @range = (min @input)..(max @input);
       @range = map fnumber($_), @range;
       @range = reverse @range if $input[0] > $input[1];

    return flist(@range);
}

sub _to_string {
    my $num = shift;
    return Ferret::String->new($num->f, str_value => "$$num{num_value}");
}

sub _round {
    my $num = shift;
    my $v = $num->{num_value};
    return fnumber(int( $v + $v / abs($v * 2) ));
}

sub _ceil {
    my $num = shift;
    return fnumber(ceil($num->{num_value}));
}

sub _floor {
    my $num = shift;
    return fnumber(floor($num->{num_value}));
}

sub description {
    my $str = "$_[0]{num_value}";
    undef while $str =~ s/^(-?\d+)(\d{3})/$1,$2/;
    return $str;
}

sub _sum {
    my ($class, $args) = @_;
    my $sum = sum map { pnumber($_) } plist($args->{nums});
    return fnumber($sum);
}

sub _product {
    my ($class, $args) = @_;
    my $sum = product map { pnumber($_) } plist($args->{nums});
    return fnumber($sum);
}

sub _hash_value {
    my $num = shift;
    return fsym($num->{num_value});
}

sub _min {
    my ($class, $args) = @_;
    my $min = min map { pnumber($_) } plist($args->{nums});
    return fnumber($min);
}

sub _max {
    my ($class, $args) = @_;
    my $max = max map { pnumber($_) } plist($args->{nums});
    return fnumber($max);
}

sub equal {
    shift if !blessed $_[FUNC_SELF];
    my ($num1, $num2) = @_;
    return $num1->{num_value} == $num2->{num_value};
}

sub _equal {
    my ($num_class, $args) = @_;
    my ($first_num, @rest_nums) = plist($args->{nums});
    foreach (@rest_nums) {
        return Ferret::false if !$first_num->equal($_);
    }
    return Ferret::true;
}

sub _less {
    my ($num_class, $args) = @_;
    my ($left, @rest_nums) = map { pnumber($_) } plist($args->{nums});
    while (@rest_nums) {
        my $right = shift @rest_nums;
        if ($left < $right) {
            $left = $right;
            next;
        }
        return Ferret::false;
    }
}

sub _less_e {
    my ($num_class, $args) = @_;
    my ($left, @rest_nums) = map { pnumber($_) } plist($args->{nums});
    while (@rest_nums) {
        my $right = shift @rest_nums;
        if ($left <= $right) {
            $left = $right;
            next;
        }
        return Ferret::false;
    }
}

sub _gr8r {
    my ($num_class, $args) = @_;
    my ($left, @rest_nums) = map { pnumber($_) } plist($args->{nums});
    while (@rest_nums) {
        my $right = shift @rest_nums;
        if ($left > $right) {
            $left = $right;
            next;
        }
        return Ferret::false;
    }
}

sub _gr8r_e {
    my ($num_class, $args) = @_;
    my ($left, @rest_nums) = map { pnumber($_) } plist($args->{nums});
    while (@rest_nums) {
        my $right = shift @rest_nums;
        if ($left >= $right) {
            $left = $right;
            next;
        }
        return Ferret::false;
    }
}

1
