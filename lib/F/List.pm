# Copyright 2014 Mitchell Cooper
package F::List;

use warnings;
use strict;
use parent qw(F::Structure F::Expression);

sub type { 'List' }

sub desc {
    my $list = shift;
    return sprintf '%s [%d items]', $list->list_type, scalar $list->children;
}

sub list_type {
    my $list = shift;
    if ($list->is_collection) {
        return 'hash'       if $list->is_hash;
        return 'value list' if $list->is_array;
    }
    return 'object'         if $list->is_hash;
    return 'set'            if $list->children > 1;
    return 'single value'   if $list->children;
    return 'structural list';
}

# type      Example     is_array    is_hash     is_collection
# -----------------------------------------------------------
# Sets      ()          true        false       false
# Objects   (:)         false       true        false
# Hashes    [:]         false       true        true
# Lists     []          true        false       true
#
sub is_array      { shift->{array}      }
sub is_hash       { shift->{hash}       }
sub is_collection { shift->{collection} }

sub new_item {
    my $list = shift;
    my $item = F::ListItem->new(
        item_num => $list->{item_c}++,
        no_instructions => 1
    );
    return $list->adopt($item);
}

sub perl_fmt {
    my $list = shift;
    my @children = $list->children;

    my $get_pairs = sub {
        join ', ', map {
            my $key = $_->first_child->key;
            my $val = $_->first_child->value->perl_fmt_do;
            "$key => $val"
        } @children;
    };

    my $get_items = sub {
        join ', ', map $_->perl_fmt_do, @children;
    };

    # it's either an array or a hash.
    if ($list->is_collection) {
        return hash => { pairs => $get_pairs->() } if $list->is_hash;
        return list => { items => $get_items->() } if $list->is_array;
    }

    # it's either a set or an object.

    # it has pairs but is not a collection, so it's an object.
    return object => { pairs => $get_pairs->() } if $list->is_hash;

    # it has more than one value. therefore it's a set.
    if (@children > 1) {
        my $first_child = shift @children;
        my $items_str   = join ', ', map $_->perl_fmt_do, @children;
        return set => {
            first_item  => $first_child->perl_fmt_do,
            other_items => $items_str
        };
    }

    # it's an empty set ().
    return expression => { content => 'Ferret::undefined' } if !$children[0];

    # it's just one parenthesized value.
    return expression => { content => $children[0]->perl_fmt_do };

}

# filter out empty items.
sub close : method {
    my $list = shift;
    foreach my $item ($list->children) {
        next if $item->children;
        $list->abandon($item);
    }
    $list->SUPER::close;
}

1
