# Copyright (c) 2014 Mitchell Cooper
package Ferret::Perl;

use warnings;
use strict;
use 5.010;

use File::Basename 'basename';

sub main {
    my ($doc, $mini) = @_;
    my $doc_perl = $doc->perl_fmt_do;

    # mini means just the content of the document.
    if ($mini) {
        my $doc_data = $doc->perl_fmt;
        return $doc_data->{all_content};
    }

    return get_format(main => {
        content   => $doc_perl,
        file_name => $doc->{name},
        base_name => basename($doc->{name})
    });
}

sub get_format {
    my ($name, $info) = @_;

    # no format.
    return '' if not defined $name;
    $name = lc $name;

    open my $fh, '<', "$Ferret::ferret_root/lib/Ferret/Perl/Format/$name.fmt"
        or die "can't open Perl format $name: $!\n";

    # read line-by-line to preserve indentation.
    my @lines;
    while (my $line = <$fh>) {
        chomp $line;
        my ($indent) = ($line =~ m/^(\s*).*$/);
        my $add_indent = sub {
            defined(my $key = $info->{+shift}) or return;
            my @lines = split "\n", $key;
            return join "\n$indent", @lines;
        };
        $line =~ s/<<\s*(\w+)\s*>>/@{[ $add_indent->($1) ]}/g;
        push @lines, $line;
    }

    # join, trim.
    my $format = join "\n", @lines;
    $format =~ s/^\s+|\s+$//g;

    return $format;
}

1
