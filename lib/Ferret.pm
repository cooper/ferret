# Copyright (c) 2013 Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util 'blessed';

use Ferret::Context;
use Ferret::Function;
use Ferret::Event;
use Ferret::Core::Functions;
use Ferret::Core::Context;

# object constants.
my $undefined = \'undefined';
sub true      () { state $true  = \'true'  } # TODO
sub false     () { state $false = \'false' } # TODO

# fetch undefined value or test if a value is undefined.
sub undefined(;$) {
    my $test = shift;
    return $undefined if not defined $test;
    return $test == $undefined;
}

# create a new ferret.
sub new {
    my ($class, %opts) = @_;
    my $f = bless {}, $class;

    # create the main context object.
    $f->{context} = Ferret::Context->new($f, %opts);

    return $f;
}

# returns the main context.
sub context {
    shift->{context};
}

# returns Perl boolean of whether or not a value is a valid Ferret value.
sub valid_value {
    defined(my $value = shift) or return;

    # if it's one of these non-object values, it's good.
    if ($value == undefined || $value == true || $value == false) {
        return 1;
    }

    # if it's an object, it's good.
    if (blessed($value) && $value->isa('Ferret::Object')) {
        return 1;
    }

    # it is none of these; not good.
    return;

}

1
