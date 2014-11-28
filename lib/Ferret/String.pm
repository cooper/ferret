# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

our %methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Str'
    }
);

sub methods { (shift->SUPER::methods, %methods) }

# string plus string
sub op_add {
    my ($str, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $str->{value}.$other->{value};
    return Ferret::String->new($str->ferret, value => $new_value);
}

1
