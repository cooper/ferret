# === Document Model ===
#  Document './test/20-irc-complex/run.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
#              Call
#                  Bareword 'IRC::Bot'
#                  Named argument list [3 items]
#                      Item 0
#                          Pair 'addr'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'nick'
#                              String 'bottie'
#                      Item 2
#                          Pair 'user'
#                              String 'ferret'
#      Instruction
#          Assignment (property 'autojoin')
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
#                                  Assignment (lexical variable '$c')
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
#                                  Assignment (lexical variable '$res')
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
#                                                      Property 'error'
#                                                          Lexical variable '$res'
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
#                                  Assignment (lexical variable '$c')
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
#                                  Assignment (lexical variable '$res')
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
#                                                      Property 'error'
#                                                          Lexical variable '$res'
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
#                                  Assignment (lexical variable '$res')
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
#                                                      Property 'error'
#                                                          Lexical variable '$res'
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment (lexical variable '$string')
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
#                  Assignment (lexical variable '$c')
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
#                  Assignment (lexical variable '$res')
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
#                                      Property 'error'
#                                          Lexical variable '$res'
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
#                      Bareword 'Str'
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
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (COMPILER, IRC, IRC::Bot, Str)
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

FF::before_content('run.frt');

use Ferret::Core::Operations qw(_not bool equal num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'handlePerl' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'handlePerl',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 52.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 55.45
                                  )
                            ],
                            $scope, undef, 55.3
                        )
                    ],
                    $scope, undef, 55.2
                ),
                55.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('compile')->call_u(
                    [
                        equal(
                            $scope,
                            $scope->property_u('msg')->property_u('command'),
                            str( $f, "p" )
                        )
                    ],
                    $scope, undef, 56.25
                ),
                56.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 58.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('perl')
                ],
                $scope, undef, 61.15
            );
            return $return;
        }
    );

    # Function event 'convertNewlines' definition
    my $func_1 = FF::function_event_def(
        $f, $scope,
        'convertNewlines',
        [
            {
                name     => 'string',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'string', 65.2 ) or return;
            return $scope->property_u('string')->property_u('split')
              ->call_u( [ str( $f, "_NL_" ) ], $scope, undef, 66.2 )
              ->property_u('join')
              ->call_u( [ str( $f, "\n" ) ], $scope, undef, 66.4 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 5.2 ) or return;
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef, 6.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 10.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 13.45
                                  )
                            ],
                            $scope, undef, 13.3
                        )
                    ],
                    $scope, undef, 13.2
                ),
                13.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('tokenize')
                  ->call_u( { pretty => $true }, $scope, undef, 14.25 ),
                14.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 16.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 19.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_4 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 23.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 26.45
                                  )
                            ],
                            $scope, undef, 26.3
                        )
                    ],
                    $scope, undef, 26.2
                ),
                26.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('construct')
                  ->call_u( { pretty => $true }, $scope, undef, 27.25 ),
                27.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 29.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 32.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_5 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 36.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 39.45
                                  )
                            ],
                            $scope, undef, 39.3
                        )
                    ],
                    $scope, undef, 39.2
                  )->property_u('eval')->call_u( {}, $scope, undef, 39.75 ),
                39.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 41.15
                );
                return $return;
            }
            $scope->set_property_ow(
                $context,
                string => $scope->property_u('inspect')->call_u(
                    {
                        value =>
                          $scope->property_u('res')->property_u('result'),
                        quiet => $true
                    },
                    $scope, undef, 44.2
                  )->property_u('string'),
                44.1
            );
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('string')
                ],
                $scope, undef, 45.15
            );
            return $return;
        }
    );
    $func_0->inside_scope( handlePerl => $scope, $scope, undef, undef, undef );
    $func_1->inside_scope(
        convertNewlines => $scope,
        $scope, undef, undef, undef
    );
    FF::load_namespaces( $context, qw(COMPILER IRC IRC::Bot Str) );
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('IRC::Bot')->call_u(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope, undef, 1.3
        ),
        1.1
    );
    $scope->property_u('bot')->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        2.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "info" ),
            $func_2->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 4.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "t" ),
            $func_3->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 9.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "c" ),
            $func_4->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 22.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "e" ),
            $func_5->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 35.3
    );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "p" ), $scope->property_u('handlePerl') ],
        $scope, undef, 48.3 );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "pp" ), $scope->property_u('handlePerl') ],
        $scope, undef, 49.3 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 69.3 );
};

FF::after_content();
