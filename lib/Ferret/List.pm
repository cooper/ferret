# Copyright (c) 2015, Mitchell Cooper
package Ferret::List;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed);
use Ferret::Core::Conversion qw(
    fnumber pnumber
    fstring pstring
    pdescription
    flist_fromref flist
    FUNC_V1 FUNC_FUNC
);

my @methods = (
    length => {
        code => \&_length,
        prop => 1
    },
    lastIndex => {
        code => \&_last_index,
        prop => 1
    },
    insert => {
        need => '$index:Num $value:T',
        code => \&_insert
    },
    splice => {
        need => '$offset:Num $length:Num',
        code => \&_splice
    },
    join => {
        need => '$separator:Str',
        code => \&_join
    },
    setValue => {
        need => '$value:T $index:Num',
        code => \&_set_value
    },
    getValue => {
        need => '$index:Num',
        code => \&_get_value
    },
    deleteValue => {
        need => '$index:Num',
        code => \&_delete_value
    },
    weakenValue => {
        need => '$index:Num',
        code => \&_weaken_value
    },
    shift => {
        code => \&_item_method
    },
    pop => {
        code => \&_item_method
    },
    unshift => {
        need => '$value:T',
        code => \&_item_method
    },
    push => {
        need => '$items:T...',
        code => \&_push
    },
    copy => {
        want => '$deep:Bool',
        code => \&_copy
    }
);

Ferret::bind_class(
    name      => 'List',
    methods   => \@methods,
    init      => \&init,
    desc      => \&description,
    generics  => [\'T']
);

*new = *Ferret::bind_constructor;

sub init {
    my ($list, $args) = &FUNC_V1;
    $list->{list_items} ||= [];

    # reference items.
    $list->{list_items} = delete $list->{ref_values} if $list->{ref_values};

    # initial items.
    if (my $items = (delete $list->{items} || delete $list->{values})) {
        return $list if ref $items ne 'ARRAY';
        $list->push($_) foreach @$items;
    }

}

# wrapper for generic method bindings.
# all of them return the list.
sub _item_method {
    my ($func, $list, $args) = ($_[FUNC_FUNC], &FUNC_V1);
    my $code = $list->can($func->{event_name}) or return;
    my $ret  = $code->($list, $args->{value});
    return blessed $ret ? $ret : $list;
}

# how many elements
sub length : method {
    my ($list) = &FUNC_V1;
    return scalar @{ $list->{list_items} };
}

sub _length {
    my ($list) = &FUNC_V1;
    return fnumber($list->length);
}

# index of last element
sub last_index {
    my ($list) = &FUNC_V1;
    return $#{ $list->{list_items} };
}

sub _last_index {
    my ($list) = &FUNC_V1;
    my $idx = $list->last_index;
    return $idx != -1 ? fnumber($idx) : Ferret::undefined;
}

# pull element out from front
sub shift : method {
    my ($list) = @_;
    shift @{ $list->{list_items} };
}

# add element to front
sub unshift : method {
    my ($list, $item) = @_;
    unshift @{ $list->{list_items} }, $item;
}

# add element to end
sub push : method {
    my ($list, $item) = @_;
    push @{ $list->{list_items} }, $item;
}

sub _push {
    my ($list, $args) = &FUNC_V1;
    my @items = $args->plist('items');
    $list->push($_) for @items;
    return $list;
}

# pull element out from end
sub pop : method {
    my ($list) = @_;
    pop @{ $list->{list_items} };
}

# inject element at index
sub insert {
    my ($list, $index, $item) = @_;
    splice @{ $list->{list_items} }, $index, 0, $item;
}

sub _insert {
    my ($list, $args) = &FUNC_V1;
    my $index = $args->pnumber('index');
    $list->insert($index, $args->{value});
    return $list;
}

# remove element(s) at index
sub splice : method {
    my ($list, $offset, $length) = @_;
    return splice @{ $list->{list_items} }, $offset, $length;
}

sub _splice {
    my ($list, $args) = &FUNC_V1;
    my ($offset, $length) = map $args->pnumber($_), 'offset', 'length';
    my @removed = $list->splice($offset, $length);
    return @removed ? flist(@removed) : Ferret::undefined;
}

# join stringified elements by a separator
sub join : method {
    my ($list, $separator) = @_;
    my @items = map pstring($_), @{ $list->{list_items} };
    return join $separator, @items;
}

sub _join {
    my ($list, $args) = &FUNC_V1;
    my $sep = $args->pstring('separator');
    return fstring($list->join($sep));
}

# set value at index
sub set_value {
    my ($list, $index, $item) = @_;
    $list->{list_items}[$index] = $item;
}

sub _set_value {
    my ($list, $args) = &FUNC_V1;
    my $index = $args->pnumber('index');
    $list->set_value($index, $args->{value});
    return $list;
}

# fetch value at index
sub get_value {
    my ($list, $index) = @_;

    # handle negative indices (from right side).
    if ($index < 0) {
        # [1,2,3]
        # -1    2   $#
        # -2    1   $# - 1
        $index = $#{ $list->{list_items} } + $index + 1;
    }

    return $list->{list_items}[$index];
}

sub _get_value {
    my ($list, $args) = &FUNC_V1;
    my $index = $args->pnumber('index');
    return $list->get_value($index);
}

# delete value at index
sub delete_value {
    my ($list, $index) = @_;
    return $list->set_value($index, Ferret::undefined);
}

sub _delete_value {
    my ($list, $args) = &FUNC_V1;
    my $index = $args->pnumber('index');
    return $list->delete_value($index);
}

# weaken value at index
sub weaken_value {
    my ($list, $index) = @_;

    # if it's nonexistent or non-ref, do nothing
    return if !defined $list->{list_items}[$index] ||
        !ref $list->{list_items}[$index];

    weaken($list->{list_items}[$index]);
}

sub _weaken_value {
    my ($list, $args) = &FUNC_V1;
    my $index = $args->pnumber('index');
    return $list->weaken_value($index);
}

# return a copy
sub _copy {
    my ($list) = &FUNC_V1;
    # TODO: $deep
    return flist_fromref($list->{list_items});
}

sub description {
    my ($list, $own_only) = @_;

    # handle indents
    my @values = map {
        join "\n    ", split /\n/, pdescription($_, $own_only)
    } @{ $list->{list_items} };

    return "[]" if !@values;
    return "[\n    ".join("\n    ", @values)."\n]";
}

1
