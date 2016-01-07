# Copyright (c) 2015, Mitchell Cooper
package F::CatchParameter;

use warnings;
use strict;
use utf8;
use 5.010;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'catch',
        generated_expression => 1
    );
}

1
