# Copyright 2015, Mitchell Cooper
package F::LexicalVariable;

use warnings;
use strict;
use parent qw(F::Expression F::Assignable);

sub type { 'LexicalVariable' }

sub desc {
    my $var = shift;
    return "lexical variable '\$$$var{var_name}'";
}

sub perl_fmt {
    lexical_var => { name => shift->{var_name} };
}

1
