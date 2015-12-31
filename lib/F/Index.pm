# Copyright 2015, Mitchell Cooper
package F::Index;

use warnings;
use strict;
use parent qw(F::NodeExpression F::Assignable);


sub fake { 1 }

sub perl_fmt {
    my $index = shift;
    my $col = $index->collection;

    # determine list items.
    my $arg_string = join ', ',
        grep length,
        map $_->perl_fmt_do,
        $index->list_args;

    return index => {
        collection => $col->perl_fmt_do,
        arguments  => $arg_string
    };
}

sub collection { shift->first_child }
sub list_args  { my $l = (shift->children)[1]; $l ? $l->ordered_children : () }

1
