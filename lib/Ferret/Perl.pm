# Copyright (c) 2015, Mitchell Cooper
package Ferret::Perl;

use warnings;
use strict;
use 5.010;

use File::Basename 'basename';

sub main {
    my ($doc, $mini) = @_;

    # mini means just the content of the document.
    if ($mini) {
        my $doc_data = $doc->perl_fmt;
        return $doc_data->{all_content};
    }

    my $doc_perl = $doc->perl_fmt_do;
    return F::get_format('Perl', main => {
        content   => $doc_perl,
        file_name => $doc->{name},
        base_name => basename($doc->{name})
    });
}

sub F::Element::perl_fmt { }

sub F::Element::perl_fmt_do {
    my @args = shift->perl_fmt;
    my @fmts;
    while (my @a = splice @args, 0, 2) {
        push @fmts, F::get_format('Perl', @a);
    }
    return join ";\n", @fmts;
}

sub F::get_perl_fmt { F::get_format('Perl', @_) }

1
