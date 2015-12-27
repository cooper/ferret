# Copyright (c) 2015, Mitchell Cooper
package Ferret::Timer;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(pnumber fnumber);

my @methods = (
    once => {
        code => \&run_once
    },
    expire => {
    },
    tick => {
        want => '$n:Num'
    },
    cancel => {
        code => \&cancel
    },
    start => {
        code => \&start,
        want => '$times:Num'
    },
    stop => {
        code => \&cancel
    }
);

Ferret::bind_class(
    name      => 'Timer',
    methods   => \@methods,
    init      => \&init,
    init_need => '$delay:Num'
);

*new = *Ferret::bind_constructor;

sub init {
    my ($timer, $arguments) = @_;
    $timer->{delay} = $arguments->pnumber('delay');
}

sub run_once {
    my ($timer, $arguments, $call_scope, $scope, $return) = @_;

    # create a countdown timer.
    require IO::Async::Timer::Countdown;
    my $t; $t = $timer->{t} = IO::Async::Timer::Countdown->new(
        delay => $timer->{delay},
        on_expire => sub {
            return if $timer->{canceled};
            $timer->_tick;
            $timer->_expire;
        }
    );

    # add to loop.
    Ferret::add_notifier($t->start);

    return $timer;
}

sub start {
    my ($timer, $arguments, $call_scope, $scope, $return) = @_;
    $timer->{times} = $arguments->pnumber('times') if $arguments->{times};

    # create a periodic timer.
    require IO::Async::Timer::Periodic;
    my $t; $t = $timer->{t} = IO::Async::Timer::Periodic->new(
        interval  => $timer->{delay},
        on_tick   => sub {
            return if $timer->{canceled};
            $timer->_tick;
        }
    );

    # add to loop.
    Ferret::add_notifier($t->start);

    return $timer;
}

sub cancel {
    my ($timer, $arguments, $call_scope, $scope, $return) = @_;
    $timer->{canceled} = 1;
    my $t = delete $timer->{t} or return $return;
    $t->stop;
    Ferret::remove_notifier($t);
    $return->set_property(canceled => Ferret::true);
    return $return;
}

sub _tick {
    my ($timer, undef, undef, undef, $return) = @_;
    $timer->call_prop(tick => [ fnumber(++$timer->{ticks}) ]);

    # if it's done enough times, stop.
    if (defined $timer->{times} && $timer->{ticks} >= $timer->{times}) {
        return $return if $timer->{canceled};
        $timer->_expire;
    }
}

sub _expire {
    my $timer = shift;
    $timer->{expired} = 1;
    my $t = delete $timer->{t};
    $timer->property('expire')->call;
    Ferret::remove_notifier($t);
}

1
