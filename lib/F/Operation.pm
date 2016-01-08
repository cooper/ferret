# Copyright (c) 2015, Mitchell Cooper
package F::Operation;

use warnings;
use strict;
use 5.010;
use parent qw(F::NodeExpression);

use Scalar::Util 'blessed';


sub left_side { shift->first_child }

# handle signs.
sub adopt {
    my ($op, $maybe) = (shift, @_);
    my $before = $op->last_child;

    # first element is an operator.
    # don't worry about anything except signs (+/-)
    # because the constructor will not allow that to happen.
    if (!$before && is_op($maybe)) {
        $before = F::new('Number', value => 0, zero => 1);
        $op->SUPER::adopt($before);
        $maybe->{token} = 'OP_S'.uc($maybe->op_type); # super sub
    }

    # two operators in a row.
    elsif (is_op($before) && is_op($maybe)) {

        # it could be a negation.
        if (is_op($maybe, 'sub')) {

            # two negatives = positive.
            #
            # note how this calls ->adopt again, rather than SUPER::adopt.
            # this is because the below check is_op($maybe, 'add')
            # may ignore it altogether.
            #
            my $super = is_op($before, 'ssub');
            if (is_op($before, 'sub') || $super) {
                $op->abandon($before);
                return $op->adopt(F::new('Operator', token =>
                    $super ? 'OP_SADD' : 'OP_ADD' # super add
                ));
            }

            # otherwise it's just a normal negation.
            $op->SUPER::adopt(F::new('Number', value => 0, zero => 1));
            $maybe->{token} = 'OP_S'.uc($maybe->op_type); # super sub

            return $op->SUPER::adopt(@_);
        }

        # it's just a positive; do nothing.
        if (is_op($maybe, 'add')) {
            return;
        }

        # otherwise, not allowed.
        return $maybe->unexpected();

    }

    return $op->SUPER::adopt(@_);
}

sub compile {
    my $op = shift;
    my @children = $op->children;

    # for each operator, while there are instances of that operator
    foreach my $op_type (qw/
        ssub sadd range
        pow mod mul div sub add
        equal_i nequal_i equal nequal and or
    /) {
    while (grep { is_op($_, $op_type) } @children) {
        my ($i, $left, $right) = -1;

        # for each operator of this type...
        foreach my $child (@children) { $i++;
            is_op($child, $op_type) or next;

            # replace the left side, operator, and right side with
            # an array reference to represent the operation.
            my $a = [ $op_type ];
            ($left, undef, $right) = splice @children, $i - 1, 3, $a;

            # FIXME: do something proper if there is no $right
            die 'no right side' if !$right;

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

my %map = (
    'sub'       => '_sub',
    'ssub'      => '_sub',
    'sadd'      => 'add',
    'or'        => 'any_true',
    'and'       => 'all_true',
    'equal_i'   => 'refs_equal',
    'nequal_i'  => 'refs_nequal'
);

sub op_fmt {
    my ($op, $op_name, @items) = (shift, @{ +shift });
    $op_name = $map{$op_name} || $op_name;

    my $doc = $op->document;
    $doc->{required_operations}{$op_name}++;

    return operation => {
        operation => $op_name,
        items     => join ', ', map {
            ref $_ eq 'ARRAY' ?
                F::get_perl_fmt($op->op_fmt($_)) :
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
    $op->op_type eq $type      or return if length $type;
    return 1;
}

1
