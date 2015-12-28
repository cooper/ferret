# Copyright (c) 2015, Mitchell Cooper
package Ferret::Return;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

sub new {
    my ($class, $f, %opts) = @_;
    return $class->SUPER::new($f,
        faketype  => 'Return',
        is_return => 1,
        %opts
    );
}

sub inc {
    my $ret = shift;
    $ret->{call_count}++;
}

sub true_return {
    my $ret = shift;
    return $ret->{call_count};
}

sub defer {
    my ($ret, $code) = @_;
    push @{ $ret->{defers} ||= [] }, $code;
}

sub return {
    my ($ret, $force) = @_;
    $ret->run_defers;
    return $force if $force;
    return $ret;
}

sub run_defers {
    my $ret = shift;
    my $defers = $ret->{defers} or return;
    $_->() foreach @$defers;
    @$defers = ();
}

# stop further propagation.
sub stop {
    # FIXME: if this isn't an event, raise a runtime error.
    my $fire = shift->{fire} or return;
    $fire->stop;
}

1
