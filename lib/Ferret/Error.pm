# Copyright (c) 2015, Mitchell Cooper
package Ferret::Error;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(fstring fnumber);

sub update_position {
    my ($err, $pos) = @_;
    return if !defined $pos;
    $err->call_prop(setPosition => [ fstring("$pos"), fnumber(int $pos) ]);
}

1
