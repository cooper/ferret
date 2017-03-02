# Copyright 2015, Mitchell Cooper
package F::Symbol;

use warnings;
use strict;
use parent 'F::Expression';

use Ferret::Shared::Utils qw(dot_trim);

sub desc {
    my $sym = shift;
    return 'symbol :'.$sym->{sym_value};
}

sub perl_fmt {
    my $name = shift->{sym_value};
    return symbol => { name => $name };
}

sub markdown_fmt {
    my $sym = shift;
    return symbol => {
        name    => $sym->{sym_value},
        hyph    => length $sym->doc_comment ? ' - ' : '',
        comment => dot_trim($sym->doc_comment)
    };
}

1
