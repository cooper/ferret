# Copyright 2015, Mitchell Cooper
package F::ReturnPair;

use warnings;
use strict;
use parent qw(F::Node);


sub desc {
    my $pair = shift;
    return "return pair '$$pair{key}'";
}

sub key   { shift->{key} }          # a Perl string
sub value { shift->first_child }  # an element

sub type_string {
    my $bw = (shift->children)[1] or return undef;
    return $bw->{bareword_value};
}

sub perl_fmt {
    my $pair = shift;
    return return_pair => {
        pos   => $pair->{create_pos},
        key   => $pair->key,
        value => $pair->value->perl_fmt_do
    };
}

1
