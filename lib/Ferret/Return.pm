# Copyright (c) 2015, Mitchell Cooper
package Ferret::Return;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(ferror fnumber);
use Scalar::Util qw(blessed);

sub new {
    my ($class, $f, %opts) = @_;
    return $class->SUPER::new($f,
        faketype  => 'Return',
        is_return => 1,
        %opts
    );
}

# called in Function.pm to increment how many callbacks were satisfied.
# used to determine the truth of the return.
sub inc {
    my $ret = shift;
    $ret->{call_count}++;
}

# if ->true_return returns true, the return yields boolean true.
sub true_return {
    my $ret = shift;
    return !$ret->{failed} && $ret->{call_count};
}

# defer a code until the next ->return().
sub defer {
    my ($ret, $code) = @_;
    push @{ $ret->{defers} ||= [] }, $code;
}

# called in Function.pm with the value of the actual return.
sub return {
    my ($ret, $force) = @_;
    $ret->_run_defers;

    # if returned an object other than $ret,
    # it will override the current return.
    if ($force && $force != $ret) {
        $ret->set_property_weak(result => $force);
        return $ret->{result} = $force unless $ret->{detail};
    }

    return $ret;
}

# called in Function.pm and Event.pm; tells us to always yield the return object
sub detail {
    my $ret = shift;
    $ret->{detail}++;
}

# called in Event.pm; yields the event fire's ultimate return value.
sub final_return {
    my $ret = shift;

    # normally unsatisfied arguments for a function in an
    # event do not ->fail, just ->error_continue. this
    # calls ->fail if not even one callback was called.
    if (!$ret->{failed} && !$ret->{call_count}) {
        return $ret->fail($ret->{first_error}) if $ret->{first_error};
        return $ret->fail('No functions called', 'UnsatisfiedArguments');
    }

    return $ret if $ret->{detail};
    return delete $ret->{result} // $ret;
}

# stops further event propagation.
sub stop {
    # FIXME: if this isn't an event, raise a runtime error.
    my $fire = shift->{fire} or return;
    $fire->stop;
}

# fail with an error. stops propagation. this is nonfatal.
sub fail {
    my ($ret, $err, $pos) = @_;
    $err = $ret->error_continue($err, $pos);
    $ret->stop;
    delete $ret->{result};
    $ret->{failed}++;
    $ret->set_property(error => $err);
    return $ret;
}

# same as fail except propagation continues.
# does not set ->failed to true either.
sub error_continue {
    my ($ret, $err, $pos) = @_;

    # fix the error
    $err = ferror($err) if !blessed $err;
    $err->{pos} = $pos;
    ferror($err); # update position

    $ret->{first_error} //= $err;
    return $err;
}

# die with an error. this is fatal.
sub throw {
    my ($ret, $err, $pos) = @_;
    $err->{pos} = $pos;
    $ret->fail($err);
    Ferret::Core::Errors::throw($err, [caller], $pos);
}

# called internally after each ->return().
sub _run_defers {
    my $ret = shift;
    my $defers = $ret->{defers} or return;
    $_->() foreach @$defers;
    @$defers = ();
}

# true if failed (fail or throw)
sub failed { shift->{failed} }

sub description {
    my $obj = shift;
    return "[ No return ]" if !scalar $obj->properties(1);
    return $obj->SUPER::description(@_);
}

1
