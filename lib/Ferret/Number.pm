# Copyright (c) 2014, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Num'
    },
    op_div => {
        code => \&op_div,
        need => '$other:Num'
    },
    op_mul => {
        code => \&op_mul,
        need => '$other:Num'
    }
);

*new = *Ferret::bind_constructor;
Ferret::bind_class(
  # package   => 'Some::Package',   # e.g. Math
  # parent    => 'Object',          # space-separated list (default: Object)
    name      => 'Number',
    alias     => 'Num',             # space-separated list
  # functions => \@functions,
    methods   => \@methods          # added as callbacks. do not overwrite each other.
);

# number plus number
sub op_add {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} + $other->{value};
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

1
