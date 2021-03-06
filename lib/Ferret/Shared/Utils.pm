# Copyright (c) 2015, Mitchell Cooper
#
# This file contains utilities usable both by the
# Ferret compiler and the Ferret runtime implementation
#
package Ferret::Shared::Utils;

use warnings;
use strict;
use 5.010;

use List::Util qw(first);

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
    my ($s, $subdir) = @_;
    my @parts = split /\//, $s;
    my $base  = pop @parts;
    return join '/', @parts, $subdir, $base;
}

sub file_for_space {
    my $space   = shift;
    my $name    = ns_to_slash($space);
    my $fp      = build_name($name, 'perl')  . '.pm';
    my $build   = build_name($name, 'build') . '.frt.pm';
    return $fp  if first { -e "$_/$fp" } @INC;
    return $build;
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

    'Num'               => '[Num](/doc/std/Number.md)',
    'Number'            => '[Num](/doc/std/Number.md)',
    'Complex'           => '[Complex](/doc/std/Complex.md)',

    # even numbers
    'Num::Even'         => '[Num::Even](/doc/std/Number.md)',
    'Number::Even'      => '[Num::Even](/doc/std/Number.md)',

    # odd numbers
    'Num::Odd'          => '[Num::Odd](/doc/std/Number.md)',
    'Number::Odd'       => '[Num::Odd](/doc/std/Number.md)',

    # integers
    'Int'               => '[Int](/doc/std/Number.md)',
    'Num::Int'          => '[Int](/doc/std/Number.md)',
    'Num::Integer'      => '[Int](/doc/std/Number.md)',
    'Number::Integer'   => '[Int](/doc/std/Number.md)',
    'Number::Int'       => '[Int](/doc/std/Number.md)',

    ### STRINGS

    'Str'               => '[Str](/doc/std/String.md)',
    'String'            => '[Str](/doc/std/String.md)',

    # uppercase strings
    'Str::UC'           => '[Str::UC](/doc/std/String.md)',
    'Str::Uppercase'    => '[Str::UC](/doc/std/String.md)',
    'String::UC'        => '[Str::UC](/doc/std/String.md)',
    'String::Uppercase' => '[Str::UC](/doc/std/String.md)',

    # lowercase strings
    'Str::LC'           => '[Str::LC](/doc/std/String.md)',
    'Str::Lowercase'    => '[Str::LC](/doc/std/String.md)',
    'String::LC'        => '[Str::LC](/doc/std/String.md)',
    'String::Lowercase' => '[Str::LC](/doc/std/String.md)',

    # non-empty strings
    'Str::NE'           => '[Str::NE](/doc/std/String.md)',
    'Str::NonEmpty'     => '[Str::NE](/doc/std/String.md)',
    'String::NonEmpty'  => '[Str::NE](/doc/std/String.md)',
    'String::NE'        => '[Str::NE](/doc/std/String.md)',

    ### REGULAR EXPRESSIONS

    'Rgx'               => '[Rgx](/doc/std/Regex.md)',
    'Regex'             => '[Rgx](/doc/std/Regex.md)',

    ### SYMBOLS

    'Sym'               => '[Sym](/doc/std/Symbol.md)',
    'Symbol'            => '[Sym](/doc/std/Symbol.md)',

    ### BOOLEANS

    'Bool'              => '[Bool](/doc/std/Bool.md)'
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
