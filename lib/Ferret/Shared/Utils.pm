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

###############
### STRINGS ###
###############

# remove leading and trailing whitespace, including newlines.
sub trim {
    my $str = shift;
    return undef if !defined $str;
    $str =~ s/^\s+|\s+$//g;
    return $str;
}

# trim and add a period at the end, if there isn't one already.
sub dot_trim {
    my $str = trim(shift);
    return undef if !defined $str;
    $str .= '.' unless $str =~ m/\.$/;
    return $str;
}

state $link_map = {

    # numbers
    'Num'               => '[Number](/std/doc/Number.md)',
    'Number'            => '[Number](/std/doc/Number.md)',
    'Num::Even'         => '[Even number](/std/doc/Number.md)',
    'Number::Even'      => '[Even number](/std/doc/Number.md)',
    'Num::Odd'          => '[Odd number](/std/doc/Number.md)',
    'Number::Odd'       => '[Odd number](/std/doc/Number.md)',
    'Num::Integer'      => '[Number (auto-integer)](/std/doc/Number.md)',
    'Number::Integer'   => '[Number (auto-integer)](/std/doc/Number.md)',

    # strings
    'Str'               => '[String](/std/doc/String.md)',
    'String'            => '[String](/std/doc/String.md)',
    'Str::UC'           => '[String (auto-uppercase)](/std/doc/String.md)',
    'String::UC'        => '[String (auto-uppercase)](/std/doc/String.md)',
    'Str::LC'           => '[String (auto-lowercase)](/std/doc/String.md)',
    'String::LC'        => '[String (auto-lowercase)](/std/doc/String.md)',
    'Str::NonEmpty'     => '[Nonempty string](/std/doc/String.md)',
    'String::NonEmpty'  => '[Nonempty string](/std/doc/String.md)',

    # regular expressions
    'Rgx'               => '[Regex](/std/doc/Regex.md)',
    'Regex'             => '[Regex](/std/doc/Regex.md)',

    # symbols
    'Sym'               => '[Symbol](/std/doc/Symbol.md)',
    'Symbol'            => '[Symbol](/std/doc/Symbol.md)',

    # other
    'Bool'              => '[Bool](/std/doc/Bool.md)',

    # Math
    'Math::Point'       => '[Math::Point](/std/doc/Math/Point.md)',
    'Math::Line'        => '[Math::Point](/std/doc/Math/Line.md)',
    'Math::Rect'        => '[Math::Rect](/std/doc/Math/Rect.md)'

};

# link for a built-in type.
sub type_link {
    my $type_name = shift;
    return $link_map->{$type_name} || $type_name;
}

# regex string.
sub regex_str {
    my ($rgx, $mods) = @_;
    $rgx  //= '';
    $mods //= '';
    return  "(?$mods:$rgx)";
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
    my ($signature, $pretty) = @_;
    my @parts;
    my $col = $pretty ? ': ' : ':';
    my $sep = $pretty ? ', ' : ' ';
    foreach my $sig (@$signature) {
        my $type;
        if ($sig->{type}) {
            $type = $sig->{type};
            $type = join '|', @$type if ref $type eq 'ARRAY';
        }
        my $s =
            ($sig->{optional} ? '?'               : '') . '$' . $sig->{name} .
            ($type            ? $col.$type        : '') .
            ($sig->{more}     ? '...'             : '');
        push @parts, $s;
    }
    return join $sep, @parts;
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

# grep only needs, no wants.
sub signature_need_only {
    my $signature = shift;
    my @final;
    foreach my $sig (@$signature) {
        next if $sig->{optional};
        push @final, $sig;
    }
    return \@final;
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
