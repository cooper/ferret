# Copyright 2014 Mitchell Cooper
package F::Package;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Package' }

sub desc {
    my $pkg = shift;
    my $desc  = "Package '$$pkg{name}'";
    return $desc;
}

sub perl_fmt {
    my $pkg = shift;
    $pkg->document->{package} = $pkg->{name};
    return;
}

1
