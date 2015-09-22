# Copyright (c) 2015, Mitchell Cooper
#
# Eventually this will inherit from "Socket"
# that doesn't exist yet though
#
package Ferret::Socket::TCP;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @methods = (
    connect => {
        code => \&_connect
    },
    connected => {
        code => sub { }
    },
    gotLine => {
        code => sub { },
        need => '$data:Str'
    },
    println => {
        code => \&println,
        need => '$data:Str'
    }
);

Ferret::bind_class(
    package   => 'Socket',
    name      => 'TCP',
    init      => \&init,
    init_need => '$address:Str $port:Num',
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

# this is passed $sock which is preinitialized. return value is ignored.
sub init {
    my ($sock, $arguments, $from_scope, $scope) = @_;
    $sock->set_property($_ => $arguments->{$_}) for qw(address port);
}

sub _connect {
    my ($sock, $arguments, $from_scope, $scope, $return) = @_;
    require IO::Socket::IP;
    require IO::Async::Stream;

    # create a connection.
    my $conn = IO::Socket::IP->new(
        PeerHost => $sock->property('address')->{value},
        PeerPort => $sock->property('port')->{value},
        Type     => Socket::SOCK_STREAM()
    ) or return;

    # create a stream.
    my $stream = $sock->{stream} = IO::Async::Stream->new(
        handle => $conn,
        on_read => sub {
            my ($self, $buffer, $eof) = @_;
            while ($$buffer =~ s/^(.*)\n//) {
                (my $val = $1) =~ s/\0|\r//g;
                my $str = Ferret::String->new($sock->ferret, value => $val);
                $sock->property('gotLine')->call([ $str ]);
            }
        }
    );
    Ferret::add_notifier($stream);

    # call connected event.
    $sock->property('connected')->call;

    return $return;
}

sub println {
    my ($sock, $arguments, $from_scope, $scope, $return) = @_;
    my $line = $arguments->{data}{value};
    $sock->{stream}->write("$line\n");
}

1
