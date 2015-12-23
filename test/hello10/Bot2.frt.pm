# === Tokenization ===
#       CLASS_DEC |                {"name":"Bot2"} | 1.1
#          METHOD |     {"main":1,"name":"_init_"} | 3.1
#       CLOSURE_S |                                | 3.2
#    KEYWORD_NEED |                                | 4.05
#        VAR_THIS |                      "address" | 4.1
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
#        BAREWORD |                       "Socket" | 8.05
#         OP_PACK |                                | 8.1
#        BAREWORD |                          "TCP" | 8.15
#        PROPERTY |                         "init" | 8.2
#      PAREN_CALL |                                | 8.25
#        VAR_SPEC |                         "self" | 8.3
#         PAREN_E |                                | 8.35
#      PAREN_CALL |                                | 8.4
#      PROP_VALUE |                         "addr" | 8.45
#        VAR_THIS |                      "address" | 8.5
#        OP_COMMA |                                | 8.55
#      PROP_VALUE |                         "port" | 8.6
#        VAR_THIS |                         "port" | 8.65
#         PAREN_E |                                | 8.7
#         OP_SEMI |                              1 | 8.75
#        VAR_THIS |                         "send" | 10.1
#       OP_ASSIGN |                                | 10.2
#        VAR_THIS |                      "println" | 10.3
#         OP_SEMI |                              1 | 10.4
#      KEYWORD_ON |                                | 13.1
#        VAR_THIS |                    "connected" | 13.2
#       CLOSURE_S |                                | 13.3
#        VAR_THIS |                         "send" | 14.1
#      PAREN_CALL |                                | 14.2
#          STRING | ["USER ",["VAR_THIS","user",14]," ","*"," ","*"," :",["VAR_THIS","real",14]] | 14.3
#         PAREN_E |                                | 14.4
#         OP_SEMI |                              1 | 14.5
#        VAR_THIS |                         "send" | 15.1
#      PAREN_CALL |                                | 15.2
#          STRING | ["NICK ",["VAR_THIS","nick",15]] | 15.3
#         PAREN_E |                                | 15.4
#         OP_SEMI |                              1 | 15.5
#       CLOSURE_E |                                | 16.1
#      KEYWORD_ON |                                | 19.1
#        VAR_THIS |                      "gotLine" | 19.2
#       CLOSURE_S |                                | 19.3
#    KEYWORD_NEED |                                | 20.1
#         VAR_LEX |                         "data" | 20.2
#         OP_SEMI |                              1 | 20.3
#        BAREWORD |                          "say" | 21.1
#      PAREN_CALL |                                | 21.2
#          STRING | ["recv: ",["VAR_LEX","data",21]] | 21.3
#         PAREN_E |                                | 21.4
#         OP_SEMI |                              1 | 21.5
#       CLOSURE_E |                                | 22.1
#      KEYWORD_ON |                                | 24.1
#        VAR_THIS |                      "println" | 24.2
#       CLOSURE_S |                                | 24.3
#    KEYWORD_NEED |                                | 25.1
#         VAR_LEX |                         "data" | 25.2
#         OP_SEMI |                              1 | 25.3
#        BAREWORD |                          "say" | 26.1
#      PAREN_CALL |                                | 26.2
#          STRING | ["send: ",["VAR_LEX","data",26]] | 26.3
#         PAREN_E |                                | 26.4
#         OP_SEMI |                              1 | 26.5
#       CLOSURE_E |                                | 27.1
#       CLOSURE_E |                                | 29.1
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
                $scope, undef, 14.2
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 15.2
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
            FF::need( $scope, $arguments, 'data', 20.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 21.2
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
            FF::need( $scope, $arguments, 'data', 25.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 26.2
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
                FF::want( $self, $arguments, 'port', 5.1, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'real', 5.4,
                    str( $f, "Ferret IRC" ) );
                $scope->property_u('Socket::TCP')->property_u('init')
                  ->call_u( [ $scope->{special}->property_u('self') ],
                    $scope, undef, 8.25 )->call_u(
                    {
                        addr => $self->property_u('address'),
                        port => $self->property_u('port')
                    },
                    $scope, undef, 8.4
                    );
                $self->set_property(
                    send => $self->property_u('println'),
                    10.2
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
