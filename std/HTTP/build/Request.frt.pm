# === Document Model ===
#  Document './std/HTTP/Request.frt'
#      Package 'HTTP'
#      Class 'Request'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$client'
#                          Argument type
#                              Bareword 'Client'
#                  Instruction
#                      Assignment (instance variable '@client')
#                          Lexical variable '$client'
#                  Instruction
#                      Weaken modifier
#                          Instance variable '@client'
#                  Instruction
#                      Need
#                          Instance variable '@url'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@httpMethod'
#                          Argument type
#                              Bareword 'HTTPMethod'
#          Method 'connect'
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Bareword 'NATIVE::HTTPClient'
#                          Argument list [2 items]
#                              Item 0
#                                  Instance variable '@client'
#                              Item 1
#                                  Special variable '*self'
#          Method 'connected'
#              Body ('method' scope)
#          Method 'redirect'
#              Body ('method' scope)
#          Method 'error'
#              Body ('method' scope)
#          Method 'response'
#              Body ('method' scope)
#      Include (Client, HTTPMethod, NATIVE, NATIVE::HTTPClient, Str)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Request.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'HTTP' );
    FF::load_core('HTTP');

    # Class 'Request'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Request', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'client',
                    type     => 'Client',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'url',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'httpMethod',
                    type     => 'HTTPMethod',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'client', 7.2 ) or return;
                $self->set_property(
                    client => $scope->property_u('client'),
                    8.2
                );
                $self->weaken_property( 'client', 9.1 );
                FF::need( $self, $args, 'url' )        or return;
                FF::need( $self, $args, 'httpMethod' ) or return;
                return $ret->return;
            }
        );

        # Method event 'connect' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                $scope->property_u('NATIVE::HTTPClient')->property_u('connect')
                  ->call_u(
                    [
                        $self->property_u('client'),
                        $scope->{special}->property_u('self')
                    ],
                    $scope, undef, 17.25
                  );
                return $ret->return;
            }
        );

        # Method event 'connected' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'connected',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;

                return $ret->return;
            }
        );

        # Method event 'redirect' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'redirect',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;

                return $ret->return;
            }
        );

        # Method event 'error' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'error',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;

                return $ret->return;
            }
        );

        # Method event 'response' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'response',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;

                return $ret->return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            connect => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            connected => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            redirect => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            error => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            response => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context,
        qw(Client HTTPMethod NATIVE NATIVE::HTTPClient Str) );
};

FF::after_content();
