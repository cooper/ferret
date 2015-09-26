# Copyright (c) 2013, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';

*new = *Ferret::bind_constructor;

Ferret::bind_class(
    name => 'Set'
);

sub property {
    my ($set, $prop_name) = @_;
    my $func = Ferret::Function->new($set->f, name => 'setMethod');
    $func->{code} = sub {
        # consider: perhaps it should pass additional arguments to function.
        my $set_class = $set->{set_class} or return;
        return $set_class->property($prop_name)->call(
            [ @{ $set->{all_objs} } ], # make a copy
            $set->{set_scope} # scope where set was created. good enough.
        );
    };
    return $func;
}

sub set_property {
    # probably just raise an error.
    # or maybe use this for multiple assignment.
    # e.g. ($x, $y) = ($x + 1, $y + 1)
}

sub to_list {

}

1
