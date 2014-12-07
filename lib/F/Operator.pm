# Copyright (c) 2014 Mitchell Cooper
package F::Operator;

use warnings;
use strict;
use 5.010;
use parent qw(F::Structure);

sub type { 'Operator' }
sub desc {
    my $op = shift;
    return ucfirst Ferret::Lexer::pretty_token($op->{token});
}

sub op_type {
    my $tok = shift->{token};
    return lc substr $tok, 3;
}

1
