# Copyright 2015, Mitchell Cooper
package F::SharedDeclaration;

use warnings;
use strict;
use parent qw(F::Node);


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

    # if it's not an assignment, assign to undef if no value is already there.
    $child->type eq 'Assignment' or return share_lexical_var => {
        name => $var->{var_name},
        pos  => $var->{create_pos}
    };

    return $child->perl_fmt;
}

1
