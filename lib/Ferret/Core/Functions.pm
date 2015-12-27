# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;


use Ferret::Core::Conversion qw(
    pstring         fstring
    pbool        fbool
    pnumber         fnumber
    pdescription
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
        want => '$ownOnly:Bool',
        code => \&_inspect
    },
    require => {
        need => '$test',
        code => \&_require
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
    },
    _exit => {
        want => '$status:Num',
        code => \&_exit
    }
);

sub _say {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    say $args->pstring('message');
    return $ret;
}

sub _dump {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    my $obj     = $args->{value};
    my @parents = map $_->{proto_class}{name}, $obj->parents;
    my $type    = join(',', @parents);

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj), " = [ $type ] $obj\n";
    return $ret;
}

sub _inspect {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    my $obj = $args->{value};

    my $str = pdescription($obj, $args->pbool('ownOnly'));
    say $str unless $args->pbool('quiet');

    $ret->set_property(string => fstring($str));
    return $ret;
}

sub _require {
    my (undef, $args) = @_;
    return Ferret::true if $args->pbool('test');
    die; # FIXME: throw
}

sub _delay {
    my (undef, $args, $call_scope, $scope, $ret) = @_;
    my ($num, $func) = @$args{'timeout', 'callback'};

    # load Timer and create a timer.
    my $timer_class = Ferret::space($num->f->core_context, [caller], 'Timer');
    my $timer = $timer_class->call({ delay => $num });

    # attach the callback.
    # the undef is $self, so it will fallback to $_self.
    FF::on($timer, 'expire', undef, $call_scope, $func);

    # start the timer.
    $timer->call_prop(once => undef, $call_scope);

    $ret->set_property(timer => $timer);
    return $ret;
}

sub _fetchObject {
    my (undef, $args, $call_scope) = @_;
    my $f = $call_scope->f;
    my $addr = $args->pnumber('address');
    return $f->{objects}{$addr} || Ferret::undefined;
}

sub _activeObjectCount {
    my (undef, undef, $call_scope) = @_;
    my $f = $call_scope->f;
    return fnumber(scalar keys %{ $f->{objects} });
}

# this is temporary, until *process.exit() exists
sub _exit {
    my (undef, $args) = @_;
    my $status = $args->pnumber('status', 0);
    exit $status;
}

1
