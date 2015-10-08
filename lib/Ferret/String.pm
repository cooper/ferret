# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed);
use Ferret::Conversion qw(
    perl_string perl_number
    ferret_string ferret_list ferret_boolean
);

my @methods = (
    opAdd => {
        need => '$other',
        code => \&op_add
    },
    length => {
        code => \&_length
    },
    split => {
        want => '$separator:Str|Reg $limit:Num',
        code => \&_split
    },
    hasPrefix => {
        need => '$prefix:Str',
        code => \&_hasPrefix
    },
    trimPrefix => {
        need => '$prefix:Str',
        code => \&_trimPrefix
    },
    copy => {
        code => \&_copy
    }
);

my @functions = (
    equal => {
        need => '$str1:Str $str2:Str',
        code => \&_equal
    }
);

Ferret::bind_class(
    name      => 'String',
    alias     => 'Str',
    methods   => \@methods,
    functions => \@functions,
    desc      => \&description
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
    return Ferret::Number->new($str->f, value => $str->length);
}

# for now, this only accepts strings.
sub _split {
    my ($str, $arguments) = @_;
    my $sep     = perl_string($arguments->{separator}); # undef returns ''
    my $limit   = $arguments->{limit} ? perl_number($arguments->{limit}) : 0;
    my @strings = split /\Q$sep\E/, $str->{value}, $limit;
    return ferret_list(map ferret_string($_), @strings);
}

sub hasPrefix {
    my ($str, $prefix) = @_;
    my $pfx = \substr($str->{value}, 0, length $prefix);
    return $$pfx eq $prefix;
}

sub _hasPrefix {
    my ($str, $arguments) = @_;
    my $pfx = perl_string($arguments->{prefix});
    return ferret_boolean($str->hasPrefix($pfx));
}

sub trimPrefix {
    my ($str, $prefix) = @_;
    my $pfx = \substr($str->{value}, 0, length $prefix);
    $$pfx = '' if $$pfx eq $prefix;
    return $str;
}

sub _trimPrefix {
    my ($str, $arguments) = @_;
    my $pfx = perl_string($arguments->{prefix});
    return $str->trimPrefix($pfx);
}

sub description {
    my ($str, $own_only) = @_;
    $str = q(").$str->{value}.q(");
    $str =~ s/\r\n|\r|\n/\x{2424}/g;
    return $str;
}

# TODO: copy will eventually be an Object method.
sub _copy {
    my $str = shift;
    return ferret_string($str->{value});
}

# any of these work
#
# Ferret::String->equal($str1, $str2)
# $str1->equal($str2)
# equal($str1, $str2)
#
# but usage from Ferret is
#
# String.equal($str1, $str2)
# ($str1, $str2).equal()
#
sub equal {
    shift if !blessed $_[0];
    my ($str1, $str2) = @_;
    return $str1->{value} eq $str2->{value};
}

sub _equal {
    my ($str_class, $arguments) = @_;
    my ($str1, $str2) = @$arguments{'str1', 'str2'};
    return ferret_boolean(equal($str1, $str2));
}

1
