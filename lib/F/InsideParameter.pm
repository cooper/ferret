# Copyright (c) 2015, Mitchell Cooper
package F::InsideParameter;

use warnings;
use strict;
use utf8;
use 5.010;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'inside',
        generated_expression => 1
    );
}

1
