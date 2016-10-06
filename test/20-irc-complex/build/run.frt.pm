# === Document Model ===
#  Document './test/20-irc-complex/run.frt'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$bot'
#                  Call
#                      Bareword 'IRCBot::Bot'
#                      Named argument list [3 items]
#                          Item 0
#                              Pair 'addr'
#                                  String 'k.notroll.net'
#                          Item 1
#                              Pair 'nick'
#                                  String 'bottie'
#                          Item 2
#                              Pair 'user'
#                                  String 'ferret'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$i'
#                  Call
#                      Bareword 'IRC::Connection'
#                      Named argument list [3 items]
#                          Item 0
#                              Pair 'addr'
#                                  String 'k.notroll.net'
#                          Item 1
#                              Pair 'nick'
#                                  String 'booby'
#                          Item 2
#                              Pair 'user'
#                                  String 'ferret'
#      Instruction
#          Assignment
#              Property 'autojoin'
#                  Lexical variable '$bot'
#              Value list [1 items]
#                  Item 0
#                      String '#k'
#      Instruction
#          Assignment
#              Property 'autojoin'
#                  Lexical variable '$i'
#              Value list [1 items]
#                  Item 0
#                      String '#k'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'info'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              String 'Ferret IRC...'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 't'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$c'
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Call
#                                                      Bareword 'convertNewlines'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Call
#                                                                  Property 'fromWord'
#                                                                      Lexical variable '$msg'
#                                                                  Argument list [1 items]
#                                                                      Item 0
#                                                                          Number '1'
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$res'
#                                      Call
#                                          Property 'tokenize'
#                                              Lexical variable '$c'
#                                          Named argument list [1 items]
#                                              Item 0
#                                                  Pair 'pretty'
#                                                      Boolean true
#                              If
#                                  Expression ('if' parameter)
#                                      Property 'error'
#                                          Lexical variable '$res'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Call
#                                              Property 'privmsg'
#                                                  Lexical variable '$bot'
#                                              Argument list [2 items]
#                                                  Item 0
#                                                      Property 'channel'
#                                                          Lexical variable '$msg'
#                                                  Item 1
#                                                      Call
#                                                          Bareword 'String'
#                                                          Argument list [1 items]
#                                                              Item 0
#                                                                  Property 'error'
#                                                                      Lexical variable '$res'
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'pretty'
#                                                  Lexical variable '$res'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'c'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$c'
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Call
#                                                      Bareword 'convertNewlines'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Call
#                                                                  Property 'fromWord'
#                                                                      Lexical variable '$msg'
#                                                                  Argument list [1 items]
#                                                                      Item 0
#                                                                          Number '1'
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$res'
#                                      Call
#                                          Property 'construct'
#                                              Lexical variable '$c'
#                                          Named argument list [1 items]
#                                              Item 0
#                                                  Pair 'pretty'
#                                                      Boolean true
#                              If
#                                  Expression ('if' parameter)
#                                      Property 'error'
#                                          Lexical variable '$res'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Call
#                                              Property 'privmsg'
#                                                  Lexical variable '$bot'
#                                              Argument list [2 items]
#                                                  Item 0
#                                                      Property 'channel'
#                                                          Lexical variable '$msg'
#                                                  Item 1
#                                                      Call
#                                                          Bareword 'String'
#                                                          Argument list [1 items]
#                                                              Item 0
#                                                                  Property 'error'
#                                                                      Lexical variable '$res'
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'pretty'
#                                                  Lexical variable '$res'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'e'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$res'
#                                      Call
#                                          Property 'eval'
#                                              Call
#                                                  Bareword 'COMPILER'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Call
#                                                              Bareword 'convertNewlines'
#                                                              Argument list [1 items]
#                                                                  Item 0
#                                                                      Call
#                                                                          Property 'fromWord'
#                                                                              Lexical variable '$msg'
#                                                                          Argument list [1 items]
#                                                                              Item 0
#                                                                                  Number '1'
#                                          Argument list [0 items]
#                              If
#                                  Expression ('if' parameter)
#                                      Property 'error'
#                                          Lexical variable '$res'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Call
#                                              Property 'privmsg'
#                                                  Lexical variable '$bot'
#                                              Argument list [2 items]
#                                                  Item 0
#                                                      Property 'channel'
#                                                          Lexical variable '$msg'
#                                                  Item 1
#                                                      Call
#                                                          Bareword 'String'
#                                                          Argument list [1 items]
#                                                              Item 0
#                                                                  Property 'error'
#                                                                      Lexical variable '$res'
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$string'
#                                      Property 'string'
#                                          Call
#                                              Bareword 'inspect'
#                                              Named argument list [2 items]
#                                                  Item 0
#                                                      Pair 'value'
#                                                          Property 'result'
#                                                              Lexical variable '$res'
#                                                  Item 1
#                                                      Pair 'quiet'
#                                                          Boolean true
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Lexical variable '$string'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'pe'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$res'
#                                      Call
#                                          Property 'perlEval'
#                                              Call
#                                                  Bareword 'COMPILER'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Call
#                                                              Bareword 'convertNewlines'
#                                                              Argument list [1 items]
#                                                                  Item 0
#                                                                      Call
#                                                                          Property 'fromWord'
#                                                                              Lexical variable '$msg'
#                                                                          Argument list [1 items]
#                                                                              Item 0
#                                                                                  Number '1'
#                                          Argument list [0 items]
#                              If
#                                  Expression ('if' parameter)
#                                      Property 'error'
#                                          Lexical variable '$res'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Call
#                                              Property 'privmsg'
#                                                  Lexical variable '$bot'
#                                              Argument list [2 items]
#                                                  Item 0
#                                                      Property 'channel'
#                                                          Lexical variable '$msg'
#                                                  Item 1
#                                                      Call
#                                                          Bareword 'String'
#                                                          Argument list [1 items]
#                                                              Item 0
#                                                                  Property 'error'
#                                                                      Lexical variable '$res'
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$string'
#                                      Property 'string'
#                                          Call
#                                              Bareword 'inspect'
#                                              Named argument list [2 items]
#                                                  Item 0
#                                                      Pair 'value'
#                                                          Property 'result'
#                                                              Lexical variable '$res'
#                                                  Item 1
#                                                      Pair 'quiet'
#                                                          Boolean true
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Lexical variable '$string'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'p'
#                  Item 1
#                      Bareword 'handlePerl'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Argument list [2 items]
#                  Item 0
#                      String 'pp'
#                  Item 1
#                      Bareword 'handlePerl'
#      Function 'handlePerl'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              If
#                  Expression ('if' parameter)
#                      Negation
#                          Property 'commandHasParameters'
#                              Lexical variable '$msg'
#                  Body ('if' scope)
#                      Instruction
#                          Return
#              Instruction
#                  Assignment
#                      Lexical variable '$c'
#                      Call
#                          Bareword 'COMPILER'
#                          Argument list [1 items]
#                              Item 0
#                                  Call
#                                      Bareword 'convertNewlines'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Call
#                                                  Property 'fromWord'
#                                                      Lexical variable '$msg'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Number '1'
#              Instruction
#                  Assignment
#                      Lexical variable '$res'
#                      Call
#                          Property 'compile'
#                              Lexical variable '$c'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                                      Equality operator (==)
#                                      String 'p'
#              If
#                  Expression ('if' parameter)
#                      Property 'error'
#                          Lexical variable '$res'
#                  Body ('if' scope)
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$bot'
#                              Argument list [2 items]
#                                  Item 0
#                                      Property 'channel'
#                                          Lexical variable '$msg'
#                                  Item 1
#                                      Call
#                                          Bareword 'String'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Property 'error'
#                                                      Lexical variable '$res'
#                      Instruction
#                          Return
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$bot'
#                      Argument list [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Property 'perl'
#                                  Lexical variable '$res'
#      Function 'convertNewlines'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$string'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Return
#                      Call
#                          Property 'join'
#                              Call
#                                  Property 'split'
#                                      Lexical variable '$string'
#                                  Argument list [1 items]
#                                      Item 0
#                                          String '_NL_'
#                          Argument list [1 items]
#                              Item 0
#                                  String '␤'
#      Function 'ircsay'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$str'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$bot'
#                      Argument list [2 items]
#                          Item 0
#                              Index
#                                  Property 'autojoin'
#                                      Lexical variable '$bot'
#                                  Index list [1 items]
#                                      Item 0
#                                          Number '0'
#                          Item 1
#                              Lexical variable '$str'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$i'
#              Argument list [0 items]
#      Include (COMPILER, IRC, IRC::Connection, IRCBot, IRCBot::Bot, Str, String)
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

