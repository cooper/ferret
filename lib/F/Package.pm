# Copyright 2014 Mitchell Cooper
package F::Package;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Package' }
sub hold_instr { 1 }

sub desc {
    my $pkg = shift;
    my $desc  = "package '$$pkg{pkg_name}'";
    return $desc;
}

sub perl_fmt {
    my $pkg = shift;
    $pkg->document->{package} = $pkg->{pkg_name};
    return;
}

1
