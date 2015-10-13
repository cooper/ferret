# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(ferret_list_wrap ferret_list);

my %specials = (
    self     => \&_self,
    isa     => \&_isa,
    classes => \&_classes
);

@Ferret::specials{keys %specials} = values %specials;

sub _self {
    my $obj = shift;
    return $obj;
}

# returns mutable ISA list.
sub _isa {
    my $obj = shift;
    return ferret_list_wrap($obj->{isa});
}

# returns immutable class list.
sub _classes {
    my $obj = shift;
    return ferret_list($obj->parent_classes);
}

1
