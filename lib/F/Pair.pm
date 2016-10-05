# Copyright 2016, Mitchell Cooper
package F::Pair;

use warnings;
use strict;
use parent qw(F::Node);

sub key     { (shift->children)[0] }
sub value   { (shift->children)[1] }

1
