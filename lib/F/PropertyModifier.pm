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
    my ($func, $for, $left, $name, $name_code, $eval) = 'property_ow';

    # delete $x.property
    if ($c->type eq 'Property') {
        $left = $c->first_child->perl_fmt_do;
        if ($c->{is_index}) {
            $name_code = $c->index_fmt;
            $eval = '_eval';
        }
    }

    # delete $x[0]
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

    $left = $c->property_code if !length $left;
    $name = $c->property_name if !length $name && !length $name_code;

    return "mod_$$mod{mod_type}" => {
        eval => $eval,
        pos  => $mod->{create_pos},
        left => $left,
        name => $name_code || "'$name'",
        func => $func,
        for  => $for
    };
}

1
