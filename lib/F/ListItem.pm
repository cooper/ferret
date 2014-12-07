# Copyright 2014 Mitchell Cooper
package F::ListItem;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'ListItem'  }
sub desc { 'Item ' . shift->{item_num} }

sub adopt {
    my ($item, $el) = @_;
    my $list = $item->parent;

    # first item --
    # if this is a collection, determine whether value list or hash.
    if ($list->children == 1 && $list->{collection}) {

        # if the element is a pair, it's a hash.
        # otherwise, it's an array.
        # also, if this is a colon (OP_VALUE), it's an empty hash.
        my $is_empty = $el->type_or_tok eq 'OP_VALUE';
        if ($el->type eq 'Pair' || $is_empty) {
            $list->{hash} = 1;
            delete $list->{array};

            # if it's empty, remember this, and don't adopt the operator.
            if ($is_empty) {
                $list->{must_be_empty} = 1;
                return $el;
            }

        }
    }

    # for all items, check whether they're acceptable.

    # hashes must contain ONLY pairs.
    if ($list->{hash} && $el->type ne 'Pair') {
        die "hashes can only contain key-value pairs\n";
    }

    # arrays CANNOT contain pairs.
    # more specifically, it can only contain expressions...
    # we'll get to that.
    if ($list->{array} && $el->type eq 'Pair') {
        die "arrays cannot contain key-value pairs\n";
    }

    die "list not expected to have any elements\n" if $list->{must_be_empty};
    return $item->SUPER::adopt($el);
}

1
