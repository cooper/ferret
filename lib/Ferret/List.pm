# Copyright (c) 2015, Mitchell Cooper
package Ferret::List;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(
    ferret_number perl_number
    ferret_string perl_string
    perl_description
);

my @methods = (
    length => {
        code => \&_length
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
    }
);

push @methods, map { $_ => {
    need => '$item',
    code => _item_method($_)
} } qw(shift unshift push pop);

Ferret::bind_class(
    name      => 'List',
    methods   => \@methods,
    init      => \&init,
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($list, $arguments) = @_;
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

sub join : method {
    my ($list, $separator) = @_;
    my @items = map perl_string($_), @{ $list->{list_items} };
    return join $separator, @items;
}

sub _join {
    my ($list, $arguments) = @_;
    my $sep = perl_string($arguments->{separator});
    return ferret_string($list->join($sep));
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
    my ($list, $arguments) = @_;
    my $index = perl_number($arguments->{index});
    return $list->get_value($index);
}

sub description {
    my ($list, $own_only) = @_;

    # handle indents
    my @values = map {
        join "\n    ", split /\n/, perl_description($_, $own_only)
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
    return map [ ferret_number($i++), $_ ], @{ $list->{list_items} };
}

1
