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
    return
    $list->{hash}  ? 'Hash'         :
    $list->{array} ? 'Value list'   :
    'Structural list';
}

sub is_array { shift->{array} }
sub is_hash  { shift->{hash}  }

sub new_item {
    my $list = shift;
    my $item = F::ListItem->new(item_num => $list->{item_c}++);
    return $list->adopt($item);
}

sub perl_fmt {
    my $list = shift;
    my @children = $list->children;

    # it's a hash.
    if ($list->is_hash) {

        # create the Perl hash pairs.
        my $pairs_str = join ', ', map {
            my $key = $_->first_child->key;
            my $val = $_->first_child->value->perl_fmt_do;
            "$key => $val"
        } @children;

        # curly brackets are in the format.
        return hash => { pairs => $pairs_str };

    }

    # it's an array.
    elsif ($list->is_array) {

        # brackets are in the format.
        my $items_str = join ', ', map $_->perl_fmt_do, @children;
        return list => { items => $items_str };

    }

    # it's a structural list.

    # it has more than one value. therefore it's a set.
    if (@children > 1) {
        my $first_child = shift @children;
        my $items_str   = join ', ', map $_->perl_fmt_do, @children;
        return set => {
            first_item  => $first_child->perl_fmt_do,
            other_items => $items_str
        };
    }

    # it's just one parenthesized value.
    return expression => { content => $children[0]->perl_fmt_do };

}

# filter out empty items.
sub close {
    my $list = shift;
    foreach my $item ($list->children) {
        next if $item->children;
        $list->abandon($item);
    }
    $list->SUPER::close;
}

1
