# Copyright 2015, Mitchell Cooper
package F::Return;

use warnings;
use strict;
use parent qw(F::Node);


sub value { shift->first_child }

sub perl_fmt {
    my $ret = shift;
    my $value = $ret->value ? $ret->value->perl_fmt_do : '';
    return return => { value => $value };
}

1
