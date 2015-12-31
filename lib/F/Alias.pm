package F::Alias;

use warnings;
use strict;
use parent 'F::Node';

sub perl_fmt_do { shift->first_child->perl_fmt_do }

1
