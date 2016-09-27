# Copyright (c) 2015, Mitchell Cooper
package Ferret::Tie;

use warnings;
use strict;
use utf8;

use Scalar::Util 'weaken';

sub TIEHASH {
    my ($class, $obj) = @_;
    my $a = [ $obj ]; # form: [ obj, keys ]
    weaken($a->[0]);
    return bless $a, $class;
}

sub FETCH {
    my ($self, $key) = @_;
    return $$self[0]->property_u($key);
}

sub STORE {
    my ($self, $key, $value) = @_;
    return $$self[0]->set_property($key => $value);
}

sub DELETE {
    my ($self, $key) = @_;
    my $val = $$self[0]->property_u($key);
    $$self[0]->delete_property($key);
    return $val;
}

sub EXISTS {
    my ($self, $key) = @_;
    return !!$$self[0]->has_property($key);
}

sub FIRSTKEY {
    my ($self) = @_;
    my @keys = grep EXISTS($self, $_), keys %{ $$self[0]->{properties} };
    $self->[1] = \@keys;
    return shift @keys;
}

sub NEXTKEY {
    my ($self) = @_;
    return shift @{ $self->[1] };
}

1
