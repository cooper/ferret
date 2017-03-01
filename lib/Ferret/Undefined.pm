# Copyright (c) 2016, Mitchell Cooper
package Ferret::Undefined;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Errors qw(throw);

sub new {
    my ($class, $f, %opts) = @_;
    return $class->SUPER::new($f,
        faketype => 'Undefined',
        %opts
    );
}

sub _property {
    my ($obj, $prop_name) = @_;
    throw(PropertyOnUndefined => undef, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol
    ], $prop_name);
}

sub set_property {
    my ($obj, $prop_name) = @_;
    throw(SetPropertyOnUndefined => undef, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol
    ], $prop_name);
}

sub call {
    my ($obj) = @_;
    throw(CallOnUndefined => undef, [
        Name  => $obj->{last_name},
        Value => $obj->description_ol
    ]);
}

1
