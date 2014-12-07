# Copyright (c) 2014 Mitchell Cooper
package F::Operation;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node F::Statement);

use Scalar::Util 'blessed';

sub type { 'Operation' }
sub desc { 'Mathematical operation' }

sub left_side { shift->first_child }

sub compile {
    my $op = shift;
    my @children = $op->children;
    my ($i, $next, $last, @opers);

    # for each operator, while there are instances of that operator
    foreach my $op_type (qw/pow mul div add sub/) { $i = -1;
    while (grep { is_op($_, $op_type) } @children) {
        my ($i, $left, $right) = -1;

        # for each operator of this type...
        foreach my $child (@children) { $i++;
            is_op($child, $op_type) or next;

            # replace the left side, operator, and right side with
            # an array reference to represent the operation.
            my $a = [ $op_type ];
            ($left, undef, $right) = splice @children, $i - 1, 3, $a;

            # if the last is the same type of operation, combine.
            if (ref $left eq 'ARRAY' && $left->[0] eq $op_type) {
                push @$a, @$left[1..$#$left], $right;
            }
            else {
                push @$a, $left, $right;
            }

            last;
        }
    }}

    return @children;
}

sub op_fmt {
    my ($op, $op_name, @items) = (shift, @{ +shift });
    $op->document->{required_operations}{$op_name} = 1;
    return operation => {
        operation => $op_name,
        items     => join ', ', map {
            ref $_ eq 'ARRAY' ?
                $op->get_format($op->op_fmt($_)) :
            $_->perl_fmt_do
        } @items
    };
}

sub perl_fmt {
    my $op = shift;
    return $op->op_fmt($op->compile);
}

sub is_op {
    my ($op, $type) = @_;
    blessed $op or return;
    $op->type    eq 'Operator' or return;
    $op->op_type eq $type      or return;
    return 1;
}

1
