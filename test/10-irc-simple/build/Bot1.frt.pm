# === Document Model ===
#  File './test/10-irc-simple/Bot1.frt'
#      Package 'main'
#          Class 'Bot1'
#              Class method 'initializer__' { $addr:Str $nick:Str $user:Str ?$port:Num ?$real:Str }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@addr'
#                              Argument type
#                                  Bareword 'Str'
#                      Instruction
#                          Need
#                              Instance variable '@nick'
#                              Argument type
#                                  Bareword 'Str'
#                      Instruction
#                          Need
#                              Instance variable '@user'
#                              Argument type
#                                  Bareword 'Str'
#                      Instruction
#                          Want
#                              Instance variable '@port'
#                              Argument type
#                                  Bareword 'Num'
#                              Argument value
#                                  Number '6667'
#                      Instruction
#                          Want
#                              Instance variable '@real'
#                              Argument type
#                                  Bareword 'Str'
#                              Argument value
#                                  String 'Ferret IRC'
#                      Instruction
#                          Assignment
#                              Instance variable '@sock'
#                              Call
#                                  Bareword 'Socket::TCP'
#                                  Named argument list [3 items]
#                                      Item 0
#                                          Pair 'address'
#                                              Instance variable '@addr'
#                                      Item 1
#                                          Pair 'port'
#                                              Instance variable '@port'
#                                      Item 2
#                                          Pair 'readMode'
#                                              Symbol :line
#                      On
#                          Expression ('on' parameter)
#                              Property 'connected'
#                                  Instance variable '@sock'
#                          Anonymous function
#                              Function body
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Operation
#                                                      String 'USER '
#                                                      Addition operator (+)
#                                                      Instance variable '@user'
#                                                      Addition operator (+)
#                                                      String ' '
#                                                      Addition operator (+)
#                                                      String '*'
#                                                      Addition operator (+)
#                                                      String ' '
#                                                      Addition operator (+)
#                                                      String '*'
#                                                      Addition operator (+)
#                                                      String ' :'
#                                                      Addition operator (+)
#                                                      Instance variable '@real'
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Operation
#                                                      String 'NICK '
#                                                      Addition operator (+)
#                                                      Instance variable '@nick'
#                      On
#                          Expression ('on' parameter)
#                              Property 'gotLine'
#                                  Instance variable '@sock'
#                          Anonymous function { $data }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$data'
#                                  Instruction
#                                      Call
#                                          Bareword 'say'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Operation
#                                                      String 'recv: '
#                                                      Addition operator (+)
#                                                      Lexical variable '$data'
#              Method 'connect'
#                  Function body
#                      Instruction
#                          Call
#                              Property 'connect'
#                                  Instance variable '@sock'
#                              Argument list [0 items]
#              Method 'send' { $line }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$line'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'send: '
#                                          Addition operator (+)
#                                          Lexical variable '$line'
#                      Instruction
#                          Call
#                              Property 'println'
#                                  Instance variable '@sock'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$line'
#          Include (Num, Socket::TCP, Str)
package FF;

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
use Ferret::Core::Operations qw(add num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'Bot1.frt', './test/10-irc-simple/Bot1.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        $pos->(12.13333),
                        str( $f, "USER " ),
                        $$self->{'user'},
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $$self->{'real'}
                    )
                ],
                $scope, undef,
                $pos->(12.06667)
            );
            $$self->{'send'}->(
                [
                    add(
                        $scope, $pos->(13.4),
                        str( $f, "NICK " ), $$self->{'nick'}
                    )
                ],
                $scope, undef,
                $pos->(13.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'data', 18.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(19.4),
                        str( $f, "recv: " ), $$scope->{'data'}
                    )
                ],
                $scope, undef,
                $pos->(19.2)
            );
            return $ret;
        }
    );

    # Class 'Bot1'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Bot1', undef, undef );

        # Method event 'initializer__' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'addr',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'user',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                { name => 'port', type => 'Num', optional => 1, more => undef },
                { name => 'real', type => 'Str', optional => 1, more => undef }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'addr' ) || return $ret_func->();
                need( $self, $args, 'nick' ) || return $ret_func->();
                need( $self, $args, 'user' ) || return $ret_func->();
                want( $self, $args, 'port', 5.1, num( $f, "6667" ) );
                want( $self, $args, 'real', 5.4, str( $f, "Ferret IRC" ) );
                $self->set_property(
                    sock => $$scope->{'Socket::TCP'}->(
                        [
                            undef,
                            [
                                address  => $$self->{'addr'},
                                port     => $$self->{'port'},
                                readMode => get_symbol( $f, 'line' )
                            ]
                        ],
                        $scope, undef,
                        $pos->(8.3)
                    ),
                    $pos->(8.1)
                );
                on(
                    $$self->{'sock'},
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $$self->{'sock'},
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'connect',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $$self->{'sock'}->property_u( 'connect', $pos->(25.2) )
                  ->( [ undef, [] ], $scope, undef, $pos->(25.3) );
                return $ret;
            }
        );

        # Method event 'send' definition
        my $func_4 = method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'line', 29.2 ) || return $ret_func->();
                $$scope->{'say'}->(
                    [
                        add(
                            $scope, $pos->(30.4),
                            str( $f, "send: " ), $$scope->{'line'}
                        )
                    ],
                    $scope, undef,
                    $pos->(30.2)
                );
                $$self->{'sock'}->property_u( 'println', $pos->(31.2) )
                  ->( [ $$scope->{'line'} ], $scope, undef, $pos->(31.3) );
                return $ret;
            }
        );
        $func_2->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            send => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    provides_namespaces( $context, $file_name, qw(Bot1) );
    load_namespaces( $context, $file_name, qw(Num Socket::TCP Str) );
};

after_content($file_name);
