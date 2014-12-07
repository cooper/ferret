# Copyright 2014 Mitchell Cooper
package F::Return;

use warnings;
use strict;
use parent qw(F::Structure);

sub type  { 'Return' }
sub value { shift->first_child }

sub perl_fmt {
    my $ret = shift;
    return return => { value => $ret->value->perl_fmt_do };
}

1
