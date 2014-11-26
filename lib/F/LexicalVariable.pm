# Copyright 2014 Mitchell Cooper
package F::LexicalVariable;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'LexicalVariable' }

sub desc {
    my $var = shift;
    return "Lexical variable '\$$$var{var_name}'";
}

sub perl_fmt {
    lexical_var => { name => shift->{var_name} };
}

1
