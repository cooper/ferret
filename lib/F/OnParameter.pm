# Copyright (c) 2015, Mitchell Cooper
package F::OnParameter;

use warnings;
use strict;
use utf8;
use 5.010;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'on',
        generated_expression => 1,
        %opts
    );
}

sub add_maybe {
    my ($exp, $maybe) = @_;
    my $on = $exp->parent;
    push @{ $on->{maybes} ||= [] }, $maybe;
}

1
