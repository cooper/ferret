# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(ferret_list_wrap);

my %specials = (
    self => \&_self,
    isa  => \&_isa
);

@Ferret::specials{keys %specials} = values %specials;

sub _self {
    my $obj = shift;
    return $obj;
}

sub _isa {
    my $obj = shift;
    return ferret_list_wrap($obj->{isa});
}



1
