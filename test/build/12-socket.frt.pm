# === Document Model ===
#  Document './test/12-socket.frt'
#      Instruction
#          Assignment
#              Lexical variable '$sock'
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

FF::before_content('12-socket.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'data', 5.2 ) or return;
            $$scope->{'say'}->call_u(
                [ add( $scope, str( $f, "recv: " ), $$scope->{'data'} ) ],
                $scope, undef, 6.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'data', 10.2 ) or return;
            $$scope->{'say'}->call_u(
                [ add( $scope, str( $f, "send: " ), $$scope->{'data'} ) ],
                $scope, undef, 11.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            ${ $$scope->{'sock'} }->{'println'}
              ->call_u( [ str( $f, "NICK k" ) ], $scope, undef, 15.3 );
            ${ $$scope->{'sock'} }->{'println'}->call_u(
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
                $scope, undef, 16.15
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            ${ $$scope->{'sock'} }->{'println'}
              ->call_u( [ str( $f, "JOIN #k" ) ], $scope, undef, 22.3 );
            return $ret->return;
        }
    );
    FF::load_namespaces( $context, qw(Socket Socket::TCP Timer) );
    my $lv_sock = FF::lex_assign(
        $scope,
        sock => $$scope->{'Socket::TCP'}->call_u(
            {
                address  => str( $f,            "k.notroll.net" ),
                port     => num( $f,            6667 ),
                readMode => FF::get_symbol( $f, 'line' )
            },
            $scope, undef, 1.3
        ),
        undef,
        1.1
    );
    $$scope->{'inspect'}->call_u( [ $$scope->{'sock'} ], $scope, undef, 2.2 );
    FF::on(
        $$scope->{'sock'},
        'gotLine',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        $$scope->{'sock'},
        'println',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        $$scope->{'sock'},
        'connected',
        $self,
        $scope,
        $func_2->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    ${ $$scope->{'sock'} }->{'connect'}->call_u( {}, $scope, undef, 19.3 );
    FF::on(
        ${
            $$scope->{'Timer'}->call_u( [ num( $f, 5 ) ], $scope, undef, 21.15 )
          }->{'once'}->call_u( {}, $scope, undef, 21.35 ),
        'expire', $self, $scope,
        $func_3->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
};

FF::after_content();
