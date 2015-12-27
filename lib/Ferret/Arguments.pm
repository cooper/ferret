# Copyright (c) 2015, Mitchell Cooper
package Ferret::Arguments;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(
    _pstring
    _pnumber
    _pbool
    _plist
);

sub pstring {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = _pstring($obj->{$prop_name});
    $value = length $value ? $value : ($fallback // '');
    return $value;
}

sub pnumber {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = $obj->{$prop_name};
    return $value ? _pnumber($value) // $fallback : $fallback;
}

sub pbool {
    my ($obj, $prop_name, $fallback) = @_;
    my $value = $obj->{$prop_name};
    return $value ? _pbool($value) : $fallback;
}

sub plist {
    my ($obj, $prop_name) = @_;
    my $value = $obj->{$prop_name};
    return $value ? _plist($value) : ();
}

sub call {
    my ($obj, $prop_name) = (shift, shift);
    my $call = $obj->{$prop_name} || Ferret::undefined;
    $call->call(@_);
}

sub has {
    my ($obj, $prop_name) = @_;
    return !!$obj->{$prop_name};
}

1
