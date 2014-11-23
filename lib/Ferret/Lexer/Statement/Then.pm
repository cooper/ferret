# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Statement::Then;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub parameter_expression { shift->{parameter_expression} }
sub type { 'If' }


1
