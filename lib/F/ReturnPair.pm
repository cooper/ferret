# Copyright 2014 Mitchell Cooper
package F::ReturnPair;

use warnings;
use strict;
use parent qw(F::Statement);

sub type { 'ReturnPair' }
sub desc {
    my $pair = shift;
    return "return pair '$$pair{key}'";
}

sub key   { shift->{key} }          # a Perl string
sub value { shift->first_child }  # an element

sub perl_fmt {
    my $pair = shift;
    return return_pair => {
        line  => $pair->{create_line},
        key   => $pair->key,
        value => $pair->value->perl_fmt_do
    };
}

1
