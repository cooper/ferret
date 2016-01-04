# === Document Model ===
#  Document './test/20-irc-complex/run.frt'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$bot'
#                  Call
#                      Bareword 'IRC::Bot'
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
#          Assignment
#              Property 'autojoin'
#                  Lexical variable '$bot'
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
#                                                      Property 'error'
#                                                          Lexical variable '$res'
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
#                                                      Property 'error'
#                                                          Lexical variable '$res'
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
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'handlePerl' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'handlePerl',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 66.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            my $lv_c = FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}
                                  ->( [ num( $f, 1 ) ], $scope, undef, 69.45 )
                            ],
                            $scope, undef, 69.3
                        )
                    ],
                    $scope, undef, 69.2
                ),
                $file_scope,
                69.1
            );
            my $lv_res = FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'compile'}->(
                    [
                        equal(
                            $scope,
                            ${ $$scope->{'msg'} }->{'command'},
                            str( $f, "p" )
                        )
                    ],
                    $scope, undef, 70.25
                ),
                $file_scope,
                70.1
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        ${ $$scope->{'res'} }->{'error'}
                    ],
                    $scope, undef, 72.15
                );
                return $ret->return();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'perl'}
                ],
                $scope, undef, 75.15
            );
            return $ret->return;
        }
    );

    # Function event 'convertNewlines' definition
    my $func_1 = FF::function_event_def(
        $f, $context,
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
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'string', 79.2 ) or return;
            return $ret->return(
                ${
                    ${ $$scope->{'string'} }->{'split'}
                      ->( [ str( $f, "_NL_" ) ], $scope, undef, 80.2 )
                }->{'join'}->( [ str( $f, "\n" ) ], $scope, undef, 80.4 )
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 6.2 ) or return;
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef, 7.15
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 11.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            my $lv_c = FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}
                                  ->( [ num( $f, 1 ) ], $scope, undef, 14.45 )
                            ],
                            $scope, undef, 14.3
                        )
                    ],
                    $scope, undef, 14.2
                ),
                $file_scope,
                14.1
            );
            my $lv_res = FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'tokenize'}
                  ->( { pretty => $true }, $scope, undef, 15.25 ),
                $file_scope, 15.1
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        ${ $$scope->{'res'} }->{'error'}
                    ],
                    $scope, undef, 17.15
                );
                return $ret->return();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'pretty'}
                ],
                $scope, undef, 20.15
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_4 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 24.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            my $lv_c = FF::lex_assign(
                $scope,
                c => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'convertNewlines'}->(
                            [
                                ${ $$scope->{'msg'} }->{'fromWord'}
                                  ->( [ num( $f, 1 ) ], $scope, undef, 27.45 )
                            ],
                            $scope, undef, 27.3
                        )
                    ],
                    $scope, undef, 27.2
                ),
                $file_scope,
                27.1
            );
            my $lv_res = FF::lex_assign(
                $scope,
                res => ${ $$scope->{'c'} }->{'construct'}
                  ->( { pretty => $true }, $scope, undef, 28.25 ),
                $file_scope, 28.1
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        ${ $$scope->{'res'} }->{'error'}
                    ],
                    $scope, undef, 30.15
                );
                return $ret->return();
            }
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    ${ $$scope->{'res'} }->{'pretty'}
                ],
                $scope, undef, 33.15
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_5 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 37.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            my $lv_res = FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'convertNewlines'}->(
                                [
                                    ${ $$scope->{'msg'} }->{'fromWord'}->(
                                        [ num( $f, 1 ) ], $scope,
                                        undef, 40.45
                                    )
                                ],
                                $scope, undef, 40.3
                            )
                        ],
                        $scope, undef, 40.2
                    )
                  }->{'eval'}->( {}, $scope, undef, 40.75 ),
                $file_scope,
                40.1
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        ${ $$scope->{'res'} }->{'error'}
                    ],
                    $scope, undef, 42.15
                );
                return $ret->return();
            }
            my $lv_string = FF::lex_assign(
                $scope,
                string => ${
                    $$scope->{'inspect'}->(
                        {
                            value => ${ $$scope->{'res'} }->{'result'},
                            quiet => $true
                        },
                        $scope, undef, 45.2
                    )
                  }->{'string'},
                $file_scope,
                45.1
            );
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [ ${ $$scope->{'msg'} }->{'channel'}, $$scope->{'string'} ],
                $scope, undef, 46.15
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_6 = FF::function_def(
        $f, undef, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 50.2 ) or return;
            if ( bool( _not( ${ $$scope->{'msg'} }->{'commandHasParameters'} ) )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            my $lv_res = FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'convertNewlines'}->(
                                [
                                    ${ $$scope->{'msg'} }->{'fromWord'}->(
                                        [ num( $f, 1 ) ], $scope,
                                        undef, 53.45
                                    )
                                ],
                                $scope, undef, 53.3
                            )
                        ],
                        $scope, undef, 53.2
                    )
                  }->{'perlEval'}->( {}, $scope, undef, 53.75 ),
                $file_scope,
                53.1
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'bot'} }->{'privmsg'}->(
                    [
                        ${ $$scope->{'msg'} }->{'channel'},
                        ${ $$scope->{'res'} }->{'error'}
                    ],
                    $scope, undef, 55.15
                );
                return $ret->return();
            }
            my $lv_string = FF::lex_assign(
                $scope,
                string => ${
                    $$scope->{'inspect'}->(
                        {
                            value => ${ $$scope->{'res'} }->{'result'},
                            quiet => $true
                        },
                        $scope, undef, 58.2
                    )
                  }->{'string'},
                $file_scope,
                58.1
            );
            ${ $$scope->{'bot'} }->{'privmsg'}->(
                [ ${ $$scope->{'msg'} }->{'channel'}, $$scope->{'string'} ],
                $scope, undef, 59.15
            );
            return $ret->return;
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
    FF::load_namespaces( $context, qw(COMPILER IRC IRC::Bot Str) );
    my $lv_bot = FF::lex_assign(
        $context,
        bot => $$scope->{'IRC::Bot'}->(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope, undef, 1.35
        ),
        undef,
        1.15
    );
    $$scope->{'bot'}->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        3.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "info" ),
            $func_2->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 5.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "t" ),
            $func_3->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 10.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "c" ),
            $func_4->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 23.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "e" ),
            $func_5->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 36.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}->(
        [
            str( $f, "pe" ),
            $func_6->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 49.3
    );
    ${ $$scope->{'bot'} }->{'addCommand'}
      ->( [ str( $f, "p" ), $$scope->{'handlePerl'} ], $scope, undef, 62.3 );
    ${ $$scope->{'bot'} }->{'addCommand'}
      ->( [ str( $f, "pp" ), $$scope->{'handlePerl'} ], $scope, undef, 63.3 );
    ${ $$scope->{'bot'} }->{'connect'}->( {}, $scope, undef, 83.3 );
};

FF::after_content();
