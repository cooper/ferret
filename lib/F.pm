# Copyright (c) 2015, Mitchell Cooper
package F;

use warnings;
use strict;
use utf8;
use 5.010;

sub new {
    my ($type, @args) = @_;
    my $file = "F/$type.pm";
    require $file if !$INC{$file};
    return "F::$type"->new(@args);
}

1
