# Copyright 2015, Mitchell Cooper
package F::PropertyModifier;

use warnings;
use strict;
use parent qw(F::Node);


sub desc {
    my $mod = shift;
    return "$$mod{mod_type} modifier";
}

sub perl_fmt {
    my $mod = shift;
    my $c = $mod->first_child;
    my ($func, $for, $left, $name, $name_code) = 'property_ow';

    # property owners provide the required info
    if ($c->is_type('PropertyOwner')) {
        $left      = $c->property_owner_code;
        $name      = $c->property_name;
        $name_code = $c->property_name_code;
    }

    # indices are handled manually
    elsif ($c->type eq 'Index') {
        $left = $c->collection->perl_fmt_do;
        $func = 'index';

        # if there's only one item, just use it for the name code
        my @items = $c->list_args;
        if (@items == 1) {
            $name_code = $items[0]->perl_fmt_do;
        }

        # if there's more than one, add a foreach
        else {
            $name_code = '$_';
            $for = ' for ('.join(', ', map $_->perl_fmt_do, $c->list_args).')';
        }

    }

    my $assign_code = $c->perl_fmt_do if $c->type eq 'Assignment';

    return "mod_$$mod{mod_type}" => {
        assign_code => length $assign_code ? "$assign_code;" : '',
        pos  => $mod->{create_pos},
        left => $left,
        name => $name_code || "'$name'",
        func => $func,
        for  => $for
    };
}

1
