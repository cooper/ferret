# Copyright (c) 2014 Mitchell Cooper
package F::Assignment;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Assignment' }
sub desc {
    my $a = shift;
    my $left = $a->assign_to->desc;
    return "assignment ($left)";
}

sub perl_fmt_do {
    my $a = shift;
    my ($fmt_name, $fmt_args) = $a->assign_to->perl_fmt;
    $fmt_args->{assign_value} = $a->assign_value->perl_fmt_do;
    return $a->get_format("assign_$fmt_name" => $fmt_args);
}

sub assign_to    { shift->{left_side} }
sub assign_value {
    my $a = shift;
    return $a->{assign_value} if $a->{assign_value};
    my @c = $a->children;
    my $exp = F::Expression->new(parent => $a->parent);
    $exp->adopt($_) foreach @c;
    return $a->{assign_value} = $exp;
}

1
