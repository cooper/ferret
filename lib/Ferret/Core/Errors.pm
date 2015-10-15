# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Errors;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Operations 'import';
use Ferret::Core::ErrorSubs;

our %errors = (
    CallOnNonFunction => {
        message => "Cannot call non-function value (%s)"
    },
    AssignmentToSpecialProperty => {
        message => "Cannot assign to special property '%s'"
    }
);

sub throw {
    my ($fmt, $caller, @args) = (shift, shift, @_);
    return $fmt if !exists $errors{$fmt};
    my (undef, $file, $line) = @$caller;
    die "Runtime error: ".sprintf($errors{$fmt}{message}, @_)." at $file line $line.\n";
}

1
