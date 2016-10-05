# Copyright 2015, Mitchell Cooper
package F::ListItem;

use warnings;
use strict;
use parent qw(F::NodeExpression);


sub desc   { 'item ' . shift->{item_num} }
sub detail { 'list '.shift->desc }

sub adopt {
    my ($item, $el) = @_;
    my $list = $item->parent;

    # first item --
    # if this is a collection, determine whether value list or hash.
    if ($list->children == 1 && !$list->first_child->children) {

        # if the element is a pair, it's a hash.
        # otherwise, it's an array.
        if ($el->type eq 'Pair' || $el->type eq 'NamedPair') {
            $list->{hash} = 1;
            delete $list->{array};
        }
    }

    # for all items, check whether they're acceptable.

    # hashes must contain ONLY pairs.
    if ($list->{hash} && $el->type !~ /Pair$/) {
        return $el->unexpected([
            'inside hash',
            'Hashes can only contain key-value pairs'
        ]);
    }

    # arrays CANNOT contain pairs.
    # more specifically, it can only contain expressions...
    # we'll get to that.
    if ($list->{array} && $el->type =~ /Pair$/) {
        return $el->unexpected([
            'inside list',
            'Value lists cannot contain key-value pairs'
        ]);
    }

    # hash was supposed to be empty.
    return $el->unexpected([
        'inside empty hash',
        'This hash list contains a colon (:), indicating it must be empty'
    ]) if $list->{must_be_empty};

    return $item->SUPER::adopt($el);
}

sub item { shift->first_child }

1
