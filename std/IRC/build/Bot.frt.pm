# === Document Model ===
#  Document './std/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@commands'
#                          Argument value
#                              Object [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@conns'
#                          Value list [0 items]
#          Method 'addConnection'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$connection'
#                          Argument type
#                              Bareword 'Connection'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@conns'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$connection'
#                  Instruction
#                      Weaken modifier
#                          Assignment
#                              Lexical variable '$bot'
#                              Special variable '*self'
#                  On ('handleCommand' callback)
#                      Expression ('on' parameter)
#                          Property 'PRIVMSG'
#                              Property 'handlers'
#                                  Lexical variable '$connection'
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Call
#                                              Special property '*instanceOf'
#                                                  Property 'target'
#                                                      Lexical variable '$msg'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Bareword 'Channel'
#                                  If body
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$trim'
#                                      Detail
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Call
#                                                      Property 'word'
#                                                          Index
#                                                              Property 'params'
#                                                                  Lexical variable '$msg'
#                                                              Index list [1 item]
#                                                                  Item 0
#                                                                      Number '1'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Number '0'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String '.'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'trimmed'
#                                              Lexical variable '$trim'
#                                  If body
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$command'
#                                      Property 'result'
#                                          Lexical variable '$trim'
#                              Instruction
#                                  Call
#                                      Maybe
#                                          Property (name evaluated at runtime)
#                                              Property 'commands'
#                                                  Maybe
#                                                      Lexical variable '$bot'
#                                              Property index [1 item]
#                                                  Item 0
#                                                      Property 'lowercase'
#                                                          Lexical variable '$command'
#                                      Named argument list [3 items]
#                                          Item 0
#                                              Pair '_this'
#                                                  Maybe
#                                                      Lexical variable '$bot'
#                                          Item 1
#                                              Pair 'msg'
#                                                  Lexical variable '$msg'
#                                          Item 2
#                                              Pair 'channel'
#                                                  Property 'target'
#                                                      Lexical variable '$msg'
#                                  Catch
#                                      Expression ('catch' parameter)
#                                          Lexical variable '$e'
#                                      Catch body
#                                          Instruction
#                                              Call
#                                                  Property 'privmsg'
#                                                      Property 'target'
#                                                          Lexical variable '$msg'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Property 'msg'
#                                                              Lexical variable '$e'
#          Method 'connect'
#              Function body
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$c'
#                      Expression ('in' parameter)
#                          Instance variable '@conns'
#                      For body
#                          Instruction
#                              Call
#                                  Property 'connect'
#                                      Lexical variable '$c'
#                                  Argument list [0 items]
#          Method 'description'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$s'
#                          String ''
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'length'
#                                  Instance variable '@conns'
#                              Negated equality operator (!=)
#                              Number '1'
#                      If body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$s'
#                                  String 's'
#                  Instruction
#                      Return
#                          Operation
#                              String 'IRC::Bot('
#                              Addition operator (+)
#                              Property 'length'
#                                  Instance variable '@conns'
#                              Addition operator (+)
#                              String ' connection'
#                              Addition operator (+)
#                              Lexical variable '$s'
#                              Addition operator (+)
#                              String ')'
#      Include (Channel, Connection)
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

my $pos = before_content( 'Bot.frt', './std/IRC/Bot.frt' );

use Ferret::Core::Operations qw(_not add all_true bool nequal num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef,
        'handleCommand',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 17.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}->property_u( 'target', $pos->(20.2) )
                          ->property_u( '*instanceOf', $pos->(20.25) )->(
                            [ $$scope->{'Channel'} ], $scope,
                            undef,                    $pos->(20.3)
                          )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                trim => $$scope->{'msg'}->property_u( 'params', $pos->(24.25) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(24.3) )
                  ->property_u( 'word', $pos->(24.45) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(24.5) )
                  ->property_u( 'trimPrefix', $pos->(24.65) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(24.7), 1 ),
                $file_scope, $pos->(24.1)
            );
            if (
                bool(
                    _not(
                        $$scope->{'trim'}->property_u( 'trimmed', $pos->(25.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                command =>
                  $$scope->{'trim'}->property_u( 'result', $pos->(27.4) ),
                $file_scope, $pos->(27.2)
            );
            {
                my $maybe_0 = $$scope->{'bot'};
                my $maybe_1 =
                  $maybe_0->property_u( 'commands', $pos->(30.15) )
                  ->property_u(
                    $$scope->{'command'}
                      ->property_u( 'lowercase', $pos->(30.35) ),
                    $pos->(30.2)
                  );
                my $maybe_2 = $$scope->{'bot'};
                if (
                    bool(
                        all_true(
                            $scope,
                            sub { $maybe_0 },
                            sub { $maybe_1 },
                            sub { $maybe_2 }
                        )
                    )
                  )
                {
                    try_catch(
                        $f, $scope,
                        sub {
                            $maybe_1->(
                                [
                                    undef,
                                    [
                                        _this   => $maybe_2,
                                        msg     => $$scope->{'msg'},
                                        channel => $$scope->{'msg'}->property_u(
                                            'target', $pos->(33.3)
                                        )
                                    ]
                                ],
                                $scope, undef,
                                $pos->(30.5)
                            );
                        },
                        sub {
                            my ($scope) = @_;
                            $$scope->{'msg'}
                              ->property_u( 'target',  $pos->(34.3) )
                              ->property_u( 'privmsg', $pos->(34.35) )->(
                                [
                                    $$scope->{'e'}
                                      ->property_u( 'msg', $pos->(34.5) )
                                ],
                                $scope, undef,
                                $pos->(34.4)
                              );
                        },
                        'e'
                    );
                }
            }
            return $ret;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Bot', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'addConnection' definition
        my $func_2 = method_event_def( $f, $scope, 'addConnection' );

        # Method event 'connect' definition
        my $func_3 = method_event_def( $f, $scope, 'connect' );

        # Method event 'description' definition
        my $func_4 = method_event_def( $f, $scope, 'description' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            addConnection => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Channel Connection) );
};

after_content();
