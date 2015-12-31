# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Errors;

use warnings;
use strict;
use utf8;
use 5.010;

use List::Util 'max';

use Ferret::Core::Operations 'import';
use Ferret::Core::ErrorSubs;

our %errors = (
    CallOnNonFunction => {
        message => "Cannot call non-function value"
    },
    AssignmentToSpecialProperty => {
        message => "Cannot assign to special property '%s'"
    },
    AlterationOfReadOnlyProperty => {
        message => "Cannot alter read-only property '%s'"
    },
    InvalidIteration => {
        message => "Cannot iterate over this object"
    }
);

sub throw {
    my ($fmt, $caller, $hints, @args) = @_;
    my @hints = @$hints;
    my (undef, $file, $line) = @$caller;
    return $fmt if !exists $errors{$fmt};

    # main error.
    my $err = "Runtime error: ".sprintf($errors{$fmt}{message}, @args).".\n";

    # hints.
    my %hints = @hints;
    my $max = 2 + max(map length($_), keys %hints);
    while (@hints) {
        my ($key, $value) = (shift @hints, shift @hints);
        next if !defined $key || !defined $value;

        $value     = join "\n    ", split /\n/, $value;
        my $spaces = ' ' x ($max - length $key);
        $err      .= "    $key$spaces-> $value\n";
    }

    $err .= "Exception $fmt raised at $file line $line.\n";
    die $err;
}

1
