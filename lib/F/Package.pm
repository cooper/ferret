# Copyright 2015, Mitchell Cooper
package F::Package;

use warnings;
use strict;
use parent 'F::Node';

sub hold_instr { 1 }

sub after_adopt {
    my $pkg = shift;
    $pkg->document->{package} = $pkg->{pkg_name};
}

sub desc {
    my $pkg = shift;
    my $desc  = "package '$$pkg{pkg_name}'";
    return $desc;
}

1
