# Copyright 2016, Mitchell Cooper
package F::NamedPair;

use warnings;
use strict;
use parent qw(F::Node);

sub desc {
    my $pair = shift;
    return "pair '$$pair{key}'";
}

sub key_name { shift->{key} }
sub value    { shift->first_child }

1
