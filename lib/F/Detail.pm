# Copyright 2016, Mitchell Cooper
package F::Detail;

use warnings;
use strict;
use parent qw(F::NodeExpression);

sub call { shift->first_child }

sub perl_fmt {
    my $det = shift;
    return $det->call->perl_fmt;
}

1
