# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;

use Scalar::Util 'blessed';

# create a new object.
sub new {
    my ($class, $f, %opts) = @_;
    my $obj = bless { ferret => $f }, $class;
    return $obj;
}

1
