# Copyright (c) 2015, Mitchell Cooper
package Ferret::Prototype;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

sub new {
    my ($class, $f, %opts) = @_;
    return $class->SUPER::new($f,
        is_proto => 1,
        faketype => 'Prototype',
        %opts
    );
}

1
