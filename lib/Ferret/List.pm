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
);

my @methods = (
    length => {
        code => \&_length,
        prop => 1
    },
    insert => {
        need => '$index:Num $item',
        code => \&_insert
    },
    join => {
        need => '$separator:Str',
        code => \&_join
    },
    setValue => {
        need => '$item $index:Num',
        code => \&_set_value
    },
    getValue => {
        need => '$index:Num',
        code => \&_get_value
    },
    shift => {
        code => \&_item_method
    },
    toSet => {
        code => \&_to_set
    },
    pop => {
        code => \&_item_method
    },
    unshift => {
        need => '$item',
        code => \&_item_method
    },
    push => {
        need => '$item',
        code => \&_item_method
    }
);

Ferret::bind_class(
    name      => 'List',
    methods   => \@methods,
    init      => \&init,
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($list, $args) = @_;
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
    my ($list, $args, undef, undef, undef, $func) = @_;
    my $code = $list->can($func->{event_name}) or return;
    my $ret  = $code->($list, $args->{item});
    return blessed $ret ? $ret : $list;
}

sub length : method {
    my $list = shift;
    return scalar @{ $list->{list_items} };
}

sub _length {
    return fnumber(shift->length);
}

sub shift : method {
    my ($list) = @_;
    shift @{ $list->{list_items} };
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
    my ($list) = @_;
    pop @{ $list->{list_items} };
}

sub insert {
    my ($list, $index, $item) = @_;
    splice @{ $list->{list_items} }, $index, 0, $item;
}

sub _insert {
    my ($list, $args) = @_;
    my $index = $args->pnumber('index');
    $list->insert($index, $args->{item});
    return $list;
}

sub join : method {
    my ($list, $separator) = @_;
    my @items = map pstring($_), @{ $list->{list_items} };
    return join $separator, @items;
}

sub _join {
    my ($list, $args) = @_;
    my $sep = $args->pstring('separator');
    return fstring($list->join($sep));
}

sub set_value {
    my ($list, $index, $item) = @_;
    $list->{list_items}[$index] = $item;
}

sub _set_value {
    my ($list, $args) = @_;
    my $index = $args->pnumber('index');
    $list->set_value($index, $args->{item});
    return $list;
}

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
    my ($list, $args) = @_;
    my $index = $args->pnumber('index');
    return $list->get_value($index);
}

sub _to_set {
    my ($list, $args, $call_scope) = @_;
    my ($first_obj, @other_objs) = @{ $list->{list_items} };

    # set must have at least two items.
    if (!$first_obj || !@other_objs) {
        return Ferret::undefined;
    }

    return $first_obj->create_set($call_scope, @other_objs);
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

sub iterate {
    my $list = shift;
    return @{ $list->{list_items} };
}

sub iterate_pair {
    my $list = shift;
    my $i = 0;
    return map [ fnumber($i++), $_ ], @{ $list->{list_items} };
}

1
