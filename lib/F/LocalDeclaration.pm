# Copyright 2015, Mitchell Cooper
package F::LocalDeclaration;

use warnings;
use strict;
use parent qw(F::Statement);

sub type { 'LocalDeclaration' }
sub desc { 'local variable declaration' }

sub variable {
    my $child = shift->first_child;
    return $child->assign_to if $child->type eq 'Assignment';
    return $child;
}

sub perl_fmt {
    my $local = shift;
    my $child = $local->first_child;
    my $var   = $local->variable;

    # use assign_local_var.
    # this uses ->set_property instead of ->set_property_ow.

    # if it's not an assignment, assign to undefined.
    my $assign_value =
        $child->type eq 'Assignment'      ?
        $child->assign_value->perl_fmt_do :
        'Ferret::undefined';

    return assign_local => {
        name         => $var->{var_name},
        assign_value => $assign_value
    };
}

1
