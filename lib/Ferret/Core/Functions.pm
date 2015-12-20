# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use List::Util qw(any all);

use Ferret::Core::Conversion qw(
    perl_string         ferret_string
    perl_boolean        ferret_boolean
    perl_number         ferret_number
    perl_description
);

our %functions = (
    say => {
        need => '$message',
        code => \&_say
    },
    dump => {
        need => '$value',
        code => \&_dump
    },
    inspect => {
        need => '$value',
        code => \&_inspect
    },
    require => {
        need => '$test',
        code => \&_require
    },
    all => {
        need => '$value1 $value2',
        code => \&_all
    },
    any => {
        need => '$value1 $value2',
        code => \&_any
    },
    delay => {
        need => '$timeout:Num $callback',
        code => \&_delay
    },
    fetchObject => {
        need => '$address:Num',
        code => \&_fetchObject
    },
    activeObjectCount => {
        code => \&_activeObjectCount
    }
);

sub _say {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    say perl_string($arguments->{message});
    return $return;
}

sub _dump {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj     = $arguments->{value};
    my @parents = map $_->{proto_class}{name}, $obj->parents;
    my $type    = join(',', @parents);

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj), " = [ $type ] $obj\n";
    return $return;
}

sub _inspect {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj = $arguments->{value};

    my $str = perl_description($obj, perl_boolean($arguments->{ownOnly}));
    say $str unless $arguments->{quiet};

    $return->set_property(string => ferret_string($str));
    return $return;
}

sub _any {
    my (undef, $arguments) = @_;
    return ferret_boolean(any { perl_boolean($_) } values %$arguments);
}

sub _all {
    my (undef, $arguments) = @_;
    return ferret_boolean(all { perl_boolean($_) } values %$arguments);
}

sub _require {
    my (undef, $arguments) = @_;
    return Ferret::true if perl_boolean($arguments->{test});
    die; # FIXME: throw
}

sub _delay {
    my (undef, $arguments, $call_scope, $scope, $return) = @_;
    my ($num, $func) = @$arguments{'timeout', 'callback'};

    # load Timer and create a timer.
    my $timer_class = Ferret::space($num->f->core_context, 'Timer');
    my $timer = $timer_class->call({ delay => $num });

    # attach the callback.
    # the undef is $self, so it will fallback to $_self.
    FF::on($timer, 'expire', undef, $call_scope, $func);

    # start the timer.
    $timer->property('once')->call(undef, $call_scope);

    $return->set_property(timer => $timer);
    return $return;
}

sub _fetchObject {
    my (undef, $arguments, $call_scope) = @_;
    my $f = $call_scope->f;
    my $addr = perl_number($arguments->{address});
    return $f->{objects}{$addr} || Ferret::undefined;
}

sub _activeObjectCount {
    my (undef, undef, $call_scope) = @_;
    my $f = $call_scope->f;
    return ferret_number(scalar keys %{ $f->{objects} });
}

1
