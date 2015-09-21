# Copyright (c) 2015, Mitchell Cooper
package Ferret::Hash;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Conversion qw(perl_string ferret_number ferret_string ferret_list);

my @methods = (
    keys => {
        code => \&_keys
    },
    values => {
        code => \&_values
    },
    length => {
        code => \&_length
    },
    setValue => {
        need => '$index $value',
        code => \&_set_pair
    }
);

Ferret::bind_class(
    name      => 'Hash',
    methods   => \@methods,
    init      => \&init
);

*new = *Ferret::bind_constructor;

sub init {
    my ($hash, $arguments) = @_;
    $hash->{hash_values} ||= {};
    if (my $pairs = delete $hash->{pairs}) {
        $hash->set_pair($_ => $pairs->{$_}) foreach keys %$pairs;
    }
    $hash->set_pair($_ => $arguments->{$_}) foreach keys %$arguments;
}

sub set_pair {
    my ($hash, $key, $value) = @_;
    # TODO: check for a hashValue function
    $key = perl_string($key);
    $hash->{hash_values}{$key} = $value;
}

sub _set_pair {
    my ($hash, $arguments) = @_;
    $arguments->{key} ||= $arguments->{index};
    $hash->set_pair(@$arguments{'key', 'value'});
    return $hash;
}

sub length : method {
    my $hash = shift;
    return scalar keys %{ $hash->{hash_values} };
}

sub _length {
    return ferret_number(shift->length);
}

sub keys : method {
    return keys %{ shift->{hash_values} };
}

sub _keys {
    my $hash = shift;
    my @keys = map ferret_string($_), $hash->keys;
    return ferret_list(@keys);
}

sub values : method {
    return keys %{ shift->{hash_values} };
}

sub _values {
    return ferret_list(shift->values);
}

sub iterate_pair {
    my $hash = shift;
    my %hash = %{ $hash->{hash_values} };
    return map [ ferret_string($_), $hash{$_} ], keys %hash;
}

1
