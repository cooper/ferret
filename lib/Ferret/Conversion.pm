# Copyright (c) 2015, Mitchell Cooper
package Ferret::Conversion;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Operations 'import';
use Scalar::Util qw(blessed looks_like_number);

# return a ferret string object.
sub ferret_string {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        return Ferret::String->new($f, value => $val);
    }

    # already a blessed string.
    if ($val->isa('Ferret::String')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # maybe an unblessed string object.
        if (defined $val->{value}) {
            return $val;
        }

        # it's an object with a string converter.
        if (my $to_str = $val->property('toString')) {
            return $to_str->call;
        }

    }

    # it's an object with no string value.
    my $addr = $val + 0;
    return Ferret::String->new($f, value => "[object $addr]");

}

# return a perl string value.
sub perl_string {
    my $val = shift;
    return $val if !blessed $val;
    return ferret_string($val)->{value} // '';
}

# return a ferret number object.
sub ferret_number {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        $val = 0 if !looks_like_number($val);
        return Ferret::Number->new($f, value => $val);
    }

    # already a blessed number.
    if ($val->isa('Ferret::Number')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # maybe an unblessed number object.
        if (defined $val->{value}) {
            return $val;
        }

        # it's an object with a number converter.
        if (my $to_num = $val->property('toNumber')) {
            return $to_num->call;
        }

    }

    # it's an object with no number value.
    my $addr = $val + 0;
    return Ferret::Number->new($f, value => $addr);

}

# return a perl string value.
sub perl_number {
    my $val = shift;
    return $val if !blessed $val;
    return ferret_number($val)->{value} // 0;
}


1
