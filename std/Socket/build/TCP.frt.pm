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

use Ferret::Core::Conversion qw(pstring pnumber);

my @methods = (
    connect => {
        code => \&_connect
    },

    # connected callback
    connected => { },

    # disconnected callback
    disconnected => { },

    # read data callback
    gotData => {
        need => '$data:Str'
    },

    # read line callback
    gotLine => {
        need => '$data:Str'
    },

    # reached EOF callback
    eof => {
        need => '$remainder:Str'
    },

    # print method
    print => {
        code => \&_print,
        need => '$data:Str'
    },

    # print line method
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
    init_want => '$readMode:Sym',
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

# mode name to integer constant map
my %modes = (
    default => 0,
    line    => 1
);

# mode integer constant to subroutine handler map
my @modes = (
    \&_stream_on_read_default,  # 0 = read data as it fills the buffer
    \&_stream_on_read_line      # 1 = read data line-by-line
);

# this is passed $sock which is preinitialized. return value is ignored.
sub init {
    my ($sock, $arguments, $call_scope, $scope) = @_;
    $sock->set_property($_ => $arguments->{$_}) for qw(address port);

    # read mode.
    my $mode = 0;
    if (my $sym = $arguments->{readMode}) {
        $mode = $modes{ $sym->{sym_value} } or die; # FIXME
    }
    $sock->{read_mode} = $mode;

}

###############
### METHODS ###
###############

sub _connect {
    my ($sock, $arguments, $call_scope, $scope, $return) = @_;
    require IO::Socket::IP;
    require IO::Async::Stream;

    # create a connection.
    my $conn = IO::Socket::IP->new(
        PeerHost => pstring($sock->property('address')),
        PeerPort => pnumber($sock->property('port')),
        Type     => Socket::SOCK_STREAM()
    ) or return;

    # create a stream.
    my $stream = $sock->{stream} = IO::Async::Stream->new(
        handle         => $conn,
        encoding       => 'utf8',
        on_read        => sub { _stream_on_read($sock, @_) },
        on_read_error  => sub { _disconnected(  $sock, @_) }, # TODO: errors
        on_write_error => sub { _disconnected(  $sock, @_) }
    );
    Ferret::add_notifier($stream);

    # call connected event.
    $sock->property('connected')->call;

    return $return;
}

sub print {
    my ($sock, $arguments, $call_scope, $scope, $return) = @_;
    my $data = $arguments->pstring('data');
    $sock->{stream}->write($data);
    return $return;
}

sub println {
    my ($sock, $arguments, $call_scope, $scope, $return) = @_;
    my $line = $arguments->pstring('data');
    $sock->{stream}->write("$line\n");
    return $return;
}

###########################
### IO::ASYNC CALLBACKS ###
###########################

sub _stream_on_read {
    my ($sock, $stream, $buffer, $eof) = @_;
    my $code = $modes[ $sock->{read_mode} ] or return;
    $code->(@_);
}

sub _stream_on_read_default {
    my ($sock, $stream, $buffer, $eof) = @_;

    # handle lines.
    while ($$buffer =~ s/.+//) {
        my $str = Ferret::String->new($sock->f, str_value => $1);
        $sock->call_prop(gotData => { data => $str });
    }

    return unless $eof;
    $sock->property('eof')->call;
    $sock->_disconnected;
}

sub _stream_on_read_line {
    my ($sock, $stream, $buffer, $eof) = @_;

    # handle lines.
    while ($$buffer =~ s/^(.*)\n//) {
        (my $val = $1) =~ s/\0|\r//g;
        my $str = Ferret::String->new($sock->f, str_value => $val);
        $sock->call_prop(gotLine => { data => $str });
    }

    # reached EOF. at this point, $$buffer is a partial line
    return unless $eof;
    $sock->call_prop(eof => { remainder => $$buffer });
    $sock->_disconnected;

}

# generic disconnect. may be EOF, any type of error, etc.
sub _disconnected {
    my $sock = shift;
    return if $sock->{disconnected}++;
    delete $sock->{stream};
    $sock->property('disconnected')->call;
}

1
