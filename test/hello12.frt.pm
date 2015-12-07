# === Document Model ===
#  Document './test/hello12.frt'
#      Instruction
#          Assignment (lexical variable '$sock')
#              Call
#                  Bareword 'Socket::TCP'
#                  Named argument list [2 items]
#                      Item 0
#                          Pair 'address'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'port'
#                              Number '6667'
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
            FF::need( $scope, $arguments, 'data' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef,
                6.31707317073171
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
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef,
                11.4756097560976
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
              ->call_u( [ str( $f, "NICK k" ) ],
                $scope, undef, 15.609756097561 );
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
                $scope, undef,
                16.6829268292683
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
              ->call_u( [ str( $f, "JOIN #k" ) ],
                $scope, undef, 22.9390243902439 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Socket Socket::TCP Timer) );
    $scope->set_property_ow(
        $context,
        sock => $scope->property_u('Socket::TCP')->call_u(
            { address => str( $f, "k.notroll.net" ), port => num( $f, 6667 ) },
            $scope,
            undef,
            1.0609756097561
        ),
        1.01219512195122
    );
    $scope->property_u('inspect')->call_u( [ $scope->property_u('sock') ],
        $scope, undef, 2.17073170731707 );
    FF::on( $scope->property_u('sock'), 'gotLine', $self, $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    FF::on( $scope->property_u('sock'), 'println', $self, $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    FF::on( $scope->property_u('sock'), 'connected', $self, $scope,
        $func_2->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->property_u('sock')->property_u('connect')
      ->call_u( {}, $scope, undef, 19.7682926829268 );
    FF::on(
        $scope->property_u('Timer')
          ->call_u( [ num( $f, 5 ) ], $scope, undef, 21.8292682926829 )
          ->property_u('once')->call_u( {}, $scope, undef, 21.8780487804878 ),
        'expire',
        $self,
        $scope,
        $func_3->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
};

FF::after_content();
