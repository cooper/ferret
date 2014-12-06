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
        $list->{ $el->type eq 'Pair' ? 'hash' : 'array' } = 1;

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

    return $item->SUPER::adopt($el);
}

1
