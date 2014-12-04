# Copyright 2014 Mitchell Cooper
package F::List;

use warnings;
use strict;
use parent qw(F::Structure F::Expression);

sub type { 'List' }
sub desc {
    my $list = shift;
    my $count = scalar $list->children;
    return "List [$count items]";
}

sub new_item {
    my $list = shift;
    my $item = F::ListItem->new(item_num => $list->{item_c}++);
    return $list->adopt($item);
}

sub perl_fmt_do {
    my @children = shift->children;
    die "can't capture the value of a multi-item list\n" if @children > 1;
    return '('.join('', map $_->perl_fmt_do, @children).')';
}

1
