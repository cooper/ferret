# Copyright 2015, Mitchell Cooper
package F::SharedDeclaration;

use warnings;
use strict;
use parent qw(F::Statement);

sub type { 'SharedDeclaration' }
sub desc { 'shared variable declaration' }

sub variable {
    my $child = shift->first_child;
    return $child->assign_to if $child->type eq 'Assignment';
    return $child;
}

sub perl_fmt {
    my $local = shift;
    my $child = $local->first_child;
    my $var   = $local->variable;

    # if it's not an assignment, do nothing.
    # the purpose of non-assignment shared declaration is
    # for variable tracking only.
    $child->type eq 'Assignment' or return;

    return assign_lexical_var => {
        name         => $var->{var_name},
        assign_value => $child->assign_value->perl_fmt_do
    };
}

1
