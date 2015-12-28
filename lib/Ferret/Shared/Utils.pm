# Copyright (c) 2015, Mitchell Cooper
#
# This file contains utilities usable both by the
# Ferret compiler and the Ferret runtime implementation
#
package Ferret::Shared::Utils;

use warnings;
use strict;
use 5.010;

our $prop_reg = qr/[A-Za-z_]+[A-Za-z0-9_]*/;

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{ "${package}::$_" } = *{ "${this_package}::$_" } foreach @_;
}

#############################
### FILE NAME CONVERSIONS ###
#############################

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

sub build_name {
    my $s = shift;
    my @parts = split /\//, $s;
    my $base  = pop @parts;
    return join '/', @parts, 'build', $base;
}

###########################
### FUNCTION SIGNATURES ###
###########################
#
# signatures are array references.
#
# each element of the array is a hash reference representing one argument:
# {
#   name     => argument name, no sigil
#   optional => true for want, false for need
#   type     => type string
#   more     => true if has ellipsis
# }
#

sub signature_to_string {
    my $signature = shift;
    my @parts;
    foreach my $sig (@$signature) {
        my $s =
            ($sig->{optional} ? '?'              : '') . '$' . $sig->{name} .
            ($sig->{type}     ? ':'.$sig->{type} : '') .
            ($sig->{more}     ? '...'            : '');
        push @parts, $s;
    }
    return join ' ', @parts;
}

sub string_to_signature {
    my $string = shift;
    my @parts;

    # FIXME: currently will not match types with :: in them
    # this is ok for the time being because they are not yet supported

    while ($string =~ s/^(\?)?\$($prop_reg)+(?:\:($prop_reg))?(\.\.\.)?\s*//) {
        my $arg = { name => $2 };
        $arg->{optional} = 1  if $1;
        $arg->{type}     = $3 if $3;
        $arg->{more}     = 1  if $4;
        push @parts, $arg;
    }

    return \@parts;
}

1
