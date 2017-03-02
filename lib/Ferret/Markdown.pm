# Copyright (c) 2015, Mitchell Cooper
package Ferret::Markdown;

use warnings;
use strict;
use utf8;
use 5.010;

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
