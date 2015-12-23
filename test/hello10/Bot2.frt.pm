# === Tokenization ===
#       CLASS_DEC |                {"name":"Bot2"} | 1.5
#          METHOD |     {"name":"_init_","main":1} | 3.33333
#       CLOSURE_S |                                | 3.66667
#    KEYWORD_NEED |                                | 4.07143
#        VAR_THIS |                      "address" | 4.14286
#        OP_VALUE |                                | 4.21429
#        BAREWORD |                          "Str" | 4.28571
#        OP_COMMA |                                | 4.35714
#        VAR_THIS |                         "nick" | 4.42857
#        OP_VALUE |                                | 4.5
#        BAREWORD |                          "Str" | 4.57143
#        OP_COMMA |                                | 4.64286
#        VAR_THIS |                         "user" | 4.71429
#        OP_VALUE |                                | 4.78571
#        BAREWORD |                          "Str" | 4.85714
#         OP_SEMI |                                | 4.92857
#    KEYWORD_WANT |                                | 5.07143
#        VAR_THIS |                         "port" | 5.14286
#        OP_VALUE |                                | 5.21429
#        BAREWORD |                          "Num" | 5.28571
#       OP_ASSIGN |                                | 5.35714
#          NUMBER |                         "6667" | 5.42857
#        OP_COMMA |                                | 5.5
#        VAR_THIS |                         "real" | 5.57143
#        OP_VALUE |                                | 5.64286
#        BAREWORD |                          "Str" | 5.71429
#       OP_ASSIGN |                                | 5.78571
#          STRING |                 ["Ferret IRC"] | 5.85714
#         OP_SEMI |                                | 5.92857
#        BAREWORD |                       "Socket" | 8.0625
#         OP_PACK |                                | 8.125
#        BAREWORD |                          "TCP" | 8.1875
#        PROPERTY |                         "init" | 8.25
#      PAREN_CALL |                                | 8.3125
#        VAR_SPEC |                         "self" | 8.375
#         PAREN_E |                                | 8.4375
#      PAREN_CALL |                                | 8.5
#      PROP_VALUE |                         "addr" | 8.5625
#        VAR_THIS |                      "address" | 8.625
#        OP_COMMA |                                | 8.6875
#      PROP_VALUE |                         "port" | 8.75
#        VAR_THIS |                         "port" | 8.8125
#         PAREN_E |                                | 8.875
#         OP_SEMI |                                | 8.9375
#        VAR_THIS |                         "send" | 10.2
#       OP_ASSIGN |                                | 10.4
#        VAR_THIS |                      "println" | 10.6
#         OP_SEMI |                                | 10.8
#      KEYWORD_ON |                                | 13.25
#        VAR_THIS |                    "connected" | 13.5
#       CLOSURE_S |                                | 13.75
#        VAR_THIS |                         "send" | 14.16667
#      PAREN_CALL |                                | 14.33333
#          STRING | ["USER ",["VAR_THIS","user",14]," ","*"," ","*"," :",["VAR_THIS","real",14]] | 14.5
#         PAREN_E |                                | 14.66667
#         OP_SEMI |                                | 14.83333
#        VAR_THIS |                         "send" | 15.16667
#      PAREN_CALL |                                | 15.33333
#          STRING | ["NICK ",["VAR_THIS","nick",15]] | 15.5
#         PAREN_E |                                | 15.66667
#         OP_SEMI |                                | 15.83333
#       CLOSURE_E |                                | 16.5
#      KEYWORD_ON |                                | 19.25
#        VAR_THIS |                      "gotLine" | 19.5
#       CLOSURE_S |                                | 19.75
#    KEYWORD_NEED |                                | 20.25
#         VAR_LEX |                         "data" | 20.5
#         OP_SEMI |                                | 20.75
#        BAREWORD |                          "say" | 21.16667
#      PAREN_CALL |                                | 21.33333
#          STRING | ["recv: ",["VAR_LEX","data",21]] | 21.5
#         PAREN_E |                                | 21.66667
#         OP_SEMI |                                | 21.83333
#       CLOSURE_E |                                | 22.5
#      KEYWORD_ON |                                | 24.25
#        VAR_THIS |                      "println" | 24.5
#       CLOSURE_S |                                | 24.75
#    KEYWORD_NEED |                                | 25.25
#         VAR_LEX |                         "data" | 25.5
#         OP_SEMI |                                | 25.75
#        BAREWORD |                          "say" | 26.16667
#      PAREN_CALL |                                | 26.33333
#          STRING | ["send: ",["VAR_LEX","data",26]] | 26.5
#         PAREN_E |                                | 26.66667
#         OP_SEMI |                                | 26.83333
#       CLOSURE_E |                                | 27.5
#       CLOSURE_E |                                | 29.5
# === Document Model ===
#  Document './test/hello10/Bot2.frt'
#      Class 'Bot2'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@address'
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
#                      Call
#                          Call
#                              Property 'init'
#                                  Bareword 'Socket::TCP'
#                              Argument list [1 items]
#                                  Item 0
#                                      Special variable '*self'
#                          Named argument list [2 items]
#                              Item 0
#                                  Pair 'addr'
#                                      Instance variable '@address'
#                              Item 1
#                                  Pair 'port'
#                                      Instance variable '@port'
#                  Instruction
#                      Assignment (instance variable '@send')
#                          Instance variable '@println'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@connected'
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
#                          Instance variable '@gotLine'
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
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@println'
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
#                                                  String 'send: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
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

FF::before_content('Bot2.frt');

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
                $scope, undef, 14.33333
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 15.33333
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
            FF::need( $scope, $arguments, 'data', 20.5 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 21.33333
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data', 25.5 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 26.33333
            );
            return $return;
        }
    );

    # Class 'Bot2'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Bot2', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'address',
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
                FF::need( $self, $arguments, 'address' ) or return;
                FF::need( $self, $arguments, 'nick' )    or return;
                FF::need( $self, $arguments, 'user' )    or return;
                FF::want( $self, $arguments, 'port', 5.14286, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'real', 5.57143,
                    str( $f, "Ferret IRC" ) );
                $scope->property_u('Socket::TCP')->property_u('init')
                  ->call_u( [ $scope->{special}->property_u('self') ],
                    $scope, undef, 8.3125 )->call_u(
                    {
                        addr => $self->property_u('address'),
                        port => $self->property_u('port')
                    },
                    $scope, undef, 8.5
                    );
                $self->set_property(
                    send => $self->property_u('println'),
                    10.4
                );
                FF::on(
                    $self,
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'println',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

FF::after_content();
