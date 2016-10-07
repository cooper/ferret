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
#      Instruction
#          Assignment
#              Property 'factoids'
#                  Lexical variable '$bot'
#              Hash [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'add'
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
#                          Lexical variable '$message'
#                          Index
#                              Property 'params'
#                                  Lexical variable '$msg'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$parts'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 items]
#                                  Item 0
#                                      Regex /\s+/
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'length'
#                                  Lexical variable '$parts'
#                              Less than operator (<)
#                              Number '3'
#                      Body ('if' scope)
#                          Instruction
#                              Fail (nonfatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :ParameterError
#                                          Item 1
#                                              String 'Not enough...'
#                  Instruction
#                      Assignment
#                          Lexical variable '$command'
#                          Index
#                              Lexical variable '$parts'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$response'
#                          Call
#                              Property 'fromWord'
#                                  Lexical variable '$message'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment
#                          Index
#                              This variable '%factoids'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                          Bareword 'respondFactoid'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'OK, I will...'
#                                      Addition operator (+)
#                                      Lexical variable '$command'
#                                      Addition operator (+)
#                                      String ' with ''
#                                      Addition operator (+)
#                                      Lexical variable '$response'
#                                      Addition operator (+)
#                                      String '''
#      Function 'respondFactoid'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Need
#                      Lexical variable '$channel'
#              Instruction
#                  Assignment
#                      Lexical variable '$command'
#                      Call
#                          Property 'trimPrefix'
#                              Call
#                                  Property 'word'
#                                      Index
#                                          Property 'params'
#                                              Lexical variable '$msg'
#                                          Index list [1 items]
#                                              Item 0
#                                                  Number '1'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Number '0'
#                          Argument list [1 items]
#                              Item 0
#                                  String '.'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 items]
#                          Item 0
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 items]
#                                      Item 0
#                                          Lexical variable '$command'
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
#                                          Property 'error'
#                                              Lexical variable '$res'
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
#      On
#          Expression ('on' parameter)
#              Property 't'
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
#                              Property 'tokenize'
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Call
#                                                  Bareword 'getParameter'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Lexical variable '$msg'
#                              Named argument list [1 items]
#                                  Item 0
#                                      Pair 'pretty'
#                                          Boolean true
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
#                                          Property 'error'
#                                              Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 items]
#                              Item 0
#                                  Property 'pretty'
#                                      Lexical variable '$res'
#      On
#          Expression ('on' parameter)
#              Property 'c'
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
#                              Property 'construct'
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Call
#                                                  Bareword 'getParameter'
#                                                  Argument list [1 items]
#                                                      Item 0
#                                                          Lexical variable '$msg'
#                              Named argument list [1 items]
#                                  Item 0
#                                      Pair 'pretty'
#                                          Boolean true
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
#                                          Property 'error'
#                                              Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 items]
#                              Item 0
#                                  Property 'pretty'
#                                      Lexical variable '$res'
#      On
#          Expression ('on' parameter)
#              Property 'p'
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
#                      Call
#                          Bareword 'handlePerl'
#                          Argument list [3 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$channel'
#                              Item 2
#                                  Boolean true
#      On
#          Expression ('on' parameter)
#              Property 'pp'
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
#                      Call
#                          Bareword 'handlePerl'
#                          Argument list [3 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$channel'
#                              Item 2
#                                  Boolean false
#      Function 'handlePerl'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Need
#                      Lexical variable '$channel'
#              Instruction
#                  Need
#                      Lexical variable '$mini'
#              Instruction
#                  Assignment
#                      Lexical variable '$res'
#                      Call
#                          Property 'compile'
#                              Call
#                                  Bareword 'COMPILER'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Call
#                                              Bareword 'getParameter'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      Lexical variable '$msg'
#                          Named argument list [1 items]
#                              Item 0
#                                  Pair 'mini'
#                                      Lexical variable '$mini'
#              If
#                  Expression ('if' parameter)
#                      Property 'error'
#                          Lexical variable '$res'
#                  Body ('if' scope)
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 items]
#                                  Item 0
#                                      Property 'error'
#                                          Lexical variable '$res'
#                      Instruction
#                          Return
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 items]
#                          Item 0
#                              Property 'perl'
#                                  Lexical variable '$res'
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
#                      Lexical variable '$conn'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (COMPILER, Error, IRC, IRC::Bot, IRC::Connection, IRC::Massage)
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

