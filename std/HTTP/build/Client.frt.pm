# === Document Model ===
#  Document './std/HTTP/Client.frt'
#      Package 'HTTP'
#      Class 'Client' version 1.0
#          Instruction
#              Assignment
#                  Lexical variable '$defaultUA'
#                  Operation
#                      String 'ferret-http/'
#                      Addition operator (+)
#                      Property 'version'
#                          Special variable '*class'
#          Instruction
#              Assignment
#                  Lexical variable '$defaultLength'
#                  Operation
#                      Number '64'
#                      Multiplication operator (*)
#                      Number '1024'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@userAgent'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              Lexical variable '$defaultUA'
#                  Instruction
#                      Want
#                          Instance variable '@timeout'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Number '10'
#                  Instruction
#                      Want
#                          Instance variable '@maxContentLength'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@readLength'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Lexical variable '$defaultLength'
#                  Instruction
#                      Want
#                          Instance variable '@writeLength'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Lexical variable '$defaultLength'
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
#                          Argument type
#                              Bareword 'Str'
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
#                          Argument type
#                              Bareword 'Str'
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
#                          Argument type
#                              Bareword 'HTTPMethod'
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Argument type
#                              Bareword 'Str'
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
#      Include (HTTP, HTTP::Request, HTTPMethod, NATIVE, NATIVE::HTTPClient, Num, Str)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

FF::before_content('Client.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'HTTP' );
    my $scope = $file_scope;
    FF::load_core('HTTP');

    # Class 'Client'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Client', 1.0, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'userAgent', 11.2,
                    $$scope->{'defaultUA'} );
                FF::want( $self, $args, 'timeout', 14.2, num( $f, "10" ) );
                FF::want( $self, $args, 'maxContentLength', 20.2 );
                FF::want( $self, $args, 'readLength', 23.2,
                    $$scope->{'defaultLength'} );
                FF::want( $self, $args, 'writeLength', 26.2,
                    $$scope->{'defaultLength'} );
                ${ $$scope->{'NATIVE::HTTPClient'} }->{'initialize'}->(
                    [ ${ $scope->{special} }->{'self'} ],
                    $scope, undef, 28.5
                );
                return $ret;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'url', 34.2 ) or return;
                return $ret_func->(
                    $$self->{'request'}->(
                        {
                            httpMethod => FF::get_symbol( $f, 'GET' ),
                            url        => $$scope->{'url'}
                        },
                        $scope, undef, 35.3
                    )
                );
                return $ret;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'url', 44.2 ) or return;
                return $ret_func->(
                    $$self->{'request'}->(
                        {
                            httpMethod => FF::get_symbol( $f, 'POST' ),
                            url        => $$scope->{'url'}
                        },
                        $scope, undef, 45.3
                    )
                );
                return $ret;
            }
        );

        # Method event 'request' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'request',
            [
                {
                    name     => 'httpMethod',
                    type     => 'HTTPMethod',
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'httpMethod', 56.2 ) or return;
                FF::need( $scope, $args, 'url',        59.2 ) or return;
                return $ret_func->(
                    $$scope->{'HTTP::Request'}->(
                        {
                            client     => ${ $scope->{special} }->{'self'},
                            httpMethod => $$scope->{'httpMethod'},
                            url        => $$scope->{'url'}
                        },
                        $scope, undef, 61.5
                    )
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( get  => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope( post => $scope, $proto, $class, undef, undef );
        $method_3->inside_scope(
            request => $scope,
            $proto, $class, undef, undef
        );
        FF::lex_assign(
            $scope,
            defaultUA => add(
                $scope,
                str( $f, "ferret-http/" ),
                ${ ${ $scope->{special} }->{'class'} }->{'version'}
            ),
            undef,
            5.2
        );
        FF::lex_assign(
            $scope,
            defaultLength => mul( $scope, num( $f, "64" ), num( $f, "1024" ) ),
            undef, 6.2
        );
    }
    FF::load_namespaces( $context,
        qw(HTTP HTTP::Request HTTPMethod NATIVE NATIVE::HTTPClient Num Str) );
};

FF::after_content();
