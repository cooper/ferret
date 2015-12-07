# Copyright (c) 2015, Mitchell Cooper
#
# This file contains utilities usable both by the
# Ferret compiler and the Ferret runtime implementation
#
package Ferret::Shared::Utils;

use warnings;
use strict;
use 5.010;

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{ "${package}::$_" } = *{ "${this_package}::$_" } foreach @_;
}

sub ns_to_slash {
    my $c = shift;
    $c =~ s/::/\//g;
    return $c;
}

sub slash_to_ns {
    my $s = shift;
    $s =~ s/\//::/g;
    return $s;
}

# find something in @INC. the earliest result is returned.
# e.g. $file = "Math.frt.pm"
sub find_in_inc {
    my ($file, @dirs) = @_;
    my @inc = (@dirs, @$Ferret::ferret_libs);
    foreach my $dir (@inc) {
        my $path = "$dir/$file";
        return $path if -e $path;
    }
    return;
}

1
