# Copyright (c) 2015, Mitchell Cooper
package Ferret::List;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

my @methods = (

length => {
    code => sub {
        my $list = shift;
        return Ferret::Number->new($list->ferret, value => $list->length);
    }
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
    if (my $items = delete $list->{items}) {
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
    # TODO: fire 'push' event
    push @{ $list->{list_items} }, $item;
}

sub pop : method {
    my ($list, $item) = @_;
    pop @{ $list->{list_items} }, $item;
}

sub iterate {
    my $list = shift;
    return @{ $list->{list_items} };
}

1
