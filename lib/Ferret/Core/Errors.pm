# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Errors;

use warnings;
use strict;
use utf8;
use 5.010;

use List::Util qw(max);
use Ferret::Core::Operations qw(import);

our %errors = (
    CallOnNonFunction => {
        message => "Cannot call non-function value"
    },
    IndexOnNonCollection => {
        message => "Cannot access index on non-indexable value"
    },
    SetIndexOnNonCollection => {
        message => "Cannot assign to index on non-indexable value"
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
    NativeCodeError => {
        message => "%s"
    }
);

sub throw {
    my ($fmt, $caller, $hints, @args) = @_;
    my (undef, $file, $line) = @$caller;
    return $fmt if !exists $errors{$fmt};

    # main error.
    my $err = sprintf($errors{$fmt}{message}, @args);
    $err =~ s/(\.|\n)$//g;
    $err .= ".\n";

    die Ferret::Core::Conversion::ferror($err, $fmt, @$hints);
}

1
