# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Str'
    },
    length => {
        code => \&_length
    }
);

Ferret::bind_class(
    name      => 'String',
    alias     => 'Str',
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

# string plus string
sub op_add {
    my ($str, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $str->{value}.$other->{value};
    return Ferret::String->new($str->ferret, value => $new_value);
}

sub length : method {
    my $str = shift;
    return length $str->{value};
}

sub _length {
    my $str = shift;
    return Ferret::Number->new($str->ferret, value => $str->length);
}

1
