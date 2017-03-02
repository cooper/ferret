# Copyright 2015, Mitchell Cooper
package F::Negation;

use warnings;
use strict;
use parent qw(F::NodeExpression);

sub perl_fmt {
    my $not = shift;
    my $exp = $not->first_child->perl_fmt_do;
    my $main = $not->main;
    $main->{required_operations}{_not}++;
    return not => { expression => $exp };
}

1
