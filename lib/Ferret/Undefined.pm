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
    throw(PropertyOnUndefined => [caller], [
        Name  => $obj->{last_name},
        Value => $obj->description_ol,
        File  => "$FF::pos",
        Line  => int($FF::pos || 0)
    ], $prop_name);
}

sub set_property {
    my ($obj, $prop_name) = @_;
    throw(SetPropertyOnUndefined => [caller], [
        Name  => $obj->{last_name},
        Value => $obj->description_ol,
        File  => "$FF::pos",
        Line  => int($FF::pos || 0)
    ], $prop_name);
}

sub call {
    my ($obj) = @_;
    throw(CallOnUndefined => [caller], [
        Name  => $obj->{last_name},
        Value => $obj->description_ol,
        File  => "$FF::pos",
        Line  => int($FF::pos || 0)
    ]);
}

1
