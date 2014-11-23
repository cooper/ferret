# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Statement::Function;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub type { 'Function' }
sub desc { "Function '$_[0]{name}'" }
sub is_closure { 1 }

sub perl_fmt {
    my $func = shift;
    my $content = '';
    $content .= $_->perl_fmt_do."\n" foreach $func->children;
    return function => {
        name       => $func->{name},
        statements => $content
    };
}

1
