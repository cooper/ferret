# Copyright (c) 2015, Mitchell Cooper
package Ferret::Conversion;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Operations 'import';
use Scalar::Util 'blessed';

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

1
