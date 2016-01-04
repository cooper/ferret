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
    my ($left, $name);

    # TODO: delete $hash["x"] and delete $list[0]

    if ($c->type eq 'Property') {
        $left = $c->first_child->perl_fmt_do;
        $name = $c->prop_name;
    }
    elsif ($c->type eq 'InstanceVariable') {
        $left = '$self';
        $name = $c->{var_name};
    }
    elsif ($c->type eq 'LexicalVariable') {
        $left = '$scope';
        $name = $c->{var_name};
    }

    return "mod_$$mod{mod_type}" => {
        pos  => $mod->{create_pos},
        left => $left,
        name => $name
    };
}

1
