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
    my ($star, $scope, @items) = @_;
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
        die "no idea what to do with that";
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
    # type of object. just move on to the next operand.
    # consider: produce a warning?
    return if _bad_return($next);

    return $next;
}

sub _bad_return {
    my $ret = shift;
    return if !$ret->isa('Ferret::Return');
    return $ret->failed || !$ret->num_called;
}

################
### EQUALITY ###
################

sub equal {
    shift;
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
    shift;
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
    shift;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->less_than($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub less_e {
    shift;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->less_than_equal($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub gr8r {
    shift;
    my $obj = shift;
    while (@_) {
        my $right = shift;
        return Ferret::false if !bool($obj->gr8r_than($right));
        $obj = $right;
    }
    return Ferret::true;
}

sub gr8r_e {
    shift;
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
    shift;
    return Ferret::true if all { bool($_->()) } @_;
    return Ferret::false;
}

sub any_true {
    shift;
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

sub num { Ferret::Number->new(shift, num_value => shift) }
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
