# Copyright (c) 2015, Mitchell Cooper
package Ferret::Hash;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(
    pstring fnumber
    fstring flist
    pdescription
);

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
        need => '$value $index',
        code => \&_set_value
    },
    getValue => {
        need => '$index',
        code => \&_get_value
    }
);

Ferret::bind_class(
    name      => 'Hash',
    methods   => \@methods,
    init      => \&init,
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($hash, $args) = @_;
    $hash->{hash_values} ||= {};
    if (my $pairs = delete $hash->{pairs}) {
        $hash->set_value($_ => $pairs->{$_}) foreach keys %$pairs;
    }
    $hash->set_value($_ => $args->{$_}) foreach keys %$args;
}

sub set_value {
    my ($hash, $key, $value) = @_;
    # TODO: check for a hashValue function
    $key = pstring($key);
    $hash->{hash_values}{$key} = $value;
}

sub _set_value {
    my ($hash, $args) = @_;
    $args->{key} ||= $args->{index};
    $hash->set_value(@$args{'key', 'value'});
    return $hash;
}

sub get_value {
    my ($hash, $key) = @_;
    return $hash->{hash_values}{$key};
}

sub _get_value {
    my ($hash, $args) = @_;
    my $key = $args->{key} // $args->{index};
    $key = $key->{sym_value} if length $key->{sym_value};
    $key = pstring($key);
    return $hash->get_value($key);
}

sub length : method {
    my $hash = shift;
    return scalar keys %{ $hash->{hash_values} };
}

sub _length {
    return fnumber(shift->length);
}

sub keys : method {
    return keys %{ shift->{hash_values} };
}

sub _keys {
    my $hash = shift;
    my @keys = map fstring($_), $hash->keys;
    return flist(@keys);
}

sub values : method {
    return values %{ shift->{hash_values} };
}

sub _values {
    return flist(shift->values);
}

sub description {
    my ($hash, $own_only) = @_;
    my @keys   = $hash->keys;

    my @values = map {
        join "\n    ", split /\n/, pdescription($_, $own_only)
    } $hash->values;

    return "[:]" if !@keys;

    my $i = 0;
    foreach my $key (@keys) {
        $values[$i] = "$key: ".$values[$i];
        $i++;
    }

    return "[\n    ".join("\n    ", @values)."\n]";
}

sub iterate_pair {
    my $hash = shift;
    my %hash = %{ $hash->{hash_values} };
    return map [ fstring($_), $hash{$_} ], keys %hash;
}

1
