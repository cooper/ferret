# Copyright 2015, Mitchell Cooper
package F::LoopStatement;

use warnings;
use strict;
use parent qw(F::Element);

sub desc {
    shift->{loop_stmt_name};
}

sub perl_fmt_do {
    my $name = shift->{loop_stmt_name};
    return "return '$name'";
}

1
