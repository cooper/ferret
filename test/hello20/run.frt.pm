# === Document Model ===
#  Document './test/hello20/run.frt'
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
#                          Function body
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
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Function body
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment (lexical variable '$c')
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Call
#                                                      Property 'fromWord'
#                                                          Lexical variable '$msg'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Number '1'
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
#                                  Function body
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
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Function body
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment (lexical variable '$c')
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Call
#                                                      Property 'fromWord'
#                                                          Lexical variable '$msg'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Number '1'
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
#                                  Function body
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
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'commandHasParameters'
#                                              Lexical variable '$msg'
#                                  Function body
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
#                                                              Property 'fromWord'
#                                                                  Lexical variable '$msg'
#                                                              Argument list [1 items]
#                                                                  Item 0
#                                                                      Number '1'
#                                          Argument list [0 items]
#                              If
#                                  Expression ('if' parameter)
#                                      Property 'error'
#                                          Lexical variable '$res'
#                                  Function body
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
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              If
#                  Expression ('if' parameter)
#                      Negation
#                          Property 'commandHasParameters'
#                              Lexical variable '$msg'
#                  Function body
#                      Instruction
#                          Return
#              Instruction
#                  Assignment (lexical variable '$c')
#                      Call
#                          Bareword 'COMPILER'
#                          Argument list [1 items]
#                              Item 0
#                                  Call
#                                      Property 'fromWord'
#                                          Lexical variable '$msg'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Number '1'
#              Instruction
#                  Assignment (lexical variable '$res')
#                      Call
#                          Property 'compile'
#                              Lexical variable '$c'
#                          Argument list [1 items]
#                              Item 0
#                                  Equality
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                                      String 'p'
#              If
#                  Expression ('if' parameter)
#                      Property 'error'
#                          Lexical variable '$res'
#                  Function body
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
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (COMPILER, IRC, IRC::Bot)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('run.frt');

use Ferret::Core::Operations qw(_not bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'handlePerl' callback definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'handlePerl',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg' ) or return;
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
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope, undef, 55 )
                    ],
                    $scope, undef, 55
                )
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('compile')->call_u(
                    [
                        $scope->property_u('msg')->property_u('command')
                          ->equal_to( str( $f, "p" ), $scope )
                    ],
                    $scope, undef, 56
                )
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 58
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('perl')
                ],
                $scope, undef, 61
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg' ) or return;
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef, 6
            );
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
            FF::need( $scope, $arguments, 'msg' ) or return;
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
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope, undef, 13 )
                    ],
                    $scope, undef, 13
                )
            );
            $scope->set_property_ow( $context,
                res => $scope->property_u('c')->property_u('tokenize')
                  ->call_u( { pretty => Ferret::true }, $scope, undef, 14 ) );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 16
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 19
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
            FF::need( $scope, $arguments, 'msg' ) or return;
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
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope, undef, 26 )
                    ],
                    $scope, undef, 26
                )
            );
            $scope->set_property_ow( $context,
                res => $scope->property_u('c')->property_u('construct')
                  ->call_u( { pretty => Ferret::true }, $scope, undef, 27 ) );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 29
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 32
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
            FF::need( $scope, $arguments, 'msg' ) or return;
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
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope, undef, 39 )
                    ],
                    $scope, undef, 39
                )->property_u('eval')->call_u( {}, $scope, undef, 39 )
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 41
                );
                return $return;
            }
            $scope->set_property_ow(
                $context,
                string => $scope->property_u('inspect')->call_u(
                    {
                        value =>
                          $scope->property_u('res')->property_u('result'),
                        quiet => Ferret::true
                    },
                    $scope, undef, 44
                )->property_u('string')
            );
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('string')
                ],
                $scope, undef, 45
            );
            return $return;
        }
    );
    $func_0->inside_scope( handlePerl => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(COMPILER IRC IRC::Bot) );
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('IRC::Bot')->call_u(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope, undef, 1
        )
    );
    $scope->property_u('bot')
      ->set_property( autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ) );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "info" ),
            $func_1->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 4
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "t" ),
            $func_2->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 9
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "c" ),
            $func_3->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 22
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "e" ),
            $func_4->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 35
    );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "p" ), $scope->property_u('handlePerl') ],
        $scope, undef, 48 );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "pp" ), $scope->property_u('handlePerl') ],
        $scope, undef, 49 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 64 );
};

FF::after_content();
