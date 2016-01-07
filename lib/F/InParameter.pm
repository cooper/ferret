# Copyright (c) 2015, Mitchell Cooper
package F::InParameter;

use parent qw(F::NodeExpression);

use warnings;
use strict;
use utf8;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'in',
        generated_expression => 1
    );
}

1
