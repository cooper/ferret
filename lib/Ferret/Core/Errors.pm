# Copyright (c) 2017, Mitchell Cooper
#
# Runtime errors
#
package Ferret::Core::Errors;

use warnings;
use strict;
use utf8;
use 5.010;

use List::Util qw(max);
use Scalar::Util qw(blessed);
use Ferret::Core::Operations qw(import);

our %errors = (

    # tried to call undefined
    CallOnUndefined => {
        message => "Cannot call undefined value"
    },

    # tried to call any defined value which cannot be called
    CallOnNonFunction => {
        message => "Cannot call non-code value"
    },

    # tried to access a property of undefined
    PropertyOnUndefined => {
        message => "Attempted to access property '%s' of undefined"
    },

    # tried to set a property on undefined
    SetPropertyOnUndefined => {
        message => "Attempted to set property '%s' of undefined"
    },

    # tried to access an index $obj[$idx] where $obj is not IndexedRead
    IndexOnNonCollection => {
        message => "Cannot access index on non-indexable value"
    },

    # tried to set an index $obj[$idx] where $obj is not IndexedWrite
    SetIndexOnNonCollection => {
        message => "Cannot assign to index on non-indexable value"
    },

    # tried to delete or weaken an index $obj[$idx] where $obj is not
    # IndexedWrite
    ModifyIndexOnNonCollection => {
        message => "Cannot modify index on non-indexable value"
    },

    # tried to assign $obj.*prop, where *prop is any special property
    AssignmentToSpecialProperty => {
        message => "Cannot assign to special property '%s'"
    },

    # tried to assign to a read-only property or any property on a read-only
    # object
    AlterationOfReadOnlyProperty => {
        message => "Cannot alter read-only property '%s'"
    },

    # tried for $x in $obj where $obj is not IndexedRead
    InvalidIteration => {
        message => "Cannot iterate over this object"
    },

    # tried to use an operator, but neither side offers an implementation for
    # the given operand types
    InvalidOperation => {
        message => "No operator implementation for those types"
    },

    # tried to extend something other than a class or context
    ExtensionOfNonContext => {
        message => "In 'package %s', %s evaluates to a non-context object"
    },

    # autoloading or load statement failed
    UnresolvedDependencies => {
        message => "Unable to resolve dependency '%s'"
    },

    # an exception occurred in native code (Perl die(), croak(), etc.)
    NativeCode => {
        message => "%s"
    },

    # divison by zero
    ZeroDivision => {
        message => "Illegal division by zero"
    }
);

# throw()
# throws a runtime error, calling die()
#
#   passing a prepared Ferret::Error object
#
#       $fmt        the prepared error object
#
#   throwing an error from Perl code
#
#       $fmt        error name, one of the keys from the above list
#
#       $pos        (optional) dualvar position information
#
#       $hints      (optional) arrayref of hint pairs. keys are one-word
#                   human-readable hint names; values are human-readable strings
#
#       @args       (optional) additional arguments to be passed to sprintf()
#                   to format the error message
#
sub throw {
    my ($fmt, $pos, $hints, @args) = @_;
    $pos ||= $FF::pos;

    # we may have been passed an already-prepared error object.
    if (blessed $fmt) {
        $fmt->set_property(fatal => Ferret::true);
        die $fmt;
    }

    # main error.
    my $err = sprintf($errors{$fmt}{message}, @args);
    $err =~ s/(\.|\n)$//g;

    # inject posision info.
    $hints ||= [];
    if ($pos) {
        push @$hints, File => "$pos";
        push @$hints, Line => int $pos;
    }

    $fmt .= 'Error';
    throw(Ferret::Core::Conversion::ferror($err, $fmt, @$hints));
}

1
