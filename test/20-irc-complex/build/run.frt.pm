# === Document Model ===
#  File './test/20-irc-complex/run.frt'
#      Package 'main'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$bot'
#                      Call
#                          Bareword 'IRCBot::Bot'
#                          Named argument list [3 items]
#                              Item 0
#                                  Pair 'addr'
#                                      String 'k.notroll.net'
#                              Item 1
#                                  Pair 'nick'
#                                      String 'bootie'
#                              Item 2
#                                  Pair 'user'
#                                      String 'ferret'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$i'
#                      Call
#                          Bareword 'IRC::Connection'
#                          Named argument list [3 items]
#                              Item 0
#                                  Pair 'addr'
#                                      String 'k.notroll.net'
#                              Item 1
#                                  Pair 'nick'
#                                      String 'booby'
#                              Item 2
#                                  Pair 'user'
#                                      String 'ferret'
#          Instruction
#              Assignment
#                  Property 'autojoin'
#                      Lexical variable '$bot'
#                  Value list [1 item]
#                      Item 0
#                          String '#k'
#          Instruction
#              Assignment
#                  Property 'autojoin'
#                      Lexical variable '$i'
#                  Value list [1 item]
#                      Item 0
#                          String '#k'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'info'
#                      Item 1
#                          Anonymous function { $msg }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$msg'
#                                  Instruction
#                                      Call
#                                          Property 'privmsg'
#                                              Lexical variable '$bot'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Property 'channel'
#                                                      Lexical variable '$msg'
#                                              Item 1
#                                                  String 'Ferret IRC...'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 't'
#                      Item 1
#                          Anonymous function { $msg -> $result $result }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$msg'
#                                  If
#                                      Expression ('if' parameter)
#                                          Negation
#                                              Property 'commandHasParameters'
#                                                  Lexical variable '$msg'
#                                      If body
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$c'
#                                          Call
#                                              Bareword 'COMPILER'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Call
#                                                          Bareword 'convertNewlines'
#                                                          Argument list [1 item]
#                                                              Item 0
#                                                                  Call
#                                                                      Property 'fromWord'
#                                                                          Lexical variable '$msg'
#                                                                      Argument list [1 item]
#                                                                          Item 0
#                                                                              Number '1'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$res'
#                                          Call
#                                              Property 'tokenize'
#                                                  Lexical variable '$c'
#                                              Named argument list [1 item]
#                                                  Item 0
#                                                      Pair 'pretty'
#                                                          Boolean true
#                                  If
#                                      Expression ('if' parameter)
#                                          Property 'error'
#                                              Lexical variable '$res'
#                                      If body
#                                          Instruction
#                                              Call
#                                                  Property 'privmsg'
#                                                      Lexical variable '$bot'
#                                                  Argument list [2 items]
#                                                      Item 0
#                                                          Property 'channel'
#                                                              Lexical variable '$msg'
#                                                      Item 1
#                                                          Call
#                                                              Bareword 'Str'
#                                                              Argument list [1 item]
#                                                                  Item 0
#                                                                      Property 'error'
#                                                                          Lexical variable '$res'
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Call
#                                          Property 'privmsg'
#                                              Lexical variable '$bot'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Property 'channel'
#                                                      Lexical variable '$msg'
#                                              Item 1
#                                                  Property 'pretty'
#                                                      Lexical variable '$res'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'c'
#                      Item 1
#                          Anonymous function { $msg -> $result $result }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$msg'
#                                  If
#                                      Expression ('if' parameter)
#                                          Negation
#                                              Property 'commandHasParameters'
#                                                  Lexical variable '$msg'
#                                      If body
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$c'
#                                          Call
#                                              Bareword 'COMPILER'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Call
#                                                          Bareword 'convertNewlines'
#                                                          Argument list [1 item]
#                                                              Item 0
#                                                                  Call
#                                                                      Property 'fromWord'
#                                                                          Lexical variable '$msg'
#                                                                      Argument list [1 item]
#                                                                          Item 0
#                                                                              Number '1'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$res'
#                                          Call
#                                              Property 'construct'
#                                                  Lexical variable '$c'
#                                              Named argument list [1 item]
#                                                  Item 0
#                                                      Pair 'pretty'
#                                                          Boolean true
#                                  If
#                                      Expression ('if' parameter)
#                                          Property 'error'
#                                              Lexical variable '$res'
#                                      If body
#                                          Instruction
#                                              Call
#                                                  Property 'privmsg'
#                                                      Lexical variable '$bot'
#                                                  Argument list [2 items]
#                                                      Item 0
#                                                          Property 'channel'
#                                                              Lexical variable '$msg'
#                                                      Item 1
#                                                          Call
#                                                              Bareword 'Str'
#                                                              Argument list [1 item]
#                                                                  Item 0
#                                                                      Property 'error'
#                                                                          Lexical variable '$res'
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Call
#                                          Property 'privmsg'
#                                              Lexical variable '$bot'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Property 'channel'
#                                                      Lexical variable '$msg'
#                                              Item 1
#                                                  Property 'pretty'
#                                                      Lexical variable '$res'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'e'
#                      Item 1
#                          Anonymous function { $msg -> $result $result }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$msg'
#                                  If
#                                      Expression ('if' parameter)
#                                          Negation
#                                              Property 'commandHasParameters'
#                                                  Lexical variable '$msg'
#                                      If body
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$res'
#                                          Call
#                                              Property 'eval'
#                                                  Call
#                                                      Bareword 'COMPILER'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Call
#                                                                  Bareword 'convertNewlines'
#                                                                  Argument list [1 item]
#                                                                      Item 0
#                                                                          Call
#                                                                              Property 'fromWord'
#                                                                                  Lexical variable '$msg'
#                                                                              Argument list [1 item]
#                                                                                  Item 0
#                                                                                      Number '1'
#                                              Argument list [0 items]
#                                  If
#                                      Expression ('if' parameter)
#                                          Property 'error'
#                                              Lexical variable '$res'
#                                      If body
#                                          Instruction
#                                              Call
#                                                  Property 'privmsg'
#                                                      Lexical variable '$bot'
#                                                  Argument list [2 items]
#                                                      Item 0
#                                                          Property 'channel'
#                                                              Lexical variable '$msg'
#                                                      Item 1
#                                                          Call
#                                                              Bareword 'Str'
#                                                              Argument list [1 item]
#                                                                  Item 0
#                                                                      Property 'error'
#                                                                          Lexical variable '$res'
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$string'
#                                          Property 'string'
#                                              Call
#                                                  Bareword 'inspect'
#                                                  Named argument list [2 items]
#                                                      Item 0
#                                                          Pair 'value'
#                                                              Property 'result'
#                                                                  Lexical variable '$res'
#                                                      Item 1
#                                                          Pair 'quiet'
#                                                              Boolean true
#                                  Instruction
#                                      Call
#                                          Property 'privmsg'
#                                              Lexical variable '$bot'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Property 'channel'
#                                                      Lexical variable '$msg'
#                                              Item 1
#                                                  Lexical variable '$string'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'pe'
#                      Item 1
#                          Anonymous function { $msg -> $result $result }
#                              Function body
#                                  Instruction
#                                      Need
#                                          Lexical variable '$msg'
#                                  If
#                                      Expression ('if' parameter)
#                                          Negation
#                                              Property 'commandHasParameters'
#                                                  Lexical variable '$msg'
#                                      If body
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$res'
#                                          Call
#                                              Property 'perlEval'
#                                                  Call
#                                                      Bareword 'COMPILER'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Call
#                                                                  Bareword 'convertNewlines'
#                                                                  Argument list [1 item]
#                                                                      Item 0
#                                                                          Call
#                                                                              Property 'fromWord'
#                                                                                  Lexical variable '$msg'
#                                                                              Argument list [1 item]
#                                                                                  Item 0
#                                                                                      Number '1'
#                                              Argument list [0 items]
#                                  If
#                                      Expression ('if' parameter)
#                                          Property 'error'
#                                              Lexical variable '$res'
#                                      If body
#                                          Instruction
#                                              Call
#                                                  Property 'privmsg'
#                                                      Lexical variable '$bot'
#                                                  Argument list [2 items]
#                                                      Item 0
#                                                          Property 'channel'
#                                                              Lexical variable '$msg'
#                                                      Item 1
#                                                          Call
#                                                              Bareword 'Str'
#                                                              Argument list [1 item]
#                                                                  Item 0
#                                                                      Property 'error'
#                                                                          Lexical variable '$res'
#                                          Instruction
#                                              Return
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$string'
#                                          Property 'string'
#                                              Call
#                                                  Bareword 'inspect'
#                                                  Named argument list [2 items]
#                                                      Item 0
#                                                          Pair 'value'
#                                                              Property 'result'
#                                                                  Lexical variable '$res'
#                                                      Item 1
#                                                          Pair 'quiet'
#                                                              Boolean true
#                                  Instruction
#                                      Call
#                                          Property 'privmsg'
#                                              Lexical variable '$bot'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Property 'channel'
#                                                      Lexical variable '$msg'
#                                              Item 1
#                                                  Lexical variable '$string'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'p'
#                      Item 1
#                          Bareword 'handlePerl'
#          Instruction
#              Call
#                  Property 'addCommand'
#                      Lexical variable '$bot'
#                  Argument list [2 items]
#                      Item 0
#                          String 'pp'
#                      Item 1
#                          Bareword 'handlePerl'
#          Function 'handlePerl' { $msg -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Property 'commandHasParameters'
#                                  Lexical variable '$msg'
#                      If body
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Call
#                              Bareword 'COMPILER'
#                              Argument list [1 item]
#                                  Item 0
#                                      Call
#                                          Bareword 'convertNewlines'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Call
#                                                      Property 'fromWord'
#                                                          Lexical variable '$msg'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$res'
#                          Call
#                              Property 'compile'
#                                  Lexical variable '$c'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          Property 'command'
#                                              Lexical variable '$msg'
#                                          Equality operator (==)
#                                          String 'p'
#                  If
#                      Expression ('if' parameter)
#                          Property 'error'
#                              Lexical variable '$res'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Call
#                                              Bareword 'Str'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Property 'error'
#                                                          Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$bot'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Property 'perl'
#                                      Lexical variable '$res'
#          Function 'convertNewlines' { $string:Str -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$string'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Property 'join'
#                                  Call
#                                      Property 'split'
#                                          Lexical variable '$string'
#                                      Argument list [1 item]
#                                          Item 0
#                                              String '_NL_'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '␤'
#          Function 'ircsay' { $str:Str }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$str'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$bot'
#                          Argument list [2 items]
#                              Item 0
#                                  Index
#                                      Property 'autojoin'
#                                          Lexical variable '$bot'
#                                      Index list [1 item]
#                                          Item 0
#                                              Number '0'
#                              Item 1
#                                  Lexical variable '$str'
#          Instruction
#              Call
#                  Property 'connect'
#                      Lexical variable '$bot'
#                  Argument list [0 items]
#          Instruction
#              Call
#                  Property 'connect'
#                      Lexical variable '$i'
#                  Argument list [0 items]
#          Include (COMPILER, IRC::Connection, IRCBot::Bot, Str)
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
use Ferret::Core::Operations qw(_not bool equal num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'run.frt', './test/20-irc-complex/run.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'handlePerl' definition
    my $func_0 = function_event_def(
        $f, $context,
        'handlePerl',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 67.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}
                          ->property_u( 'commandHasParameters', $pos->(68.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                $$scope->{'msg'}
                                  ->property_u( 'fromWord', $pos->(70.4) )->(
                                    [ num( $f, "1" ) ], $scope,
                                    undef, $pos->(70.45)
                                  )
                            ],
                            $scope, undef,
                            $pos->(70.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(70.2)
                ),
                $file_scope,
                $pos->(70.1)
            );
            var(
                $scope,
                res => $$scope->{'c'}->property_u( 'compile', $pos->(71.2) )->(
                    [
                        equal(
                            $scope,
                            $pos->(71.4),
                            $$scope->{'msg'}
                              ->property_u( 'command', $pos->(71.35) ),
                            str( $f, "p" )
                        )
                    ],
                    $scope, undef,
                    $pos->(71.25)
                ),
                $file_scope,
                $pos->(71.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(72.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'bot'}->property_u( 'privmsg', $pos->(73.1) )->(
                    [
                        $$scope->{'msg'}
                          ->property_u( 'channel', $pos->(73.25) ),
                        $$scope->{'Str'}->(
                            [
                                $$scope->{'res'}
                                  ->property_u( 'error', $pos->(73.5) )
                            ],
                            $scope, undef,
                            $pos->(73.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(73.15)
                );
                return $ret_func->();
            }
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(76.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(76.25) ),
                    $$scope->{'res'}->property_u( 'perl',    $pos->(76.4) )
                ],
                $scope, undef,
                $pos->(76.15)
            );
            return $ret;
        }
    );

    # Function event 'convertNewlines' definition
    my $func_1 = function_event_def(
        $f, $context,
        'convertNewlines',
        undef,
        [
            {
                name     => 'string',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'string', 80.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(81.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(81.2) )
                  ->property_u( 'join', $pos->(81.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(81.4) ) );
            return $ret;
        }
    );

    # Function event 'ircsay' definition
    my $func_2 = function_event_def(
        $f, $context, 'ircsay', undef,
        [ { name => 'str', type => 'Str', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'str', 85.2 ) || return $ret_func->();
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(86.1) )->(
                [
                    $$scope->{'bot'}->property_u( 'autojoin', $pos->(86.25) )
                      ->get_index_value(
                        [ num( $f, "0" ) ],
                        $scope, $pos->(86.3)
                      ),
                    $$scope->{'str'}
                ],
                $scope, undef,
                $pos->(86.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 7.2 ) || return $ret_func->();
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(8.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(8.25) ),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef,
                $pos->(8.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_4 = function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 12.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}
                          ->property_u( 'commandHasParameters', $pos->(13.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                $$scope->{'msg'}
                                  ->property_u( 'fromWord', $pos->(15.4) )->(
                                    [ num( $f, "1" ) ], $scope,
                                    undef, $pos->(15.45)
                                  )
                            ],
                            $scope, undef,
                            $pos->(15.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(15.2)
                ),
                $file_scope,
                $pos->(15.1)
            );
            var(
                $scope,
                res => $$scope->{'c'}->property_u( 'tokenize', $pos->(16.2) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(16.25)
                ),
                $file_scope,
                $pos->(16.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(17.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'bot'}->property_u( 'privmsg', $pos->(18.1) )->(
                    [
                        $$scope->{'msg'}
                          ->property_u( 'channel', $pos->(18.25) ),
                        $$scope->{'Str'}->(
                            [
                                $$scope->{'res'}
                                  ->property_u( 'error', $pos->(18.5) )
                            ],
                            $scope, undef,
                            $pos->(18.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(18.15)
                );
                return $ret_func->();
            }
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(21.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(21.25) ),
                    $$scope->{'res'}->property_u( 'pretty',  $pos->(21.4) )
                ],
                $scope, undef,
                $pos->(21.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_5 = function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 25.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}
                          ->property_u( 'commandHasParameters', $pos->(26.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                $$scope->{'msg'}
                                  ->property_u( 'fromWord', $pos->(28.4) )->(
                                    [ num( $f, "1" ) ], $scope,
                                    undef, $pos->(28.45)
                                  )
                            ],
                            $scope, undef,
                            $pos->(28.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(28.2)
                ),
                $file_scope,
                $pos->(28.1)
            );
            var(
                $scope,
                res =>
                  $$scope->{'c'}->property_u( 'construct', $pos->(29.2) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(29.25)
                  ),
                $file_scope,
                $pos->(29.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(30.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'bot'}->property_u( 'privmsg', $pos->(31.1) )->(
                    [
                        $$scope->{'msg'}
                          ->property_u( 'channel', $pos->(31.25) ),
                        $$scope->{'Str'}->(
                            [
                                $$scope->{'res'}
                                  ->property_u( 'error', $pos->(31.5) )
                            ],
                            $scope, undef,
                            $pos->(31.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(31.15)
                );
                return $ret_func->();
            }
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(34.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(34.25) ),
                    $$scope->{'res'}->property_u( 'pretty',  $pos->(34.4) )
                ],
                $scope, undef,
                $pos->(34.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_6 = function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 38.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}
                          ->property_u( 'commandHasParameters', $pos->(39.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                $$scope->{'msg'}
                                  ->property_u( 'fromWord', $pos->(41.4) )->(
                                    [ num( $f, "1" ) ], $scope,
                                    undef, $pos->(41.45)
                                  )
                            ],
                            $scope, undef,
                            $pos->(41.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(41.2)
                  )->property_u( 'eval', $pos->(41.7) )
                  ->( [ undef, [] ], $scope, undef, $pos->(41.75) ),
                $file_scope,
                $pos->(41.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(42.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'bot'}->property_u( 'privmsg', $pos->(43.1) )->(
                    [
                        $$scope->{'msg'}
                          ->property_u( 'channel', $pos->(43.25) ),
                        $$scope->{'Str'}->(
                            [
                                $$scope->{'res'}
                                  ->property_u( 'error', $pos->(43.5) )
                            ],
                            $scope, undef,
                            $pos->(43.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(43.15)
                );
                return $ret_func->();
            }
            var(
                $scope,
                string => $$scope->{'inspect'}->(
                    [
                        undef,
                        [
                            value => $$scope->{'res'}
                              ->property_u( 'result', $pos->(46.35) ),
                            quiet => $true
                        ]
                    ],
                    $scope, undef,
                    $pos->(46.2)
                  )->property_u( 'string', $pos->(46.6) ),
                $file_scope,
                $pos->(46.1)
            );
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(47.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(47.25) ),
                    $$scope->{'string'}
                ],
                $scope, undef,
                $pos->(47.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_7 = function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 51.2 ) || return $ret_func->();
            if (
                bool(
                    _not(
                        $$scope->{'msg'}
                          ->property_u( 'commandHasParameters', $pos->(52.4) )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                $$scope->{'msg'}
                                  ->property_u( 'fromWord', $pos->(54.4) )->(
                                    [ num( $f, "1" ) ], $scope,
                                    undef, $pos->(54.45)
                                  )
                            ],
                            $scope, undef,
                            $pos->(54.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(54.2)
                  )->property_u( 'perlEval', $pos->(54.7) )
                  ->( [ undef, [] ], $scope, undef, $pos->(54.75) ),
                $file_scope,
                $pos->(54.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(55.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'bot'}->property_u( 'privmsg', $pos->(56.1) )->(
                    [
                        $$scope->{'msg'}
                          ->property_u( 'channel', $pos->(56.25) ),
                        $$scope->{'Str'}->(
                            [
                                $$scope->{'res'}
                                  ->property_u( 'error', $pos->(56.5) )
                            ],
                            $scope, undef,
                            $pos->(56.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(56.15)
                );
                return $ret_func->();
            }
            var(
                $scope,
                string => $$scope->{'inspect'}->(
                    [
                        undef,
                        [
                            value => $$scope->{'res'}
                              ->property_u( 'result', $pos->(59.35) ),
                            quiet => $true
                        ]
                    ],
                    $scope, undef,
                    $pos->(59.2)
                  )->property_u( 'string', $pos->(59.6) ),
                $file_scope,
                $pos->(59.1)
            );
            $$scope->{'bot'}->property_u( 'privmsg', $pos->(60.1) )->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(60.25) ),
                    $$scope->{'string'}
                ],
                $scope, undef,
                $pos->(60.15)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        handlePerl => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        convertNewlines => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope(
        ircsay => $scope,
        $context, undef, $ins, undef, undef
    );
    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name,
        qw(COMPILER IRC::Connection IRCBot::Bot Str) );
    var(
        $context,
        bot => $$scope->{'IRCBot::Bot'}->(
            [
                undef,
                [
                    addr => str( $f, "k.notroll.net" ),
                    nick => str( $f, "bootie" ),
                    user => str( $f, "ferret" )
                ]
            ],
            $scope, undef,
            $pos->(1.35)
        ),
        undef,
        $pos->(1.15)
    );
    var(
        $context,
        i => $$scope->{'IRC::Connection'}->(
            [
                undef,
                [
                    addr => str( $f, "k.notroll.net" ),
                    nick => str( $f, "booby" ),
                    user => str( $f, "ferret" )
                ]
            ],
            $scope, undef,
            $pos->(2.35)
        ),
        undef,
        $pos->(2.15)
    );
    $$scope->{'bot'}->set_property(
        autojoin => create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(3.3)
    );
    $$scope->{'i'}->set_property(
        autojoin => create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(4.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(6.2) )->(
        [
            str( $f, "info" ),
            $func_3->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(6.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(11.2) )->(
        [
            str( $f, "t" ),
            $func_4->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(11.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(24.2) )->(
        [
            str( $f, "c" ),
            $func_5->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(24.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(37.2) )->(
        [
            str( $f, "e" ),
            $func_6->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(37.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(50.2) )->(
        [
            str( $f, "pe" ),
            $func_7->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(50.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(63.2) )->(
        [ str( $f, "p" ), $$scope->{'handlePerl'} ],
        $scope, undef, $pos->(63.3)
    );
    $$scope->{'bot'}->property_u( 'addCommand', $pos->(64.2) )->(
        [ str( $f, "pp" ), $$scope->{'handlePerl'} ],
        $scope, undef, $pos->(64.3)
    );
    $$scope->{'bot'}->property_u( 'connect', $pos->(89.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(89.3) );
    $$scope->{'i'}->property_u( 'connect', $pos->(90.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(90.3) );
};

after_content($file_name);
