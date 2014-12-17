# Copyright (c) 2013, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';

sub property {
    my ($set, $prop_name) = @_;
    my $func = Ferret::Function->new($set->ferret,
        name => '_setConstructor_'
    );
    $func->{code} = sub {
        my @all = @{ $set->{all_objs} };
        return $set->{set_class}->property($prop_name)->call(
            [ @all ],
            $set->{set_scope}
        );
    };
    return $func;
}

sub set_property {
    # probably just raise an error.
    # or maybe use this for multiple assignment.
    # e.g. ($x, $y) = ($x + 1, $y + 1)
}

1
