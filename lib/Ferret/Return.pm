# Copyright (c) 2015, Mitchell Cooper
package Ferret::Return;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(ferror);
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
        $ret->set_property_weak(override => $force);
        return $ret->{override} = $force;
    }

    return $ret;
}

# called in Event.pm; yields the event fire's ultimate return value.
sub final_return {
    my $ret = shift;

    # if it didn't fail and the call count is zero,
    # then fail for that reason.
    if (!$ret->{failed} && !$ret->{call_count}) {
        return $ret->fail(ferror(
            'Unsatisfied arguments; no callbacks were executed',
            'UnsatisfiedArguments'
        ));
    }

    return delete $ret->{override} // $ret;
}

# stops further event propagation.
sub stop {
    # FIXME: if this isn't an event, raise a runtime error.
    my $fire = shift->{fire} or return;
    $fire->stop;
}

# fail with an error. stops propagation. this is nonfatal.
sub fail {
    my ($ret, $err) = @_;
    $err = ferror($err) if !blessed $err;
    $ret->{failed}++;
    $ret->set_property(error => $err);
    $ret->stop;
    delete $ret->{override};
    return $ret;
}

# die with an error. this is fatal.
sub throw {
    my ($ret, $err) = @_;
    $ret->fail($err);
    Ferret::Core::Errors::throw($err, [caller]);
}

# called internally after each ->return().
sub _run_defers {
    my $ret = shift;
    my $defers = $ret->{defers} or return;
    $_->() foreach @$defers;
    @$defers = ();
}

1
