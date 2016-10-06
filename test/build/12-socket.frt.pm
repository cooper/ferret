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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( '12-socket.frt', './test/12-socket.frt' );

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
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'data', 5.2 ) or return;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "recv: " ), $$scope->{'data'} ) ],
                $scope, undef, $pos->(6.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'data', 10.2 ) or return;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "send: " ), $$scope->{'data'} ) ],
                $scope, undef, $pos->(11.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            ${ $$scope->{'sock'} }->{'println'}
              ->( [ str( $f, "NICK k" ) ], $scope, undef, $pos->(15.3) );
            ${ $$scope->{'sock'} }->{'println'}->(
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
                $pos->(16.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            ${ $$scope->{'sock'} }->{'println'}
              ->( [ str( $f, "JOIN #k" ) ], $scope, undef, $pos->(22.3) );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(Socket Socket::TCP Timer) );
    FF::lex_assign(
        $scope,
        sock => $$scope->{'Socket::TCP'}->(
            [
                undef,
                [
                    address  => str( $f,            "k.notroll.net" ),
                    port     => num( $f,            "6667" ),
                    readMode => FF::get_symbol( $f, 'line' )
                ]
            ],
            $scope, undef,
            $pos->(1.3)
        ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'inspect'}->( [ $$scope->{'sock'} ], $scope, undef, $pos->(2.2) );
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
    ${ $$scope->{'sock'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(19.3) );
    FF::on(
        ${
            $$scope->{'Timer'}
              ->( [ num( $f, "5" ) ], $scope, undef, $pos->(21.15) )
          }->{'once'}->( [ undef, [] ], $scope, undef, $pos->(21.35) ),
        'expire', $self, $scope,
        $func_3->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
};

FF::after_content();
