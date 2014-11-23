# Copyright (c) 2014 Mitchell Cooper
package Ferret::Perl;

use warnings;
use strict;
use 5.010;

sub main {
    my $doc = shift;
    my $doc_perl = $doc->perl_fmt_do;
    return get_format(main => { content => $doc_perl });
}

sub get_format {
    my ($name, $info) = @_;

    # no format.
    return '' if not defined $name;
    $name = lc $name;

    # slurp the file.
    local $/ = undef;
    open my $fh, '<', "lib/Ferret/Perl/Format/$name.fmt"
        or die "can't open Perl format $name: $!\n";
    my $format = <$fh>;

    # replace variables, trim.
    $format =~ s/<<(\w+)>>/$$info{$1}/g;
    $format =~ s/^\s+|\s+$//g;

    # remove excess parentheses.
    # I don't know yet if this is a bad idea.
    $format =~ s/\(\((.+)\)\)/\($1\)/gs;

    return $format;
}

1
