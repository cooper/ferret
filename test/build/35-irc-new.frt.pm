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
#      Include (COMPILER, IRC, IRC::Bot, IRC::Connection, IRC::Massage)
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

    # Function event 'handlePerl' definition
    my $func_0 = FF::function_event_def(
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
            FF::need( $scope, $args, 'msg',     50.2 ) or return;
            FF::need( $scope, $args, 'channel', 50.4 ) or return;
            FF::need( $scope, $args, 'mini',    50.6 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(51.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(51.2)
                    )
                  }->{'compile'}->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(51.55)
                  ),
                $file_scope,
                $pos->(51.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(53.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'perl'} ],
                $scope, undef, $pos->(56.3)
            );
            return $ret;
        }
    );

    # Function event 'getParameter' definition
    my $func_1 = FF::function_event_def(
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
            FF::need( $scope, $args, 'msg', 60.2 ) or return;
            FF::lex_assign(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        ${
                            ${ $$scope->{'msg'} }->{'params'}
                              ->get_index_value( [ num( $f, "1" ) ],
                                $scope, $pos->(61.25) )
                          }->{'fromWord'}->( [ num( $f, "1" ) ], $scope, undef,
                            $pos->(61.45) );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(61.1)
            );
            return $ret_func->(
                ${
                    ${ $$scope->{'string'} }->{'split'}
                      ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(62.2) )
                  }->{'join'}
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(62.4) )
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
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
    my $func_3 = FF::function_def(
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
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(12.3)
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
            FF::need( $scope, $args, 'msg',     20.2 ) or return;
            FF::need( $scope, $args, 'channel', 20.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(21.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(21.2)
                    )
                  }->{'tokenize'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(21.55)
                  ),
                $file_scope,
                $pos->(21.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(23.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'pretty'} ],
                $scope, undef, $pos->(26.3)
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
            FF::need( $scope, $args, 'msg',     30.2 ) or return;
            FF::need( $scope, $args, 'channel', 30.4 ) or return;
            FF::lex_assign(
                $scope,
                res => ${
                    $$scope->{'COMPILER'}->(
                        [
                            $$scope->{'getParameter'}->(
                                [ $$scope->{'msg'} ], $scope,
                                undef,                $pos->(31.3)
                            )
                        ],
                        $scope, undef,
                        $pos->(31.2)
                    )
                  }->{'construct'}->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(31.55)
                  ),
                $file_scope,
                $pos->(31.1)
            );
            if ( bool( ${ $$scope->{'res'} }->{'error'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                ${ $$scope->{'channel'} }->{'privmsg'}->(
                    [ ${ $$scope->{'res'} }->{'error'} ],
                    $scope, undef, $pos->(33.3)
                );
                return $ret_func->();
            }
            ${ $$scope->{'channel'} }->{'privmsg'}->(
                [ ${ $$scope->{'res'} }->{'pretty'} ],
                $scope, undef, $pos->(36.3)
            );
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
            FF::need( $scope, $args, 'msg',     40.2 ) or return;
            FF::need( $scope, $args, 'channel', 40.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(41.1)
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
            FF::need( $scope, $args, 'msg',     45.2 ) or return;
            FF::need( $scope, $args, 'channel', 45.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(46.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        handlePerl => $scope,
        $context, undef, undef, undef
    );
    $func_1->inside_scope(
        getParameter => $scope,
        $context, undef, undef, undef
    );
    FF::load_namespaces( $context,
        qw(COMPILER IRC IRC::Bot IRC::Connection IRC::Massage) );
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
        $func_2->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'e',
        $self,
        $scope,
        $func_3->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        't',
        $self,
        $scope,
        $func_4->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'c',
        $self,
        $scope,
        $func_5->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'p',
        $self,
        $scope,
        $func_6->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::on(
        ${ $$scope->{'bot'} }->{'commands'},
        'pp',
        $self,
        $scope,
        $func_7->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
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
            $pos->(65.35)
        ),
        undef,
        $pos->(65.15)
    );
    $$scope->{'conn'}->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(66.3)
    );
    ${ $$scope->{'bot'} }->{'addConnection'}
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(67.3) );
    ${ $$scope->{'bot'} }->{'connect'}
      ->( [ undef, [] ], $scope, undef, $pos->(68.3) );
};

FF::after_content();
