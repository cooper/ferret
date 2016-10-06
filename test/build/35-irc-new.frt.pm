# === Document Model ===
#  Document './test/35-irc-new.frt'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$bot'
#                  Call
#                      Bareword 'IRC::Bot'
#                      Argument list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'info'
#                  Property 'commands'
#                      Lexical variable '$bot'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'Ferret IRC...'
#      On
#          Expression ('on' parameter)
#              Property 'e'
#                  Property 'commands'
#                      Lexical variable '$bot'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                  Instruction
#                      Assignment
#                          Lexical variable '$res'
#                          Call
#                              Property 'eval'
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Call
#                                                  Bareword 'getParameter'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Lexical variable '$msg'
#                              Argument list [0 items]
#                  If
#                      Expression ('if' parameter)
#                          Property 'error'
#                              Lexical variable '$res'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$channel'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Call
#                                              Bareword 'Str'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      Property 'error'
#                                                          Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment
#                          Lexical variable '$string'
#                          Property 'string'
#                              Call
#                                  Bareword 'inspect'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'value'
#                                              Property 'result'
#                                                  Lexical variable '$res'
#                                      Item 1
#                                          Pair 'quiet'
#                                              Boolean true
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$string'
#      Function 'getParameter'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#                      Argument type
#                          Bareword 'IRC::Massage'
#              Instruction
#                  Assignment
#                      Lexical variable '$string'
#                      Operation
#                          Call
#                              Property 'fromWord'
#                                  Index
#                                      Property 'params'
#                                          Lexical variable '$msg'
#                                      Index list [1 items]
#                                          Item 0
#                                              Number '1'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '1'
#                          Logical or operator (||)
#                          String ''
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
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$conn'
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
#                  Lexical variable '$conn'
#              Value list [1 items]
#                  Item 0
#                      String '#k'
#      Instruction
#          Call
#              Property 'addConnection'
#                  Lexical variable '$bot'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Bareword 'IRC::Connection'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$conn'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (COMPILER, IRC, IRC::Bot, IRC::Connection, IRC::Massage, Str)
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

my $pos = FF::before_content( '35-irc-new.frt', './test/35-irc-new.frt' );

use Ferret::Core::Operations qw(any_true bool num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'getParameter' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'getParameter',
        undef,
        [
            {
                name     => 'msg',
                type     => 'IRC::Massage',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 20.2 ) or return;
            FF::lex_assign(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        ${
                            ${ $$scope->{'msg'} }->{'params'}
                              ->get_index_value( [ num( $f, "1" ) ],
                                $scope, $pos->(21.25) )
                          }->{'fromWord'}->( [ num( $f, "1" ) ], $scope, undef,
                            $pos->(21.45) );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(21.1)
            );
            return $ret_func->(
                ${
                    ${ $$scope->{'string'} }->{'split'}
                      ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(22.2) )
                  }->{'join'}
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(22.4) )
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [
            {
                name     => 'channel',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'channel', 4.2 ) or return;
            ${ $$scope->{'channel'} }->{'privmsg'}
              ->( [ str( $f, "Ferret IRC bot" ) ], $scope, undef, $pos->(5.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [
            { name => 'msg', type => undef, optional => undef, more => undef },
            {
                name     => 'channel',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg',     9.2 ) or return;
            FF::need( $scope, $args, 'channel', 9.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(10.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(10.2)
                    )
                  }->{'eval'}->( [ undef, [] ], $scope, undef, $pos->(10.55) ),
                $file_scope,
                $pos->(10.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [
                        $$scope->{'Str'}->(
                            [ ${ $$scope->{'res'} }->{'error'} ],
                            $scope, undef, $pos->(12.25)
                        )
                    ],
                    $scope, undef,
                    $pos->(12.15)
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
                        $pos->(15.2)
                    )
                  }->{'string'},
                $file_scope,
                $pos->(15.1)
            );
            ${ $$scope->{'channel'} }->{'privmsg'}
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(16.3) );
            return $ret;
        }
    );
    $func_0->inside_scope(
        getParameter => $scope,
        $context, undef, undef, undef
    );
    FF::load_namespaces( $context,
        qw(COMPILER IRC IRC::Bot IRC::Connection IRC::Massage Str) );
    FF::lex_assign(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(1.35) ),
        undef, $pos->(1.15)
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'info',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'e',
        $self,
        $scope,
        $func_2->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::lex_assign(
        $context,
        conn => $$scope->{'IRC::Connection'}->(
            [
                undef,
                [
                    addr => str( $f, "k.notroll.net" ),
                    nick => str( $f, "booby" ),
                    user => str( $f, "ferret" )
                ]
            ],
            $scope, undef,
            $pos->(25.35)
        ),
        undef,
        $pos->(25.15)
    );
    $$scope->{'conn'}->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(26.3)
    );
    ${ $$scope->{'bot'} }->{'addConnection'}->(
        [
            $$scope->{'IRC::Connection'}
              ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(27.35) )
        ],
        $scope, undef,
        $pos->(27.15)
    );
    ${ $$scope->{'bot'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(28.3) );
};

FF::after_content();
