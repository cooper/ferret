# Copyright (c) 2015, Mitchell Cooper
package Ferret::Markdown;

use warnings;
use strict;
use 5.010;

use File::Basename 'basename';
use Ferret::Shared::Utils qw(trim);

sub main {
    my ($doc) = @_;

    my $doc_markdown = $doc->markdown_fmt_do;
    return trim(F::get_format('Markdown', main => {
        content   => $doc_markdown,
        file_name => $doc->{name},
        base_name => basename($doc->{name})
    }));
}

sub F::Element::markdown_fmt { }

sub F::Element::markdown_fmt_do {
    my @args = shift->markdown_fmt;
    my @fmts;
    while (my @a = splice @args, 0, 2) {
        push @fmts, F::get_format('Markdown', @a);
    }
    return join ";\n", @fmts;
}

sub F::Element::get_markdown_heading {
    my ($el, $head) = @_;

    # no heading provided.
    return if !length $head;

    # find the next level up.
    if (!$el->{markdown_heading_level}) {
        my $p = $el;
        while ($p = $p->parent) {
            if (my $parent_level = $p->{markdown_heading_level}) {
                my $level = $el->{markdown_heading_level} = $parent_level + 1;
                last;
            }
        }
    }

    my $level = $el->{markdown_heading_level} ||= 1;
    return "\n".("#" x $level)." $head";
}

sub F::get_markdown_fmt { F::get_format('Markdown', @_) }

1
