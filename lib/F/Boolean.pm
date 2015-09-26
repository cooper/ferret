# Copyright 2015 Mitchell Cooper
package F::Boolean;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'Boolean' }
sub desc {
    my $b = shift;
    return "boolean ".($b->{value} ? 'true' : 'false');
}

sub perl_fmt_do {
    return shift->{value} ? 'Ferret::true' : 'Ferret::false';
}

1
