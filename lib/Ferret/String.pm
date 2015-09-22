# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Conversion qw(perl_string perl_number ferret_string ferret_list);

my @methods = (
    opAdd => {
        need => '$other',
        code => \&op_add
    },
    length => {
        code => \&_length
    },
    split => {
        need => '$separator:Str|Reg',
        want => '$limit:Num',
        code => \&_split
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

# for now, this only accepts strings.
sub _split {
    my ($str, $arguments) = @_;
    my $sep     = perl_string($arguments->{separator});
    my $limit   = $arguments->{limit} ? perl_number($arguments->{limit}) : 0;
    my @strings = split /\Q$sep\E/, $str->{value}, $limit;
    return ferret_list(map ferret_string($_), @strings);
}

1
