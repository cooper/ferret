# Copyright 2014 Mitchell Cooper
package F::ReturnPair;

use warnings;
use strict;
use parent qw(F::Structure F::Expression);

sub type { 'ReturnPair' }
sub desc {
    my $pair = shift;
    return "Return pair '$$pair{key}'";
}

sub key   { shift->{key} }          # a Perl string
sub value { (shift->children)[0] }  # an element

sub perl_fmt {
    my $pair = shift;
    return return_pair => {
        key   => $pair->key,
        value => $pair->value->perl_fmt_do
    };
}

1
