# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Errors;

use warnings;
use strict;
use utf8;
use 5.010;

use List::Util qw(max);
use Scalar::Util qw(blessed);
use Ferret::Core::Operations qw(import);

our %errors = (
    CallOnUndefined => {
        message => "Cannot call undefined value"
    },
    CallOnNonFunction => {
        message => "Cannot call non-code value"
    },
    PropertyOnUndefined => {
        message => "Attempted to access property '%s' of undefined"
    },
    SetPropertyOnUndefined => {
        message => "Attempted to set property '%s' of undefined"
    },
    IndexOnNonCollection => {
        message => "Cannot access index on non-indexable value"
    },
    SetIndexOnNonCollection => {
        message => "Cannot assign to index on non-indexable value"
    },
    ModifyIndexOnNonCollection => {
        message => "Cannot modify index on non-indexable value"
    },
    AssignmentToSpecialProperty => {
        message => "Cannot assign to special property '%s'"
    },
    AlterationOfReadOnlyProperty => {
        message => "Cannot alter read-only property '%s'"
    },
    InvalidIteration => {
        message => "Cannot iterate over this object"
    },
    InvalidOperation => {
        message => "No operator implementation for those types"
    },
    NativeCodeError => {
        message => "%s"
    }
);

sub throw {
    my ($fmt, $caller, $pos, $hints, @args) = @_;
    $pos ||= $FF::pos;

    # we may have been passed an already-prepared error object.
    if (blessed $fmt) {
        $fmt->set_property(fatal => Ferret::true);
        die Ferret::Core::Conversion::ferror($fmt);
    }

    my (undef, $file, $line) = @$caller;
    return $fmt if !exists $errors{$fmt};

    # main error.
    my $err = sprintf($errors{$fmt}{message}, @args);
    $err =~ s/(\.|\n)$//g;

    # inject posision info.
    if ($pos) {
        push @$hints, File => "$pos";
        push @$hints, Line => int $pos;
    }

    throw(Ferret::Core::Conversion::ferror($err, $fmt, @$hints));
}

1
