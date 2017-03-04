package F::Load;

use warnings;
use strict;
use parent 'F::Node';

sub perl_fmt {
    my $what = shift->first_child->{bareword_value};
    return load => { name => $what };
}

1
