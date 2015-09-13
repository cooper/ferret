# Copyright (c) 2015, Mitchell Cooper
package Ferret::Timer;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @methods = (
    once => {
        code => \&run_once
    },
    expire => {
        code => \&expire_cb
    },
    cancel => {
        code => \&cancel
    }
    # start
    # stop
);

Ferret::bind_class(
    name      => 'Timer',
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

sub run_once {
    my ($timer, $arguments, $from_scope, $scope, $return) = @_;

    # create a countdown timer.
    require IO::Async::Timer::Countdown;
    my $t; $t = $timer->{t} = IO::Async::Timer::Countdown->new(
        delay => $timer->{delay} // 5,
        on_expire => sub {
            return if $timer->{canceled};
            delete $timer->{t};
            $timer->property('expire')->call([ ]);
            Ferret::remove_notifier($t);
        }
    );

    # add to loop.
    Ferret::add_notifier($t->start);

    # conveniently return the expire event.
    #$return->set_property(expire => $timer->property('expire'));
    # nvm: can't do this anymore. it causes last_parent to be the
    # return object, meaning the event would belong to that object

    return $timer;
}

sub expire_cb {
    my ($timer, $arguments, $from_scope, $scope, $return) = @_;
    $timer->{expired} = 1;
    return $return;
}

sub cancel {
    my ($timer, $arguments, $from_scope, $scope, $return) = @_;
    $timer->{canceled} = 1;
    my $t = delete $timer->{t} or return $return;
    $t->stop;
    Ferret::remove_notifier($t);
    $return->set_property(canceled => Ferret::true);
    return $return;
}

1
