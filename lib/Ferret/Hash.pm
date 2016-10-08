# Copyright (c) 2015, Mitchell Cooper
package Ferret::Hash;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(
    fnumber fstring flist fhash_fromref fhash
    pdescription psym pstring
);

my @methods = (
    keys => {
        code => \&_keys,
        prop => 1
    },
    values => {
        code => \&_values,
        prop => 1
    },
    length => {
        code => \&_length,
        prop => 1
    },
    setValue => {
        need => '$value:V $index:K',
        code => \&_set_value
    },
    getValue => {
        need => '$index:K',
        code => \&_get_value
    },
    copy => {
        want => '$deep:Bool',
        code => \&_copy
    }
);

Ferret::bind_class(
    name      => 'Hash',
    methods   => \@methods,
    init      => \&init,
    desc      => \&description,
    generics  => [\'K', \'V']
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
    # FIXME: check for a hashValue function
    # if missing, use the address of the object
    $key = pstring($key);
    $hash->{hash_values}{$key} = $value;
}

sub _set_value {
    my ($hash, $args) = @_;
    my $key = $args->psym('index');
    $hash->set_value($key, $args->{value});
    return $hash;
}

sub get_value {
    my ($hash, $key) = @_;
    return $hash->{hash_values}{$key};
}

sub _get_value {
    my ($hash, $args) = @_;
    my $key = $args->psym('index');
    return $hash->get_value($key);
}

sub _copy {
    my ($hash, $args) = @_;
    # TODO: deep (recursive)
    my $deep = $args->pbool('deep');
    return fhash_fromref($hash->{hash_values});
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
