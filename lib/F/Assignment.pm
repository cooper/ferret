# Copyright (c) 2014 Mitchell Cooper
package F::Assignment;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node F::Statement);

sub type { 'Assignment' }
sub desc {
    # TODO
    shift->type;
}

sub perl_fmt_do {
    my $a = shift;
    my ($fmt_name, $fmt_args) = $a->assign_to->perl_fmt;
    $fmt_args->{assign_value} = $a->assign_value->perl_fmt_do;
    return $a->get_format("assign_$fmt_name" => $fmt_args);
}

sub assign_to    { (shift->children)[0] }
sub assign_value {
    my $a = shift;
    my @c = $a->children;
    my $exp = F::Expression->new(parent => $a->parent);
    $exp->adopt($_) foreach @c[1..$#c];
    return $exp;
}

1