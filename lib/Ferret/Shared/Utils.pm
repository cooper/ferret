# Copyright (c) 2015, Mitchell Cooper
#
# This file contains utilities usable both by the
# Ferret compiler and the Ferret runtime implementation
#
package Ferret::Shared::Utils;

use warnings;
use strict;
use 5.010;

our $prop_reg = qr/[\p{Letter}_]+[\p{Number}\p{Letter}_]*/;
our $type_reg = qr/[\p{Letter}_]+[\p{Number}\p{Letter}_\:]*/;

sub import {
    my $this_package = shift;
    my $package = caller;
    no strict 'refs';
    *{ "${package}::$_" } = *{ "${this_package}::$_" } foreach @_;
}

# convert array or hash ref to list or empty list if not ref.
sub ref_to_list ($) {
    my $ref = shift;
    return defined $ref ? ($ref) : () if !ref $ref;
    if (ref $ref eq 'ARRAY') { return @$ref }
    if (ref $ref eq 'HASH')  { return %$ref }
    return ();
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

# remove leading and trailing whitespace from all lines
sub trim_lines {
    my $str = shift;
    return undef if !defined $str;
    return join "\n", map { trim($_) } split "\n", $str;
}

# trim lines and add a period at the end, if there isn't one already.
sub dot_trim {
    my $str = trim_lines(shift);
    return undef if !defined $str;
    $str .= '.' unless $str =~ m/\.$/;
    return ucfirst $str;
}

state $link_map = {

    ### NUMBERS

    'Num'               => '[Number](/std/doc/Number.md)',
    'Number'            => '[Number](/std/doc/Number.md)',

    # even numbers
    'Num::Even'         => '[Even number](/std/doc/Number.md)',
    'Number::Even'      => '[Even number](/std/doc/Number.md)',

    # odd numbers
    'Num::Odd'          => '[Odd number](/std/doc/Number.md)',
    'Number::Odd'       => '[Odd number](/std/doc/Number.md)',

    # integers
    'Int'               => '[Number (auto-integer)](/std/doc/Number.md)',
    'Num::Int'          => '[Number (auto-integer)](/std/doc/Number.md)',
    'Num::Integer'      => '[Number (auto-integer)](/std/doc/Number.md)',
    'Number::Integer'   => '[Number (auto-integer)](/std/doc/Number.md)',
    'Number::Int'       => '[Number (auto-integer)](/std/doc/Number.md)',

    ### STRINGS

    'Str'               => '[String](/std/doc/String.md)',
    'String'            => '[String](/std/doc/String.md)',

    # uppercase strings
    'Str::UC'           => '[String (auto-uppercase)](/std/doc/String.md)',
    'Str::Uppercase'    => '[String (auto-uppercase)](/std/doc/String.md)',
    'String::UC'        => '[String (auto-uppercase)](/std/doc/String.md)',
    'String::Uppercase' => '[String (auto-uppercase)](/std/doc/String.md)',

    # lowercase strings
    'Str::LC'           => '[String (auto-lowercase)](/std/doc/String.md)',
    'Str::Lowercase'    => '[String (auto-lowercase)](/std/doc/String.md)',
    'String::LC'        => '[String (auto-lowercase)](/std/doc/String.md)',
    'String::Lowercase' => '[String (auto-lowercase)](/std/doc/String.md)',

    # non-empty strings
    'Str::NE'           => '[Nonempty string](/std/doc/String.md)',
    'Str::NonEmpty'     => '[Nonempty string](/std/doc/String.md)',
    'String::NonEmpty'  => '[Nonempty string](/std/doc/String.md)',
    'String::NE'        => '[Nonempty string](/std/doc/String.md)',

    ### REGULAR EXPRESSIONS

    'Rgx'               => '[Regex](/std/doc/Regex.md)',
    'Regex'             => '[Regex](/std/doc/Regex.md)',

    ### SYMBOLS

    'Sym'               => '[Symbol](/std/doc/Symbol.md)',
    'Symbol'            => '[Symbol](/std/doc/Symbol.md)',

    ### BOOLEANS

    'Bool'              => '[Bool](/std/doc/Bool.md)',

    ### MATH

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

# ($arg_sig, $ret_sig)
sub detailed_signature_to_string {
    my $sig_str = signature_to_string(shift);
    my $ret_str = signature_to_string(shift);
    $ret_str =~ s/^\$result:(\w+)$/$1/;
    $sig_str .= ' ' if length $sig_str && length $ret_str;
    $sig_str .= '-> '.$ret_str if length $ret_str;
    return $sig_str;
}

1
