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
    my ($left, $name, $name_code, $eval);

    # TODO: delete $hash["x"] and delete $list[0]

    if ($c->type eq 'Property') {
        $left = $c->first_child->perl_fmt_do;
        if ($c->{is_index}) {
            $name_code = $c->index_fmt;
            $eval = '_eval';
        }
        else {
            $name = $c->prop_name;
        }
    }
    elsif ($c->type eq 'InstanceVariable') {
        $left = '$self';
        $name = $c->{var_name};
    }
    elsif ($c->type eq 'ThisVariable') {
        $left = '$this';
        $name = $c->{var_name};
    }
    elsif ($c->type eq 'LexicalVariable') {
        $left = '$scope';
        $name = $c->{var_name};
    }

    return "mod_$$mod{mod_type}" => {
        eval => $eval,
        pos  => $mod->{create_pos},
        left => $left,
        name => $name_code || "'$name'"
    };
}

1
