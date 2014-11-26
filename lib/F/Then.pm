# Copyright 2014 Mitchell Cooper
package F::Then;

use warnings;
use strict;
use parent 'F::Statement';

sub parameter_expression { shift->{parameter_expression} }
sub type { 'If' }


1
