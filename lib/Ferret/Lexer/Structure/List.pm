# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Structure::List;

use warnings;
use strict;
use parent qw(Ferret::Lexer::Structure Ferret::Lexer::Expression);

sub type { 'List' }
sub desc {
    my $list = shift;
    my $count = scalar $list->children;
    return "List [$count items]";
}

sub new_item {
    my $list = shift;
    my $item = Ferret::Lexer::Structure::ListItem->new(item_num => $list->{item_c}++);
    return $list->adopt($item);
}

1
