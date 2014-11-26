# Copyright (c) 2014 Mitchell Cooper
package F::Document;

use warnings;
use strict;
use 5.010;
use parent 'F::Node';

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
    my ($before_c, $after_c) = ('') x 2;
    $after_c .= $_->perl_fmt_do."\n" foreach $doc->ordered_children;

    # add each function definitions.
    $before_c .= "$_\n" foreach map {
        $doc->get_format(function_def => $_)
    } @{ $doc->{function_defs} };

    return document => {
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c      # all other children
    };
}

1
