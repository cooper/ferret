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
our $type_reg = qr/[A-Za-z_]+[A-Za-z0-9_\:]*/;

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

    while ($string =~ s/^(\?)?\$($prop_reg|\d+)+(?:\:($type_reg))?(\.\.\.)?\s*//) {
        my $arg = { name => $2 };
        $arg->{optional} = 1  if $1;
        $arg->{type}     = $3 if $3;
        $arg->{more}     = 1  if $4;
        push @parts, $arg;
    }

    return \@parts;
}

# check if an argument signature fits into a function signature.
#
# FIXME: how to handle 'need' value requirements
#
#   arg_sig                         func_sig                            match
#   ------------------------------  --------------------------------  --------
#   '$1:Str $2:Str'                 '$firstName:Str $lastName:Str'      YES
#   '$1:Str $2:Str'                 '$lastName:Str $firstName:Str'      YES
#   '$firstName:Str $age:Num'       '$age:Num $firstName:Str'           YES
#   '$firstName:Str $age:Num'       '$age:Num'                          YES
#   '$firstName:Str $age:Num'       '$1:Str $2:Num'                     YES
#   '$age:Num $firstName:Str'       '$1:Str $2:Num'                     NO
#   '$age:Num $firstName:Str'       '$age:Str $firstName:Str'           NO
#   '$age:Num $firstName:Str'       '?$age:Str $firstName:Str'          YES
#
sub signatures_compatible {
    my ($arg_sig, $func_sig) = @_;
    $arg_sig  = string_to_signature($arg_sig)  if !ref $arg_sig;
    $func_sig = string_to_signature($func_sig) if !ref $func_sig;

    # map variables to their argument elements.
    my ($i, $j);
    my %arg_vars  = map { ++$i => $_, $_->{name} => $_ } @$arg_sig;
    my %func_vars = map { ++$j => $_, $_->{name} => $_ } @$func_sig;

    $i = 0;
    foreach my $arg (@$func_sig) { $i++;
        next if $arg->{optional};

        # find counterpart argument.
        my $carg = $arg_vars{ $arg->{name} } || $arg_vars{$i}; # || $args{'*more'}
        return if !$carg; # no counterpart for required variable.

        # now, check the type.
        return if $arg->{type} ne $carg->{type};

        # TODO: handle ellipsis *more
    }

    return 1;
}

1
