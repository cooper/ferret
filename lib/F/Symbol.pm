# Copyright 2015, Mitchell Cooper
package F::Symbol;

use warnings;
use strict;
use parent 'F::Expression';


sub desc {
    my $sym = shift;
    return 'symbol :'.$sym->{sym_value};
}

sub perl_fmt {
    my $name = shift->{sym_value};
    return symbol => { name => $name };
}

1
