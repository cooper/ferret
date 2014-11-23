# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Structure::Instruction;

use warnings;
use strict;
use parent qw(Ferret::Lexer::Structure Ferret::Lexer::Statement);

sub type { 'Instruction' }

sub perl_fmt_do {
    return join('', map $_->perl_fmt_do, shift->children).';';
}

1
