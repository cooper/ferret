package F::Load;

use warnings;
use strict;
use parent 'F::Node';

sub perl_fmt {
    my $load = shift;
    my $what = $load->first_child->{bareword_value};
    return load => {
        pos  => $load->{create_pos},
        name => $what
    };
}

1
