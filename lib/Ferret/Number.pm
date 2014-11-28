# Copyright (c) 2014, Mitchell Cooper
package Ferret::Number;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

our %methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Num'
    }
);

sub methods { (shift->SUPER::methods, %methods) }

# number plus number
sub op_add {
    my ($num, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $num->{value} + $other->{value};
    return Ferret::Number->new($num->ferret, value => $new_value);
}

1
