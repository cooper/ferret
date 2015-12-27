# Copyright 2015, Mitchell Cooper
package F::SetTypeVariable;

use warnings;
use strict;
use parent qw(F::Expression);

sub type { 'SetTypeVariable' }

sub desc {
    my $var = shift;
    return "set type variable '<$$var{var_name}>'";
}

sub perl_fmt {
    set_type_var => { name => shift->{var_name} };
}

1
