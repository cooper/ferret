# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Document;

use warnings;
use strict;
use 5.010;
use parent 'Ferret::Lexer::Node';

sub type { 'Document' }
sub desc {
    my $doc = shift;
    return "Document '$$doc{name}'";
}

sub perl_fmt {
    my $doc = shift;
    my $content = '';
    $content = $_->perl_fmt_do."\n" foreach $doc->children;
    return Document => { content => $content };
}

1
