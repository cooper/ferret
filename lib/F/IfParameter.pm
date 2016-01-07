# Copyright (c) 2015, Mitchell Cooper
package F::IfParameter;

use warnings;
use strict;
use utf8;
use 5.010;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'if',
        generated_expression => 1
    );
}

sub add_maybe {
    my ($exp, $maybe) = @_;
    my $if = $exp->parent;
    push @{ $if->{maybes} ||= [] }, $maybe;
}

1
