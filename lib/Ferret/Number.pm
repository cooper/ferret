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
    fsym flist_fromref fstring
    FUNC_V1
);

my @methods = (
    opEqual => {
        code => \&_op_equal,
        need => '$rhs:Num'
    },
    opLess => {
        code => \&_op_less,
        need => '$rhs:Num'
    },
    opGr8r => {
        code => \&_op_gr8r,
        need => '$rhs:Num'
    },
    opAdd => {
        code => \&_op_add,
        need => '$rhs:Num'
    },
    opSub => {
        code => \&_op_sub,
        need => '$rhs:Num'
    },
    opDiv => {
        code => \&_op_div,
        need => '$rhs:Num'
    },
    opMul => {
        code => \&_op_mul,
        need => '$rhs:Num'
    },
    opPow => {
        code => \&_op_pow,
        need => '$rhs:Num'
    },
    opMod => {
        code => \&_op_mod,
        need => '$rhs:Num'
    },
    opRange => {
        code => \&_op_range,
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
        code => \&_hash_value,
        prop => 1
    }
);

Ferret::bind_class(
    name      => 'Number',
    alias     => 'Num',
    methods   => \@methods,
    init      => \&init,
    init_want => '$from',
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($num, $args) = &FUNC_V1;

    # from other value.
    if (my $from = $args->{from}) {
        $num->{num_value} = pnumber($from);
    }
    $num->{num_value} = 0 if !defined $num->{num_value};

    # force numeric context.
    $num->{num_value} += 0;

}

# number plus number
sub _op_add {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) + pnumber($rhs);
    return fnumber($new_value);
}

# number minus number
sub _op_sub {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) - pnumber($rhs);
    return fnumber($new_value);
}

# number divided by number
sub _op_div {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) / pnumber($rhs);
    return fnumber($new_value);
}

# number times number
sub _op_mul {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) * pnumber($rhs);
    return fnumber($new_value);
}

# number to a number power
sub _op_pow {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) ** pnumber($rhs);
    return fnumber($new_value);
}

sub _op_mod {
    my ($num, $args) = &FUNC_V1;
    my $rhs = $args->{rhs};
    my $new_value = pnumber($num) % pnumber($rhs);
    return fnumber($new_value);
}

sub _op_range {
    my ($num, $args, $call_scope) = &FUNC_V1;
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
    my ($num) = &FUNC_V1;
    return Ferret::String->new($num->f, str_value => "$$num{num_value}");
}

sub _round {
    my ($num) = &FUNC_V1;
    my $v = $num->{num_value};
    return fnumber(int( $v + $v / abs($v * 2) ));
}

sub _ceil {
    my ($num) = &FUNC_V1;
    return fnumber(ceil($num->{num_value}));
}

sub _floor {
    my ($num) = &FUNC_V1;
    return fnumber(floor($num->{num_value}));
}

sub description {
    my $str = "$_[0]{num_value}";
    undef while $str =~ s/^(-?\d+)(\d{3})/$1,$2/;
    return $str;
}

sub _hash_value {
    my ($num) = &FUNC_V1;
    return fsym($num->{num_value});
}

sub equal {
    shift if !blessed $_[0];
    my ($num1, $num2) = @_;
    return $num1->{num_value} == $num2->{num_value};
}

sub gr8r {
    shift if !blessed $_[0];
    my ($num1, $num2) = @_;
    return $num1->{num_value} > $num2->{num_value};
}

sub less {
    shift if !blessed $_[0];
    my ($num1, $num2) = @_;
    return $num1->{num_value} < $num2->{num_value};
}

sub _op_equal {
    my ($num, $args) = &FUNC_V1;
    return fbool($num->equal($args->{rhs}));
}

sub _op_gr8r {
    my ($num, $args) = &FUNC_V1;
    return fbool($num->gr8r($args->{rhs}));
}

sub _op_less {
    my ($num, $args) = &FUNC_V1;
    return fbool($num->less($args->{rhs}));
}

1
