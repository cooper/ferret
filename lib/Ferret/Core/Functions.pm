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
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    say $arguments->pstring('message');
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

    my $str = pdescription($obj, $arguments->pbool('ownOnly'));
    say $str unless $arguments->pbool('quiet');

    $return->set_property(string => fstring($str));
    return $return;
}

sub _require {
    my (undef, $arguments) = @_;
    return Ferret::true if $arguments->pbool('test');
    die; # FIXME: throw
}

sub _delay {
    my (undef, $arguments, $call_scope, $scope, $return) = @_;
    my ($num, $func) = @$arguments{'timeout', 'callback'};

    # load Timer and create a timer.
    my $timer_class = Ferret::space($num->f->core_context, [caller], 'Timer');
    my $timer = $timer_class->call({ delay => $num });

    # attach the callback.
    # the undef is $self, so it will fallback to $_self.
    FF::on($timer, 'expire', undef, $call_scope, $func);

    # start the timer.
    $timer->call_prop(once => undef, $call_scope);

    $return->set_property(timer => $timer);
    return $return;
}

sub _fetchObject {
    my (undef, $arguments, $call_scope) = @_;
    my $f = $call_scope->f;
    my $addr = $arguments->pnumber('address');
    return $f->{objects}{$addr} || Ferret::undefined;
}

sub _activeObjectCount {
    my (undef, undef, $call_scope) = @_;
    my $f = $call_scope->f;
    return fnumber(scalar keys %{ $f->{objects} });
}

# this is temporary, until *process.exit() exists
sub _exit {
    my (undef, $arguments) = @_;
    my $status = $arguments->pnumber('status', 0);
    exit $status;
}

1
