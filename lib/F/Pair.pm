# Copyright 2014 Mitchell Cooper
package F::Pair;

use warnings;
use strict;
use parent qw(F::Structure F::Expression);

sub type { 'Pair' }
sub desc {
    my $pair = shift;
    return "Pair '$$pair{key}'";
}

sub key   { shift->{key} }
sub value { (shift->children)[0] }

1
