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

use Ferret::Core::Conversion qw(perl_string perl_number);

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
    my ($sock, $arguments, $call_scope, $scope) = @_;
    $sock->set_property($_ => $arguments->{$_}) for qw(address port);
}

sub _connect {
    my ($sock, $arguments, $call_scope, $scope, $return) = @_;
    require IO::Socket::IP;
    require IO::Async::Stream;

    # create a connection.
    my $conn = IO::Socket::IP->new(
        PeerHost => perl_string($sock->property('address')),
        PeerPort => perl_number($sock->property('port')),
        Type     => Socket::SOCK_STREAM()
    ) or return;

    # create a stream.
    my $stream = $sock->{stream} = IO::Async::Stream->new(
        handle   => $conn,
        encoding => 'utf8',
        on_read  => sub {
            my ($self, $buffer, $eof) = @_;
            while ($$buffer =~ s/^(.*)\n//) {
                (my $val = $1) =~ s/\0|\r//g;
                my $str = Ferret::String->new($sock->f, str_value => $val);
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
    my ($sock, $arguments, $call_scope, $scope, $return) = @_;
    my $line = perl_string($arguments->{data});
    $sock->{stream}->write("$line\n");
}

1
