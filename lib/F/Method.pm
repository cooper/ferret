# Copyright 2014 Mitchell Cooper
package F::Method;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Method' }
sub desc { 'M'.($_[0]{main} ? 'ain m' : '')."ethod '$_[0]{name}'" }
sub is_closure { 1 }

1
