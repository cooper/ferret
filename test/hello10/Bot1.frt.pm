# === Document Model ===
#  Document './test/hello10/Bot1.frt'
#      Class 'Bot1'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@addr'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@user'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@port'
#                          Expression ('want' parameter)
#                              Number '6667'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Expression ('want' parameter)
#                              String 'Ferret IRC'
#                          Bareword 'Str'
#                  Instruction
#                      Assignment (instance variable '@sock')
#                          Call
#                              Bareword 'Socket::TCP'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'address'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                  On
#                      Expression ('on' parameter)
#                          Property 'connected'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'USER '
#                                                  Addition operator (+)
#                                                  Instance variable '@user'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' :'
#                                                  Addition operator (+)
#                                                  Instance variable '@real'
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'NICK '
#                                                  Addition operator (+)
#                                                  Instance variable '@nick'
#                  On
#                      Expression ('on' parameter)
#                          Property 'gotLine'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'recv: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
#          Method 'connect'
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Instance variable '@sock'
#                          Argument list [0 items]
#          Method 'send'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'send: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Property 'println'
#                              Instance variable '@sock'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#      Include (Num, Socket, Socket::TCP, Str)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('Bot1.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER " ),
                        $self->property_u('user'),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $self->property_u('real')
                    )
                ],
                $scope, undef,
                12.4895833333333
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef,
                13.5416666666667
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef,
                19.6770833333333
            );
            return $return;
        }
    );

    # Class 'Bot1'
    {
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Bot1', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
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
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'addr' ) or return;
                FF::need( $self, $arguments, 'nick' ) or return;
                FF::need( $self, $arguments, 'user' ) or return;
                do {
                    my $want_val = $arguments->{port};
                    $want_val ||= num( $f, 6667 );
                    $self->set_property( port => $want_val, 5.16666666666667 );
                };
                do {
                    my $want_val = $arguments->{real};
                    $want_val ||= str( $f, "Ferret IRC" );
                    $self->set_property( real => $want_val, 5.22916666666667 );
                };
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address => $self->property_u('addr'),
                            port    => $self->property_u('port')
                        },
                        $scope, undef,
                        9.35416666666667
                    ),
                    9.3125
                );
                FF::on(
                    $self->property_u('sock'),
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                FF::on(
                    $self->property_u('sock'),
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                return $return;
            }
        );

        # Method event 'connect' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $self->property_u('sock')->property_u('connect')
                  ->call_u( {}, $scope, undef, 25.78125 );
                return $return;
            }
        );

        # Method event 'send' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line' ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef,
                    30.8854166666667
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 31.9479166666667 );
                return $return;
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
        $method_2->inside_scope( send => $scope, $proto, $class, undef, undef );
    }
    FF::load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

FF::after_content();
