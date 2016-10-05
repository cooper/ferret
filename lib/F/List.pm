# Copyright 2015, Mitchell Cooper
package F::List;

use warnings;
use strict;
use parent qw(F::NodeExpression);



sub desc {
    my $list = shift;
    return sprintf '%s [%d items]', $list->list_type, scalar $list->children;
}

sub list_type {
    my $list = shift;
    if ($list->is_collection && !$list->is_callidx) {
        return 'hash'               if $list->is_hash;
        return 'value list'         if $list->is_array;
    }
    return 'property index'         if $list->is_property;
    return 'named argument list'    if $list->is_call && $list->is_hash;
    return 'mixed argument list'    if $list->is_call && $list->is_mixed;
    return 'argument list'          if $list->is_call;
    return 'index list'             if $list->is_index;
    return 'object'                 if $list->is_hash;
    return 'set'                    if $list->children > 1;
    return 'single value'           if $list->children;
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
sub is_mixed      { shift->{mixed}      }
sub is_collection { shift->{collection} }
sub is_property   { shift->{property}   }

sub is_callidx { shift->{is_callidx} }
sub is_call    { $_[0]->is_callidx && !$_[0]->{is_index} }
sub is_index   { $_[0]->is_callidx &&  $_[0]->{is_index} }

sub new_item {
    my $list = shift;
    my $item = F::new('ListItem',
        item_num => $list->{item_c}++
    );
    return $list->adopt($item);
}

sub perl_fmt {
    my $list = shift;
    my @children = $list->children;

    my $get_pairs = sub {
        join ', ', map {
            my $key;
            my $child = $_->first_child;
            if ($child->type eq 'NamedPair') {
                $key = $child->key_name;
                $key = "'$key'" if $key =~ m/^\d/;
            }
            elsif ($child->type eq 'Pair') {
                $key = $child->key->perl_fmt_do;
            }
            my $val = $child->value->perl_fmt_do;
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
    my $type = '';
    foreach my $item ($list->children) {
        my $child = $item->first_child;
        if (!$child) {
            $list->abandon($item);
            next;
        }

        # check for type inconsistencies.
        my $this_type = $child->type eq 'Pair' || $child->type eq 'NamedPair'
            ? 'pairs' : 'items';
        $type ||= $this_type;

        next if $this_type eq $type;

        # mismatching types -- pairs and items.
        if ($list->is_call) {
            delete $list->{hash};
            delete $list->{array};
            $list->{mixed}++;
            next;
        }

        # not OK for non-calls.
        my $detail = $list->detail;
        return $child->unexpected([
            "inside $detail",
            'Cannot mix pairs and non-pairs in a list unless it is the '.
            'argument list for a call'
        ]);

    }

    # if the parent is a property, it's not a collection.
    if ($list->parent->type eq 'Property') {
        delete @$list{ qw(collection hash array) };
        $list->{property} = 1;
    }

    $list->SUPER::close(@_);
}

1