my $pos = FF::before_content( 'run.frt', './test/20-irc-complex/run.frt' );

use Ferret::Core::Operations qw(_not bool equal num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'handlePerl' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'handlePerl',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 67.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}->(
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
            FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'compile'}->(
                    [
                        equal(
                            $scope,
                            ${ $$scope->{'msg'} }->{'command'},
                            str( $f, "p" )
                        )
                    ],
                    $scope, undef,
                    $pos->(71.25)
                ),
                $file_scope,
                $pos->(71.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        $$scope->{'String'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(73.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(73.15)
                );
                return $ret_func->();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'perl'}
                ],
                $scope, undef,
                $pos->(76.15)
            );
            return $ret;
        }
    );

    # Function event 'convertNewlines' definition
    my $func_1 = FF::function_event_def(
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
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'string', 80.2 ) or return;
            return $ret_func->(
                ${
                    ${ $$scope->{'string'} }->{'split'}
                      ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(81.2) )
                  }->{'join'}
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(81.4) )
            );
            return $ret;
        }
    );

    # Function event 'ircsay' definition
    my $func_2 = FF::function_event_def(
        $f, $context, 'ircsay', undef,
        [ { name => 'str', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'str', 85.2 ) or return;
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'bot'} }->{'autojoin'}->get_index_value(
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
    my $func_3 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 7.2 ) or return;
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef,
                $pos->(8.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_4 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 12.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}->(
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
            FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'tokenize'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(16.25)
                ),
                $file_scope,
                $pos->(16.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        $$scope->{'String'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(18.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(18.15)
                );
                return $ret_func->();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'pretty'}
                ],
                $scope, undef,
                $pos->(21.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_5 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 25.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}->(
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
            FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'construct'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(29.25)
                ),
                $file_scope,
                $pos->(29.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        $$scope->{'String'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(31.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(31.15)
                );
                return $ret_func->();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'pretty'}
                ],
                $scope, undef,
                $pos->(34.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_6 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 38.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'convertNewlines'}->(
                                [
                                    ${ $$scope->{'msg'} }->{'fromWord'}->(
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
                    )
                  }->{'eval'}->( [ undef, [] ], $scope, undef, $pos->(41.75) ),
                $file_scope,
                $pos->(41.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        $$scope->{'String'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(43.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(43.15)
                );
                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                string => ${
                    $$scope->{'inspect'}->(
                        [
                            undef,
                            [
                                value => ${ $$scope->{'res'} }->{'result'},
                                quiet => $true
                            ]
                        ],
                        $scope, undef,
                        $pos->(46.2)
                    )
                  }->{'string'},
                $file_scope,
                $pos->(46.1)
            );
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [ ${ $$scope->{'msg'} }->{'channel'}, $$scope->{'string'} ],
                $scope, undef, $pos->(47.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_7 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 51.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'convertNewlines'}->(
                                [
                                    ${ $$scope->{'msg'} }->{'fromWord'}->(
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
                    )
                  }->{'perlEval'}
                  ->( [ undef, [] ], $scope, undef, $pos->(54.75) ),
                $file_scope,
                $pos->(54.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        $$scope->{'String'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(56.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(56.15)
                );
                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                string => ${
                    $$scope->{'inspect'}->(
                        [
                            undef,
                            [
                                value => ${ $$scope->{'res'} }->{'result'},
                                quiet => $true
                            ]
                        ],
                        $scope, undef,
                        $pos->(59.2)
                    )
                  }->{'string'},
                $file_scope,
                $pos->(59.1)
            );
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [ ${ $$scope->{'msg'} }->{'channel'}, $$scope->{'string'} ],
                $scope, undef, $pos->(60.15)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        handlePerl => $scope,
        $context, undef, undef, undef
    );
    $func_1->inside_scope(
        convertNewlines => $scope,
        $context, undef, undef, undef
    );
    $func_2->inside_scope( ircsay => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context,
        qw(COMPILER IRC IRC::Connection IRCBot IRCBot::Bot Str String) );
    FF::lex_assign(
        $context,
        bot => $$scope->{'IRCBot::Bot'}->(
            [
                undef,
                [
                    addr => str( $f, "k.notroll.net" ),
                    nick => str( $f, "bottie" ),
                    user => str( $f, "ferret" )
                ]
            ],
            $scope, undef,
            $pos->(1.35)
        ),
        undef,
        $pos->(1.15)
    );
    FF::lex_assign(
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
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(3.3)
    );
    $$scope->{'i'}->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(4.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "info" ),
            $func_3->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef,
        $pos->(6.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "t" ),
            $func_4->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef,
        $pos->(11.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "c" ),
            $func_5->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef,
        $pos->(24.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "e" ),
            $func_6->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef,
        $pos->(37.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "pe" ),
            $func_7->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef,
        $pos->(50.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [ str( $f, "p" ), $$scope->{'handlePerl'} ],
        $scope, undef, $pos->(63.3)
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [ str( $f, "pp" ), $$scope->{'handlePerl'} ],
        $scope, undef, $pos->(64.3)
    );
    ${ $$scope->{'bot'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(89.3) );
    ${ $$scope->{'i'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(90.3) );
};

FF::after_content();
