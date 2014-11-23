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
    return '' if not defined $name;
    $name = lc $name;
    local $/ = undef;
    open my $fh, '<', "lib/Ferret/Perl/Format/$name.fmt" or die $!;
    my $format = <$fh>;
    $format =~ s/<<(\w+)>>/$$info{$1}/g;
    $format =~ s/^\s+|\s+$//g;
    return $format;
}

1
