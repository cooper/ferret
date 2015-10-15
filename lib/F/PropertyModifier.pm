# Copyright 2015, Mitchell Cooper
package F::PropertyModifier;

use warnings;
use strict;
use parent qw(F::Node);

sub type { 'PropertyModifier' }
sub desc {
    my $mod = shift;
    return "$$mod{mod_type} modifier"
}

sub perl_fmt {

}

1
