# === Document Model ===
#  File './test/12-socket.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$sock'
#                  Call
#                      Bareword 'Socket::TCP'
#                      Named argument list [3 items]
#                          Item 0
#                              Pair 'address'
#                                  String 'k.notroll.net'
#                          Item 1
#                              Pair 'port'
#                                  Number '6667'
#                          Item 2
#                              Pair 'readMode'
#                                  Symbol :line
#          Instruction
#              Call
#                  Bareword 'inspect'
#                  Argument list [1 item]
#                      Item 0
#                          Lexical variable '$sock'
#          On
#              Expression ('on' parameter)
#                  Property 'gotLine'
#                      Lexical variable '$sock'
#              Anonymous function { $data }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'recv: '
#                                          Addition operator (+)
#                                          Lexical variable '$data'
#          On
#              Expression ('on' parameter)
#                  Property 'println'
#                      Lexical variable '$sock'
#              Anonymous function { $data }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'send: '
#                                          Addition operator (+)
#                                          Lexical variable '$data'
#          On
#              Expression ('on' parameter)
#                  Property 'connected'
#                      Lexical variable '$sock'
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Property 'println'
#                                  Lexical variable '$sock'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'NICK k'
#                      Instruction
#                          Call
#                              Property 'println'
#                                  Lexical variable '$sock'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'USER k '
#                                          Addition operator (+)
#                                          String '*'
#                                          Addition operator (+)
#                                          String ' '
#                                          Addition operator (+)
#                                          String '*'
#                                          Addition operator (+)
#                                          String ' :k'
#          Instruction
#              Call
#                  Property 'connect'
#                      Lexical variable '$sock'
#                  Argument list [0 items]
#          On
#              Expression ('on' parameter)
#                  Property 'expire'
#                      Call
#                          Property 'once'
#                              Call
#                                  Bareword 'Timer'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '5'
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Property 'println'
#                                  Lexical variable '$sock'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'JOIN #k'
#          Include (Socket::TCP, Timer)
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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './test/12-socket.frt';
my $pos = before_content( '12-socket.frt', $file_name );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'data', 5.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(6.4),
                        str( $f, "recv: " ), $$scope->{'data'}
                    )
                ],
                $scope, undef,
                $pos->(6.2)
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
            need( $scope, $args, 'data', 10.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(11.4),
                        str( $f, "send: " ), $$scope->{'data'}
                    )
                ],
                $scope, undef,
                $pos->(11.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'sock'}->property_u( 'println', $pos->(15.2) )
              ->( [ str( $f, "NICK k" ) ], $scope, undef, $pos->(15.3) );
            $$scope->{'sock'}->property_u( 'println', $pos->(16.1) )->(
                [
                    add(
                        $scope,
                        $pos->(16.25),
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
    my $func_3 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'sock'}->property_u( 'println', $pos->(22.2) )
              ->( [ str( $f, "JOIN #k" ) ], $scope, undef, $pos->(22.3) );
            return $ret;
        }
    );
    load_namespaces( $context, $file_name, qw(Socket::TCP Timer) );
    var(
        $scope,
        sock => $$scope->{'Socket::TCP'}->(
            [
                undef,
                [
                    address  => str( $f,        "k.notroll.net" ),
                    port     => num( $f,        "6667" ),
                    readMode => get_symbol( $f, 'line' )
                ]
            ],
            $scope, undef,
            $pos->(1.3)
        ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'inspect'}->( [ $$scope->{'sock'} ], $scope, undef, $pos->(2.2) );
    on(
        $$scope->{'sock'},
        'gotLine',
        $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'sock'},
        'println',
        $self, $scope,
        $func_1->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'sock'},
        'connected',
        $self, $scope,
        $func_2->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'sock'}->property_u( 'connect', $pos->(19.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(19.3) );
    on(
        $$scope->{'Timer'}->( [ num( $f, "5" ) ], $scope, undef, $pos->(21.15) )
          ->property_u( 'once', $pos->(21.3) )
          ->( [ undef, [] ], $scope, undef, $pos->(21.35) ),
        'expire', $self, $scope,
        $func_3->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
};

after_content($file_name);
