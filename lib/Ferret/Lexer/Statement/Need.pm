# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Statement::Need;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub type { 'Need' }

my %allowed = qw(LexicalVariable Bareword);
sub adopt {
    my ($need, $el) = @_;
    return $need->SUPER::adopt($el) if $allowed{ $el->type };
    return $need->unexpected($el, 'inside need');
    return $el;
}

sub variables {
    grep { $_->type eq 'LexicalVariable' } shift->children;
}

sub perl_fmt {
    my @fmt;
    foreach my $var (shift->variables) {
        push @fmt, 'need', { var_name => $var->{var_name} };
    }
    return @fmt;
}

1
