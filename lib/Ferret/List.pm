# Copyright (c) 2015, Mitchell Cooper
package Ferret::List;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Conversion qw(ferret_number perl_number);

my @methods = (
    length => {
        code => \&_length
    },
    insert => {
        need => '$index:Num $item',
        code => \&_insert
    },
    setValue => {
        need => '$item $index:Num',
        code => \&_set_value
    },
    getValue => {
        need => '$index:Num',
        code => \&_get_value
    }
);

push @methods, map { $_ => {
    need => '$item',
    code => _item_method($_)
} } qw(shift unshift push pop);

Ferret::bind_class(
    name      => 'List',
    methods   => \@methods,
    init      => \&init
);

*new = *Ferret::bind_constructor;

sub init {
    my ($list, $arguments) = @_;
    $list->{list_items} ||= [];

    # initial items.
    if (my $items = (delete $list->{items} || delete $list->{values})) {
        return $list if ref $items ne 'ARRAY';
        $list->push($_) foreach @$items;
    }

}

# wrapper for generic method bindings.
# all of them return the list.
sub _item_method {
    my $method_name = shift;
    return sub {
        my ($list, $arguments) = @_;
        my $code = $list->can($method_name) or return;
        $code->($list, $arguments->{item});
        return $list;
    }
}

sub length : method {
    my $list = shift;
    return scalar @{ $list->{list_items} };
}

sub _length {
    return ferret_number(shift->length);
}

sub shift : method {
    my ($list, $item) = @_;
    shift @{ $list->{list_items} }, $item;
}

sub unshift : method {
    my ($list, $item) = @_;
    unshift @{ $list->{list_items} }, $item;
}

sub push : method {
    my ($list, $item) = @_;
    push @{ $list->{list_items} }, $item;
}

sub pop : method {
    my ($list, $item) = @_;
    pop @{ $list->{list_items} }, $item;
}

sub insert {
    my ($list, $index, $item) = @_;
    splice @{ $list->{list_items} }, $index, 0, $item;
}

sub _insert {
    my ($list, $arguments) = @_;
    my $index = perl_number($arguments->{index});
    $list->insert($index, $arguments->{item});
    return $list;
}

sub set_value {
    my ($list, $index, $item) = @_;
    $list->{list_items}[$index] = $item;
}

sub _set_value {
    my ($list, $arguments) = @_;
    my $index = perl_number($arguments->{index});
    $list->set_value($index, $arguments->{value});
    return $list;
}

sub get_value {
    my ($list, $index) = @_;
    return $list->{list_items}[$index];
}

sub _get_value {
    my ($hash, $arguments) = @_;
    my $index = perl_number($arguments->{index});
    return $hash->get_value($index);
}

sub iterate {
    my $list = shift;
    return @{ $list->{list_items} };
}

sub iterate_pair {
    my $list = shift;
    my $i = 0;
    return map [ ferret_number($i++), $_ ], @{ $list->{list_items} };
}

1