use Ferret::Core::Operations qw(add any_true bool less num rgx str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'respondFactoid' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'respondFactoid',
        undef,
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
            FF::need( $scope, $args, 'msg',     32.2 ) or return;
            FF::need( $scope, $args, 'channel', 32.4 ) or return;
            FF::lex_assign(
                $scope,
                command => ${
                    ${
                        ${ $$scope->{'msg'} }->{'params'}
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(33.25) )
                      }->{'word'}
                      ->( [ num( $f, "0" ) ], $scope, undef, $pos->(33.45) )
                  }->{'trimPrefix'}
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(33.65) ),
                $file_scope,
                $pos->(33.1)
            );
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(34.25)
                    )
                ],
                $scope, undef,
                $pos->(34.15)
            );
            return $ret;
        }
    );

    # Function event 'handlePerl' definition
    my $func_1 = FF::function_event_def(
        $f, $context,
        'handlePerl',
        undef,
        [
            { name => 'msg', type => undef, optional => undef, more => undef },
            {
                name     => 'channel',
                type     => undef,
                optional => undef,
                more     => undef
            },
            { name => 'mini', type => undef, optional => undef, more => undef }
        ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg',     81.2 ) or return;
            FF::need( $scope, $args, 'channel', 81.4 ) or return;
            FF::need( $scope, $args, 'mini',    81.6 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(82.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(82.2)
                    )
                  }->{'compile'}->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(82.55)
                  ),
                $file_scope,
                $pos->(82.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(84.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'perl'} ],
                $scope, undef, $pos->(87.3)
            );
            return $ret;
        }
    );

    # Function event 'getParameter' definition
    my $func_2 = FF::function_event_def(
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
            FF::need( $scope, $args, 'msg', 91.2 ) or return;
            FF::lex_assign(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        ${
                            ${ $$scope->{'msg'} }->{'params'}
                              ->get_index_value( [ num( $f, "1" ) ],
                                $scope, $pos->(92.25) )
                          }->{'fromWord'}->( [ num( $f, "1" ) ], $scope, undef,
                            $pos->(92.45) );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(92.1)
            );
            return $ret_func->(
                ${
                    ${ $$scope->{'string'} }->{'split'}
                      ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(93.2) )
                  }->{'join'}
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(93.4) )
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
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
    my $func_4 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     13.2 ) or return;
            FF::need( $scope, $args, 'channel', 13.4 ) or return;
            FF::lex_assign(
                $scope,
                message => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(14.5) ),
                $file_scope, $pos->(14.2)
            );
            FF::lex_assign(
                $scope,
                parts => ${ $$scope->{'message'} }->{'split'}->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(17.5)
                ),
                $file_scope,
                $pos->(17.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        ${ $$scope->{'parts'} }->{'length'},
                        num( $f, "3" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->fail(
                    $$scope->{'Error'}->(
                        [
                            FF::get_symbol( $f, 'ParameterError' ),
                            str( $f, "Not enough parameters" )
                        ],
                        $scope, undef,
                        $pos->(19.3)
                    )
                );
            }
            FF::lex_assign(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(23.4) ),
                $file_scope, $pos->(23.2)
            );
            FF::lex_assign(
                $scope,
                response => ${ $$scope->{'message'} }->{'fromWord'}
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(24.5) ),
                $file_scope, $pos->(24.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'command'} ],
                $$scope->{'response'}, $scope, $pos->(25.5) );
            ${ $$scope->{'bot'} }->{'commands'}->set_property_eval(
                $$scope->{'command'} => $$scope->{'respondFactoid'},
                $pos->(26.35)
            );
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [
                    add(
                        $scope,
                        str( $f, "OK, I will respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'response'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(28.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_5 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     40.2 ) or return;
            FF::need( $scope, $args, 'channel', 40.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(41.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(41.2)
                    )
                  }->{'eval'}->( [ undef, [] ], $scope, undef, $pos->(41.55) ),
                $file_scope,
                $pos->(41.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(43.3)
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
            ${ $$scope->{'channel'} }->{'privmsg'}
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(47.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_6 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     51.2 ) or return;
            FF::need( $scope, $args, 'channel', 51.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(52.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(52.2)
                    )
                  }->{'tokenize'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(52.55)
                  ),
                $file_scope,
                $pos->(52.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(54.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'pretty'} ],
                $scope, undef, $pos->(57.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_7 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     61.2 ) or return;
            FF::need( $scope, $args, 'channel', 61.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(62.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(62.2)
                    )
                  }->{'construct'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(62.55)
                  ),
                $file_scope,
                $pos->(62.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(64.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'pretty'} ],
                $scope, undef, $pos->(67.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_8 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     71.2 ) or return;
            FF::need( $scope, $args, 'channel', 71.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(72.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_9 = FF::function_def(
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
            FF::need( $scope, $args, 'msg',     76.2 ) or return;
            FF::need( $scope, $args, 'channel', 76.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(77.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        respondFactoid => $scope,
        $context, undef, undef, undef
    );
    $func_1->inside_scope(
        handlePerl => $scope,
        $context, undef, undef, undef
    );
    $func_2->inside_scope(
        getParameter => $scope,
        $context, undef, undef, undef
    );
    FF::load_namespaces( $context,
        qw(COMPILER Error IRC IRC::Bot IRC::Connection IRC::Massage) );
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
        $func_3->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => FF::create_hash( $f, [] ), $pos->(10.3) );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'add',
        $self,
        $scope,
        $func_4->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'e',
        $self,
        $scope,
        $func_5->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        't',
        $self,
        $scope,
        $func_6->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'c',
        $self,
        $scope,
        $func_7->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'p',
        $self,
        $scope,
        $func_8->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'pp',
        $self,
        $scope,
        $func_9->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
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
            $pos->(96.35)
        ),
        undef,
        $pos->(96.15)
    );
    $$scope->{'conn'}->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(97.3)
    );
    ${ $$scope->{'bot'} }->{'addConnection'}
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(98.3) );
    ${ $$scope->{'bot'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(99.3) );
};

FF::after_content();
