# Copyright (c) 2015, Mitchell Cooper
package F::WantNeedValue;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'F::Node';

sub desc { 'argument value' }

sub perl_fmt_do { shift->first_child->perl_fmt_do }

1
