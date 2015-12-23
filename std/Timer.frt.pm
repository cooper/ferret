# Copyright (c) 2015, Mitchell Cooper
package Ferret::Timer;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(perl_number ferret_number);

my @methods = (
    once => {
        code => \&run_once
    },
    expire => {
        code => \&expire_cb
    },
    tick => {
        code => \&tick_cb,
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
    $timer->{delay} = perl_number($arguments->{delay});
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
    $timer->{times} = perl_number($arguments->{times}) if $arguments->{times};

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

sub expire_cb {
    my ($timer, undef, undef, undef, $return) = @_;
    $timer->{expired} = 1;
    return $return;
}

sub tick_cb {
    return $_[4];
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
    $timer->property('tick')->call([ ferret_number(++$timer->{ticks}) ]);

    # if it's done enough times, stop.
    if (defined $timer->{times} && $timer->{ticks} >= $timer->{times}) {
        return $return if $timer->{canceled};
        $timer->_expire;
    }
}

sub _expire {
    my $timer = shift;
    my $t = delete $timer->{t};
    $timer->property('expire')->call;
    Ferret::remove_notifier($t);
}

1
