package F::Take;

use warnings;
use strict;
use parent 'F::Node';

sub perl_fmt {
    my $exp = shift->first_child->perl_fmt_do;
    return take => {
        expression => $exp
    };
}

1
