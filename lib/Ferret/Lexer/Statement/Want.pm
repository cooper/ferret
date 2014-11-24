# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Statement::Want;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub type { 'Want' }

my %allowed = qw(LexicalVariable Bareword);
sub adopt {
    my ($want, $el) = @_;
    return $want->SUPER::adopt($el) if $allowed{ $el->type };
    return $want->unexpected($el, 'inside want');
    return $el;
}

1
