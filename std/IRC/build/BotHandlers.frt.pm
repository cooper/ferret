# === Document Model ===
#  File './std/IRC/BotHandlers.frt'
#      Package 'IRC::BotHandlers'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$handlers'
#                      Object [1 item]
#                          Item 0
#                              Pair 'PRIVMSG'
#                                  Bareword 'privmsg'
#          Function 'privmsg' { $bot $msg -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$bot'
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Call
#                                  Special property '*instanceOf'
#                                      Property 'target'
#                                          Lexical variable '$msg'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Bareword 'Channel'
#                      If body
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment
#                          Lexical variable '$trim'
#                          Detail
#                              Call
#                                  Property 'trimPrefix'
#                                      Call
#                                          Property 'word'
#                                              Index
#                                                  Property 'params'
#                                                      Lexical variable '$msg'
#                                                  Index list [1 item]
#                                                      Item 0
#                                                          Number '1'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Number '0'
#                                  Argument list [1 item]
#                                      Item 0
#                                          String '.'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Property 'trimmed'
#                                  Lexical variable '$trim'
#                      If body
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment
#                          Lexical variable '$command'
#                          Property 'result'
#                              Lexical variable '$trim'
#                  Instruction
#                      Call
#                          Maybe
#                              Property (name evaluated at runtime)
#                                  Property 'commands'
#                                      Lexical variable '$bot'
#                                  Property index [1 item]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$command'
#                          Named argument list [3 items]
#                              Item 0
#                                  Pair '_this'
#                                      Lexical variable '$bot'
#                              Item 1
#                                  Pair 'msg'
#                                      Lexical variable '$msg'
#                              Item 2
#                                  Pair 'channel'
#                                      Property 'target'
#                                          Lexical variable '$msg'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$e'
#                          Catch body
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Property 'target'
#                                              Lexical variable '$msg'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Property 'msg'
#                                                  Lexical variable '$e'
#          Include (Channel)
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
use Ferret::Core::Operations qw(_not bool num str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/IRC/BotHandlers.frt';
my $pos = before_content( 'BotHandlers.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC::BotHandlers' );
    my $scope = $file_scope;
    load_core('IRC::BotHandlers');

    # Function event 'privmsg' definition
    my $func_0 = function_event_def(
        $f, $context,
        'privmsg',
        undef,
        [
            { name => 'bot', type => undef, optional => undef, more => undef },
            { name => 'msg', type => undef, optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'bot', 8.2 ) || return $ret_func->();
            need( $scope, $args, 'msg', 8.4 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}->property_u( 'target', $pos->(11.2) )
                          ->property_u( '*instanceOf', $pos->(11.25) )->(
                            [ $$scope->{'Channel'} ], $scope,
                            undef,                    $pos->(11.3)
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
                trim => $$scope->{'msg'}->property_u( 'params', $pos->(15.25) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(15.3) )
                  ->property_u( 'word', $pos->(15.45) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(15.5) )
                  ->property_u( 'trimPrefix', $pos->(15.65) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(15.7), 1 ),
                $file_scope, $pos->(15.1)
            );
            if (
                bool(
                    _not(
                        $$scope->{'trim'}->property_u( 'trimmed', $pos->(16.4) )
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
                  $$scope->{'trim'}->property_u( 'result', $pos->(18.4) ),
                $file_scope, $pos->(18.2)
            );
            {
                my $maybe_0 =
                  $$scope->{'bot'}->property_u( 'commands', $pos->(21.1) )
                  ->property_u(
                    $$scope->{'command'}
                      ->property_u( 'lowercase', $pos->(21.3) ),
                    $pos->(21.15)
                  );
                if ( bool($maybe_0) ) {
                    try_catch(
                        $f, $scope,
                        sub {
                            $maybe_0->(
                                [
                                    undef,
                                    [
                                        _this   => $$scope->{'bot'},
                                        msg     => $$scope->{'msg'},
                                        channel => $$scope->{'msg'}->property_u(
                                            'target', $pos->(24.3)
                                        )
                                    ]
                                ],
                                $scope, undef,
                                $pos->(21.45)
                            );
                        },
                        sub {
                            my ($scope) = @_;
                            $$scope->{'msg'}
                              ->property_u( 'target',  $pos->(25.3) )
                              ->property_u( 'privmsg', $pos->(25.35) )->(
                                [
                                    $$scope->{'e'}
                                      ->property_u( 'msg', $pos->(25.5) )
                                ],
                                $scope, undef,
                                $pos->(25.4)
                              );
                        },
                        'e'
                    );
                }
            }
            return $ret;
        }
    );
    $func_0->inside_scope(
        privmsg => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, $file_name, qw(Channel) );
    var(
        $context,
        handlers => create_object( $f, [ PRIVMSG => $$scope->{'privmsg'} ] ),
        undef, $pos->(3.3)
    );
};

after_content($file_name);
