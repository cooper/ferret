# Copyright 2015, Mitchell Cooper
package F::Stop;

use warnings;
use strict;
use parent qw(F::Element);

sub perl_fmt_do {
    return '$ret->stop';
}

1
