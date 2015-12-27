# Copyright 2015, Mitchell Cooper
package F::SpecialVariable;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'SpecialVariable' }

sub desc {
    my $var = shift;
    return "special variable '*$$var{var_name}'";
}

sub perl_fmt {
    special_var => { name => shift->{var_name} };
}

1
