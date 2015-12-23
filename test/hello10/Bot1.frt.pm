# === Tokenization ===
#       CLASS_DEC |                {"name":"Bot1"} | 1.1
#          METHOD |     {"main":1,"name":"_init_"} | 3.1
#       CLOSURE_S |                                | 3.2
#    KEYWORD_NEED |                                | 4.05
#        VAR_THIS |                         "addr" | 4.1
#        OP_VALUE |                                | 4.15
#        BAREWORD |                          "Str" | 4.2
#        OP_COMMA |                                | 4.25
#        VAR_THIS |                         "nick" | 4.3
#        OP_VALUE |                                | 4.35
#        BAREWORD |                          "Str" | 4.4
#        OP_COMMA |                                | 4.45
#        VAR_THIS |                         "user" | 4.5
#        OP_VALUE |                                | 4.55
#        BAREWORD |                          "Str" | 4.6
#         OP_SEMI |                              1 | 4.65
#    KEYWORD_WANT |                                | 5.05
#        VAR_THIS |                         "port" | 5.1
#        OP_VALUE |                                | 5.15
#        BAREWORD |                          "Num" | 5.2
#       OP_ASSIGN |                                | 5.25
#          NUMBER |                         "6667" | 5.3
#        OP_COMMA |                                | 5.35
#        VAR_THIS |                         "real" | 5.4
#        OP_VALUE |                                | 5.45
#        BAREWORD |                          "Str" | 5.5
#       OP_ASSIGN |                                | 5.55
#          STRING |                 ["Ferret IRC"] | 5.6
#         OP_SEMI |                              1 | 5.65
#        VAR_THIS |                         "sock" | 8.05
#       OP_ASSIGN |                                | 8.1
#        BAREWORD |                       "Socket" | 8.15
#         OP_PACK |                                | 8.2
#        BAREWORD |                          "TCP" | 8.25
#      PAREN_CALL |                                | 8.3
#      PROP_VALUE |                      "address" | 8.35
#        VAR_THIS |                         "addr" | 8.4
#        OP_COMMA |                                | 8.45
#      PROP_VALUE |                         "port" | 8.5
#        VAR_THIS |                         "port" | 8.55
#        OP_COMMA |                                | 8.6
#      PROP_VALUE |                     "readMode" | 8.65
#         VAR_SYM |                         "line" | 8.7
#         PAREN_E |                                | 8.75
#         OP_SEMI |                              1 | 8.8
#      KEYWORD_ON |                                | 11.1
#        VAR_THIS |                         "sock" | 11.2
#        PROPERTY |                    "connected" | 11.3
#       CLOSURE_S |                                | 11.4
#        VAR_THIS |                         "send" | 12.1
#      PAREN_CALL |                                | 12.2
#          STRING | ["USER ",["VAR_THIS","user",12]," ","*"," ","*"," :",["VAR_THIS","real",12]] | 12.3
#         PAREN_E |                                | 12.4
#         OP_SEMI |                              1 | 12.5
#        VAR_THIS |                         "send" | 13.1
#      PAREN_CALL |                                | 13.2
#          STRING | ["NICK ",["VAR_THIS","nick",13]] | 13.3
#         PAREN_E |                                | 13.4
#         OP_SEMI |                              1 | 13.5
#       CLOSURE_E |                                | 14.1
#      KEYWORD_ON |                                | 17.1
#        VAR_THIS |                         "sock" | 17.2
#        PROPERTY |                      "gotLine" | 17.3
#       CLOSURE_S |                                | 17.4
#    KEYWORD_NEED |                                | 18.1
#         VAR_LEX |                         "data" | 18.2
#         OP_SEMI |                              1 | 18.3
#        BAREWORD |                          "say" | 19.1
#      PAREN_CALL |                                | 19.2
#          STRING | ["recv: ",["VAR_LEX","data",19]] | 19.3
#         PAREN_E |                                | 19.4
#         OP_SEMI |                              1 | 19.5
#       CLOSURE_E |                                | 20.1
#       CLOSURE_E |                                | 22.1
#          METHOD |             {"name":"connect"} | 24.1
#       CLOSURE_S |                                | 24.2
#        VAR_THIS |                         "sock" | 25.1
#        PROPERTY |                      "connect" | 25.2
#      PAREN_CALL |                                | 25.3
#         PAREN_E |                                | 25.4
#         OP_SEMI |                              1 | 25.5
#       CLOSURE_E |                                | 26.1
#          METHOD |                {"name":"send"} | 28.1
#       CLOSURE_S |                                | 28.2
#    KEYWORD_NEED |                                | 29.1
#         VAR_LEX |                         "line" | 29.2
#         OP_SEMI |                              1 | 29.3
#        BAREWORD |                          "say" | 30.1
#      PAREN_CALL |                                | 30.2
#          STRING | ["send: ",["VAR_LEX","line",30]] | 30.3
#         PAREN_E |                                | 30.4
#         OP_SEMI |                              1 | 30.5
#        VAR_THIS |                         "sock" | 31.1
#        PROPERTY |                      "println" | 31.2
#      PAREN_CALL |                                | 31.3
#         VAR_LEX |                         "line" | 31.4
#         PAREN_E |                                | 31.5
#         OP_SEMI |                              1 | 31.6
#       CLOSURE_E |                                | 32.1
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
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'address'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                                  Item 2
#                                      Pair 'readMode'
#                                          Symbol :line
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

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
                $scope, undef, 12.2
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 13.2
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
            FF::need( $scope, $arguments, 'data', 18.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 19.2
            );
            return $return;
        }
    );

    # Class 'Bot1'
    {
        my ( $class, $self, $proto, $scope ) =
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
                FF::want( $self, $arguments, 'port', 5.1, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'real', 5.4,
                    str( $f, "Ferret IRC" ) );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address  => $self->property_u('addr'),
                            port     => $self->property_u('port'),
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 8.3
                    ),
                    8.1
                );
                FF::on(
                    $self->property_u('sock'),
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self->property_u('sock'),
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
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
                  ->call_u( {}, $scope, undef, 25.3 );
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
                FF::need( $scope, $arguments, 'line', 29.2 ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef, 30.2
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 31.3 );
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
