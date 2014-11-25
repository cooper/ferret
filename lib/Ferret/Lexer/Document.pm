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
    my ($before_c, $after_c) = ('', '');
    my ($before, $after) = $doc->separate_children;

    $before_c .= $_->perl_fmt_do."\n" foreach @$before;
    $after_c  .= $_->perl_fmt_do."\n" foreach @$after;

    return document => {
        upper_content => $before_c,
        lower_content => $after_c
    };
}

sub separate_children {
    my $doc = shift;
    my (@before, @after);
    foreach my $child ($doc->children) {
        if ($child->type eq 'Function') {
            push @before, $child;
            next;
        }
        push @after, $child;
    }
    return (\@before, \@after);
}

1
