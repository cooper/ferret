# Copyright 2014 Mitchell Cooper
package F::ListItem;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'ListItem'  }
sub desc { 'Item ' . shift->{item_num} }

1
