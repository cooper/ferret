# === Document Model ===
#  Document './std/HTTP/Client.frt'
#      Package 'HTTP'
#      Class 'Client'
#          Instruction
#              Assignment (lexical variable '$defaultUA')
#                  Operation
#                      String 'ferret-http/'
#                      Addition operator (+)
#                      Property 'version'
#                          Special variable '*class'
#          Instruction
#              Assignment (lexical variable '$defaultLength')
#                  Operation
#                      Number '64'
#                      Multiplication operator (*)
#                      Number '1024'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@userAgent'
#                          Expression ('want' parameter)
#                              Lexical variable '$defaultUA'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@timeout'
#                          Expression ('want' parameter)
#                              Number '10'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@maxContentLength'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@readLength'
#                          Expression ('want' parameter)
#                              Lexical variable '$defaultLength'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@writeLength'
#                          Expression ('want' parameter)
#                              Lexical variable '$defaultLength'
#                          Bareword 'Num'
#                  Instruction
#                      Call
#                          Property 'initialize'
#                              Bareword 'NATIVE::HTTPClient'
#                          Argument list [1 items]
#                              Item 0
#                                  Special variable '*self'
#          Method 'get'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@request'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'httpMethod'
#                                          Symbol :GET
#                                  Item 1
#                                      Pair 'url'
#                                          Lexical variable '$url'
#          Method 'post'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@request'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'httpMethod'
#                                          Symbol :POST
#                                  Item 1
#                                      Pair 'url'
#                                          Lexical variable '$url'
#          Method 'request'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$httpMethod'
#                          Bareword 'Sym'
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'HTTP::Request'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'client'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'httpMethod'
#                                          Lexical variable '$httpMethod'
#                                  Item 2
#                                      Pair 'url'
#                                          Lexical variable '$url'
#      Include (HTTP, HTTP::Request, NATIVE, NATIVE::HTTPClient, Num, Str, Sym)
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

FF::before_content('Client.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'HTTP' );
    FF::load_core('HTTP');

    # Class 'Client'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Client', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'userAgent',
                    type     => 'Str',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'timeout',
                    type     => 'Num',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'maxContentLength',
                    type     => 'Num',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'readLength',
                    type     => 'Num',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'writeLength',
                    type     => 'Num',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $self, $arguments, 'userAgent', 10.2,
                    $scope->property_u('defaultUA') );
                FF::want( $self, $arguments, 'timeout', 13.2, num( $f, 10 ) );
                FF::want( $self, $arguments, 'maxContentLength', 19.2 );
                FF::want( $self, $arguments, 'readLength', 22.2,
                    $scope->property_u('defaultLength') );
                FF::want( $self, $arguments, 'writeLength', 23.2,
                    $scope->property_u('defaultLength') );
                $scope->property_u('NATIVE::HTTPClient')
                  ->property_u('initialize')
                  ->call_u( [ $scope->{special}->property_u('self') ],
                    $scope, undef, 25.5 );
                return $return;
            }
        );

        # Method event 'get' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'get',
            [
                {
                    name     => 'url',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'url', 29.2 ) or return;
                return $self->property_u('request')->call_u(
                    {
                        httpMethod => FF::get_symbol( $f, 'GET' ),
                        url        => $scope->property_u('url')
                    },
                    $scope, undef, 30.3
                );
                return $return;
            }
        );

        # Method event 'post' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'post',
            [
                {
                    name     => 'url',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'url', 37.2 ) or return;
                return $self->property_u('request')->call_u(
                    {
                        httpMethod => FF::get_symbol( $f, 'POST' ),
                        url        => $scope->property_u('url')
                    },
                    $scope, undef, 38.3
                );
                return $return;
            }
        );

        # Method event 'request' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'request',
            [
                {
                    name     => 'httpMethod',
                    type     => 'Sym',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'url',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'httpMethod', 45.1 ) or return;
                FF::need( $scope, $arguments, 'url',        45.3 ) or return;
                return $scope->property_u('HTTP::Request')->call_u(
                    {
                        client     => $scope->{special}->property_u('self'),
                        httpMethod => $scope->property_u('httpMethod'),
                        url        => $scope->property_u('url')
                    },
                    $scope, undef, 46.5
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( get  => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope( post => $scope, $proto, $class, undef, undef );
        $method_3->inside_scope(
            request => $scope,
            $proto, $class, undef, undef
        );
        $class->set_property_ow(
            $context,
            defaultUA => add(
                $scope,
                str( $f, "ferret-http/" ),
                $scope->{special}->property_u('class')->property_u('version')
            ),
            4.2
        );
        $class->set_property_ow(
            $context,
            defaultLength => mul( $scope, num( $f, 64 ), num( $f, 1024 ) ),
            5.2
        );
    }
    FF::load_namespaces( $context,
        qw(HTTP HTTP::Request NATIVE NATIVE::HTTPClient Num Str Sym) );
};

FF::after_content();
