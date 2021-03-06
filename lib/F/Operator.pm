# Copyright (c) 2015, Mitchell Cooper
package F::Operator;

use warnings;
use strict;
use 5.010;
use parent qw(F::Element);


sub desc {
    my $op = shift;
    return F::pretty_token($op->{token});
}

sub op_type {
    my $tok = shift->{token};
    return lc substr $tok, 3;
}

1
