# === Tokenization ===
#         VAR_LEX |                         "sock" | 1.05882
#       OP_ASSIGN |                                | 1.11765
#        BAREWORD |                       "Socket" | 1.17647
#         OP_PACK |                                | 1.23529
#        BAREWORD |                          "TCP" | 1.29412
#      PAREN_CALL |                                | 1.35294
#      PROP_VALUE |                      "address" | 1.41176
#          STRING |              ["k.notroll.net"] | 1.47059
#        OP_COMMA |                                | 1.52941
#      PROP_VALUE |                         "port" | 1.58824
#          NUMBER |                         "6667" | 1.64706
#        OP_COMMA |                                | 1.70588
#      PROP_VALUE |                     "readMode" | 1.76471
#         VAR_SYM |                         "line" | 1.82353
#         PAREN_E |                                | 1.88235
#         OP_SEMI |                                | 1.94118
#        BAREWORD |                      "inspect" | 2.16667
#      PAREN_CALL |                                | 2.33333
#         VAR_LEX |                         "sock" | 2.5
#         PAREN_E |                                | 2.66667
#         OP_SEMI |                                | 2.83333
#      KEYWORD_ON |                                | 4.2
#         VAR_LEX |                         "sock" | 4.4
#        PROPERTY |                      "gotLine" | 4.6
#       CLOSURE_S |                                | 4.8
#    KEYWORD_NEED |                                | 5.25
#         VAR_LEX |                         "data" | 5.5
#         OP_SEMI |                                | 5.75
#        BAREWORD |                          "say" | 6.16667
#      PAREN_CALL |                                | 6.33333
#          STRING | ["recv: ",["VAR_LEX","data",6]] | 6.5
#         PAREN_E |                                | 6.66667
#         OP_SEMI |                                | 6.83333
#       CLOSURE_E |                                | 7.5
#      KEYWORD_ON |                                | 9.2
#         VAR_LEX |                         "sock" | 9.4
#        PROPERTY |                      "println" | 9.6
#       CLOSURE_S |                                | 9.8
#    KEYWORD_NEED |                                | 10.25
#         VAR_LEX |                         "data" | 10.5
#         OP_SEMI |                                | 10.75
#        BAREWORD |                          "say" | 11.16667
#      PAREN_CALL |                                | 11.33333
#          STRING | ["send: ",["VAR_LEX","data",11]] | 11.5
#         PAREN_E |                                | 11.66667
#         OP_SEMI |                                | 11.83333
#       CLOSURE_E |                                | 12.5
#      KEYWORD_ON |                                | 14.2
#         VAR_LEX |                         "sock" | 14.4
#        PROPERTY |                    "connected" | 14.6
#       CLOSURE_S |                                | 14.8
#         VAR_LEX |                         "sock" | 15.14286
#        PROPERTY |                      "println" | 15.28571
#      PAREN_CALL |                                | 15.42857
#          STRING |                     ["NICK k"] | 15.57143
#         PAREN_E |                                | 15.71429
#         OP_SEMI |                                | 15.85714
#         VAR_LEX |                         "sock" | 16.14286
#        PROPERTY |                      "println" | 16.28571
#      PAREN_CALL |                                | 16.42857
#          STRING |  ["USER k ","*"," ","*"," :k"] | 16.57143
#         PAREN_E |                                | 16.71429
#         OP_SEMI |                                | 16.85714
#       CLOSURE_E |                                | 17.5
#         VAR_LEX |                         "sock" | 19.16667
#        PROPERTY |                      "connect" | 19.33333
#      PAREN_CALL |                                | 19.5
#         PAREN_E |                                | 19.66667
#         OP_SEMI |                                | 19.83333
#      KEYWORD_ON |                                | 21.1
#        BAREWORD |                        "Timer" | 21.2
#      PAREN_CALL |                                | 21.3
#          NUMBER |                            "5" | 21.4
#         PAREN_E |                                | 21.5
#        PROPERTY |                         "once" | 21.6
#         OP_CALL |                                | 21.7
#        PROPERTY |                       "expire" | 21.8
#       CLOSURE_S |                                | 21.9
#         VAR_LEX |                         "sock" | 22.14286
#        PROPERTY |                      "println" | 22.28571
#      PAREN_CALL |                                | 22.42857
#          STRING |                    ["JOIN #k"] | 22.57143
#         PAREN_E |                                | 22.71429
#         OP_SEMI |                                | 22.85714
#       CLOSURE_E |                                | 23.5
# === Document Model ===
#  Document './test/hello12.frt'
#      Instruction
#          Assignment (lexical variable '$sock')
#              Call
#                  Bareword 'Socket::TCP'
#                  Named argument list [3 items]
#                      Item 0
#                          Pair 'address'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'port'
#                              Number '6667'
#                      Item 2
#                          Pair 'readMode'
#                              Symbol :line
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$sock'
#      On
#          Expression ('on' parameter)
#              Property 'gotLine'
#                  Lexical variable '$sock'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'recv: '
#                                      Addition operator (+)
#                                      Lexical variable '$data'
#      On
#          Expression ('on' parameter)
#              Property 'println'
#                  Lexical variable '$sock'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'send: '
#                                      Addition operator (+)
#                                      Lexical variable '$data'
#      On
#          Expression ('on' parameter)
#              Property 'connected'
#                  Lexical variable '$sock'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Property 'println'
#                              Lexical variable '$sock'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'NICK k'
#                  Instruction
#                      Call
#                          Property 'println'
#                              Lexical variable '$sock'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'USER k '
#                                      Addition operator (+)
#                                      String '*'
#                                      Addition operator (+)
#                                      String ' '
#                                      Addition operator (+)
#                                      String '*'
#                                      Addition operator (+)
#                                      String ' :k'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$sock'
#              Argument list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '5'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Property 'println'
#                              Lexical variable '$sock'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'JOIN #k'
#      Include (Socket, Socket::TCP, Timer)
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

FF::before_content('hello12.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data', 5.5 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 6.33333
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
            FF::need( $scope, $arguments, 'data', 10.5 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 11.33333
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('sock')->property_u('println')
              ->call_u( [ str( $f, "NICK k" ) ], $scope, undef, 15.42857 );
            $scope->property_u('sock')->property_u('println')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER k " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :k" )
                    )
                ],
                $scope, undef, 16.42857
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('sock')->property_u('println')
              ->call_u( [ str( $f, "JOIN #k" ) ], $scope, undef, 22.42857 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Socket Socket::TCP Timer) );
    $scope->set_property_ow(
        $context,
        sock => $scope->property_u('Socket::TCP')->call_u(
            {
                address  => str( $f,            "k.notroll.net" ),
                port     => num( $f,            6667 ),
                readMode => FF::get_symbol( $f, 'line' )
            },
            $scope, undef, 1.35294
        ),
        1.11765
    );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('sock') ], $scope, undef, 2.33333 );
    FF::on(
        $scope->property_u('sock'),
        'gotLine',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    FF::on(
        $scope->property_u('sock'),
        'println',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    FF::on(
        $scope->property_u('sock'),
        'connected',
        $self,
        $scope,
        $func_2->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->property_u('sock')->property_u('connect')
      ->call_u( {}, $scope, undef, 19.5 );
    FF::on(
        $scope->property_u('Timer')
          ->call_u( [ num( $f, 5 ) ], $scope, undef, 21.3 )->property_u('once')
          ->call_u( {}, $scope, undef, 21.7 ),
        'expire',
        $self,
        $scope,
        $func_3->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
};

FF::after_content();
