# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Operations;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Shared::Utils qw(import regex_str);
use List::Util qw(all first);

BEGIN {
    no strict 'refs';
    foreach my $star (qw/range pow mod mul div add _sub sim/) {
        *$star = sub { op_star($star, @_) };
    }
}

sub op_star {
    my ($star, $scope, $pos, @items) = @_;
    $star    = 'sub' if $star eq '_sub';
    my $op   = 'op'.ucfirst($star);
    my $left = shift @items or return;

    while (@items) {
        my $right = shift @items;

        # first try the LHS
        my $lhs = _do_operator($op, $scope, $left, $right, 'rhs');
        if ($lhs) {
            return Ferret::undefined
                if Ferret::undefined($lhs);
            $left = $lhs;
            next;
        }

        # try RHS if that failed
        my $rhs = _do_operator($op, $scope, $right, $left, 'lhs');
        if ($rhs) {
            return Ferret::undefined
                if Ferret::undefined($rhs);
            $left = $rhs;
            next;
        }

        # both failed.
        Ferret::Core::Errors::throw(InvalidOperation => $pos, [
            Op  => $op,
            LHS => $left->description_ol,
            RHS => $right->description_ol
        ]);
    }

    return $left;
}

sub _do_operator {
    my ($op_func, $scope, $operand1, $operand2, $side) = @_;

    # no operations against undefined are permitted
    return Ferret::undefined
        if Ferret::undefined($operand1);

    # find an operator implementation from this side
    my $func = $operand1->property($op_func);

    # no implementation; try other side
    return if !$func;

    # call the operator on this side
    my $next = $func->call({ $side => $operand2, ehs => $operand2 }, $scope);

    # if the return value is undefined, the operator implementation
    # is explicitly requesting that we do not continue.
    return Ferret::undefined
        if Ferret::undefined($next);

    # if it's a return object, the operation likely isn't defined for this
    # type of object. just move on to the next operand. if not even one callback
    # was satisfied by the arguments, it will have ->failed.
    # consider: produce a warning?
    return if $next->isa('Ferret::Return') && $next->failed;

    return $next;
}

################
### EQUALITY ###
################

sub equal {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->equal_to($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub nequal { _not(&equal) }

sub refs_equal {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->equal_to_exactly($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub refs_nequal { _not(&refs_equal) }

##################
### INEQUALITY ###
##################

sub less {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->less_than($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub less_e {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->less_than_equal($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub gr8r {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->gr8r_than($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub gr8r_e {
    splice @_, 0, 2;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->gr8r_than_equal($right));
        $obj = $right;
    }
    return Ferret::true;
}

###############
### BOOLEAN ###
###############

sub all_true {
    splice @_, 0, 2;
    return Ferret::true if all { bool($_->()) } @_;
    return Ferret::false;
}

sub any_true {
    splice @_, 0, 2;
    my $first;
    first { bool($first = $_->()) } @_;
    return $first || Ferret::undefined;
}

sub bool {
    return Ferret::truth(@_);
}

sub _not {
    my $val = shift;
    my $perl_truth = !Ferret::truth($val);
    return $perl_truth ? Ferret::true : Ferret::false;
}

sub nsim { _not(&sim) }

##############
### OTHERS ###
##############

sub num {
    my ($f, $num) = @_;
    my $last = \substr($num, -1);
    if ($$last eq 'i') {
        $$last = '';
        my $cmplx = $f->{complex} //=
            $f->get_class('Complex');
        $num = 1 if !length $num;
        my @args = map Ferret::Core::Conversion::fnumber($_), 0, $num;
        return $cmplx->call(\@args);
    }
    return Ferret::Number->new($f, num_value => $num);
}

sub str { Ferret::String->new(shift, str_value => shift) }
sub rgx {
    my ($f, $id, $rgx, $mods) = @_;
    $id //= regex_str($rgx, $mods);
    return $f->{constant_expressions}{$id} ||= Ferret::Regex->new($f,
        init_args => {
            rgx  => $rgx,
            mods => $mods
        }
    );
}

1
