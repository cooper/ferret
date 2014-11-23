# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Structure::ListItem;

use warnings;
use strict;
use parent 'Ferret::Lexer::Expression';

sub type { 'ListItem'  }
sub desc { 'Item ' . shift->{item_num} }

1
