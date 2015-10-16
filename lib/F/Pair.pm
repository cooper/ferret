# Copyright 2014 Mitchell Cooper
package F::Pair;

use warnings;
use strict;
use parent qw(F::Node F::Expression);

sub type { 'Pair' }
sub desc {
    my $pair = shift;
    return "pair '$$pair{key}'";
}

sub key   { shift->{key} }
sub value { shift->first_child }

1
