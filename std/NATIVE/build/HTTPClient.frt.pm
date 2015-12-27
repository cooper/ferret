# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::HTTPClient;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(pstring pnumber fstring);

my @functions = (
    initialize => {
        need => '$client',
        code => \&_initialize
    },
    connect => {
        need => '$client $request',
        code => \&_connect
    }
);

Ferret::bind_class(
    package   => 'NATIVE',
    name      => 'HTTPClient',
    functions => \@functions
);

*new = *Ferret::bind_constructor;

sub _initialize {
    my (undef, $arguments) = @_;
    my $client = $arguments->{client} or return;
    require Net::Async::HTTP;

    my $http = Net::Async::HTTP->new(
        user_agent   => pstring($client->property('userAgent')),
        timeout      => pstring($client->property('timeout')),
        read_len     => pnumber($client->property('readLength')),
        write_len    => pnumber($client->property('writeLength')),
        max_connections_per_host => 5
    );

    $client->{http} = $http;

    return;
}

sub _connect {
    my (undef, $arguments) = @_;
    my $client  = $arguments->{client}  or return;
    my $request = $arguments->{request} or return;
    my $http    = $client->{http}       or return;

    increase_count($http);
    $http->do_request(
        uri         => pstring($request->property('url')),
        method      => pstring($request->property('method')) eq ':POST' ?
                       'POST' : 'GET', # TODO: other methods
        on_ready    => sub {    _ready($client, $request, @_) },
        on_redirect => sub { _redirect($client, $request, @_) },
        # on_body_write
        #on_header
        on_response => sub { _response($client, $request, @_) },
        on_error    => sub {    _error($client, $request, @_) },
    );

    return;
}

sub _ready {
    my ($client, $request) = @_;
    $request->property('connected')->call;
    return Future->done;
}

sub _redirect {
    my ($client, $request, $response, $url_string) = @_;
    $request->property('redirect')->call({
        location => fstring($url_string)
    });
}

sub _response {
    my ($client, $request, $response) = @_;
    $request->property('response')->call({
        # TODO: response object in Ferret
        content => fstring($response->as_string)
    });

    decrease_count($client->{http});
}

sub _error {
    my ($client, $request, $err) = @_;
    $request->property('error')->call({
        # TODO: error object in Ferret
    });
    decrease_count($client->{http});
}

# increase active connection count.
# add too loop if necessary.
sub increase_count {
    my $http = shift;
    Ferret::add_notifier($http) if ++$http->{_connection_count} == 1;
}

# decrease active connection count.
# remove from loop if necessary.
sub decrease_count {
    my $http = shift;
    Ferret::remove_notifier($http) if !--$http->{_connection_count};
}

1
