# Copyright (c) 2014 Mitchell Cooper
package F::Addition;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node F::Statement);

sub type { 'Addition' }

sub perl_fmt {
    my $add = shift;
    $add->document->{required_operations}{add} = 1;
    return addition => {
        items => join ', ', map $_->perl_fmt_do, $add->children
    }
}

sub left_side  { (shift->children)[0] }
sub right_side { (shift->children)[1] }

1
