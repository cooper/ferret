# Copyright 2015, Mitchell Cooper
package F::Closure;

use warnings;
use strict;
use parent 'F::Node';


sub is_closure { 1 }

# returns a list of children excluding the parameter expression.
# for instance, if $a { $b }
# this method would return only $b, not $a.
sub children_c {
    return grep { !defined $_->{parameter_for} } shift->children;
}

sub param_exp { }

1
