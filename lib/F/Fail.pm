package F::Fail;

use warnings;
use strict;
use parent 'F::Node';

sub perl_fmt {
    return fail => {
        expression => shift->first_child->perl_fmt_do
    };
}

1
