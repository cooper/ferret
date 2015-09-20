# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Conversion qw(perl_string ferret_string);

my @methods = (
    opAdd => {
        code => \&op_add,
        need => '$other'
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
    my $new_value = perl_string($str).perl_string($other);
    return ferret_string($new_value);
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
