# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Document;

use warnings;
use strict;
use 5.010;
use parent 'Ferret::Lexer::Node';

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        function_defs => [],
        %opts
    );
}

sub type { 'Document' }
sub desc {
    my $doc = shift;
    return "Document '$$doc{name}'";
}

sub perl_fmt {
    my $doc = shift;
    my ($before_c, $after_c, $middle_c) = ('') x 3;
    my ($before, $after) = $doc->separate_children;

    $middle_c .= $_->perl_fmt_do."\n" foreach @$before;
    $after_c  .= $_->perl_fmt_do."\n" foreach @$after;

    # add each function definitions.
    $before_c .= "$_\n" foreach map {
        $doc->get_format(function_def => $_)
    } @{ $doc->{function_defs} };

    return document => {
        upper_content  => $before_c,    # function declarations
        middle_content => $middle_c,    # functions
        lower_content  => $after_c      # all other children
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
