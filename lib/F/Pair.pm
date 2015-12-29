# Copyright 2015, Mitchell Cooper
package F::Pair;

use warnings;
use strict;
use parent qw(F::Node);

sub type { 'Pair' }
sub desc {
    my $pair = shift;
    return "pair '$$pair{key}'";
}

sub key   { shift->{key} }
sub value { shift->first_child }

1
