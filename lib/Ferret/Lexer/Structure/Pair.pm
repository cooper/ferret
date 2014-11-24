# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Structure::Pair;

use warnings;
use strict;
use parent qw(Ferret::Lexer::Structure Ferret::Lexer::Expression);

sub type { 'Pair' }
sub desc {
    my $pair = shift;
    return "Pair '$$pair{key}'";
}

sub key   { shift->{key} }
sub value { (shift->children)[0] }

1
