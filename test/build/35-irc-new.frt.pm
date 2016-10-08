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
#                          Property 'lowercase'
#                              Index
#                                  Lexical variable '$parts'
#                                  Index list [1 items]
#                                      Item 0
#                                          Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Body ('if' scope)
#                          Instruction
#                              Fail (nonfatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :ParameterError
#                                          Item 1
#                                              Operation
#                                                  String 'Command .'
#                                                  Addition operator (+)
#                                                  Lexical variable '$command'
#                                                  Addition operator (+)
#                                                  String ' exists'
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
#      On
#          Expression ('on' parameter)
#              Property 'del'
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
#                              Number '2'
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
#                          Property 'lowercase'
#                              Index
#                                  Lexical variable '$parts'
#                                  Index list [1 items]
#                                      Item 0
#                                          Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$existed'
#                          Index
#                              This variable '%factoids'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Lexical variable '$existed'
#                      Body ('if' scope)
#                          Instruction
#                              Fail (nonfatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :ParameterError
#                                          Item 1
#                                              Operation
#                                                  String 'No such fa...'
#                                                  Addition operator (+)
#                                                  Lexical variable '$command'
#                  Instruction
#                      Delete modifier
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
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
#                                      Lexical variable '$existed'
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

my $self;
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '35-irc-new.frt', './test/35-irc-new.frt' );

use Ferret::Core::Operations qw(_not add any_true bool less num rgx str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'respondFactoid' definition
    my $func_0 = function_event_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     58.2 ) or return;
            need( $scope, $args, 'channel', 58.4 ) or return;
            lex_assign(
                $scope,
                command =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(59.2) )
                  ->get_index_value(
                    [ num( $f, "1" ) ], $scope, $pos->(59.25)
                  )->property_u( 'word', $pos->(59.4) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(59.45) )
                  ->property_u( 'trimPrefix', $pos->(59.6) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(59.65) ),
                $file_scope,
                $pos->(59.1)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(60.1) )->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(60.25)
                    )
                ],
                $scope, undef,
                $pos->(60.15)
            );
            return $ret;
        }
    );

    # Function event 'handlePerl' definition
    my $func_1 = function_event_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     107.2 ) or return;
            need( $scope, $args, 'channel', 107.4 ) or return;
            need( $scope, $args, 'mini',    107.6 ) or return;
            lex_assign(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(108.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(108.2)
                  )->property_u( 'compile', $pos->(108.5) )->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(108.55)
                  ),
                $file_scope,
                $pos->(108.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(109.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(110.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(110.5) ) ],
                    $scope, undef, $pos->(110.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(113.2) )->(
                [ $$scope->{'res'}->property_u( 'perl', $pos->(113.5) ) ],
                $scope, undef, $pos->(113.3)
            );
            return $ret;
        }
    );

    # Function event 'getParameter' definition
    my $func_2 = function_event_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg', 117.2 ) or return;
            lex_assign(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        $$scope->{'msg'}->property_u( 'params', $pos->(118.2) )
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(118.25) )
                          ->property_u( 'fromWord', $pos->(118.4) )->(
                            [ num( $f, "1" ) ],
                            $scope, undef, $pos->(118.45)
                          );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(118.1)
            );
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(119.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(119.2) )
                  ->property_u( 'join', $pos->(119.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(119.4) ) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'channel', 4.2 ) or return;
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(5.2) )
              ->( [ str( $f, "Ferret IRC bot" ) ], $scope, undef, $pos->(5.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_4 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     13.2 ) or return;
            need( $scope, $args, 'channel', 13.4 ) or return;
            lex_assign(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(14.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(14.5) ),
                $file_scope, $pos->(14.2)
            );
            lex_assign(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(17.4) )->(
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
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(18.3) ),
                        num( $f, "3" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->fail(
                    $$scope->{'Error'}->(
                        [
                            get_symbol( $f, 'ParameterError' ),
                            str( $f, "Not enough parameters" )
                        ],
                        $scope, undef,
                        $pos->(19.3)
                    ),
                    $pos->(19.1)
                );
            }
            lex_assign(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(22.4) )
                  ->property_u( 'lowercase', $pos->(22.7) ),
                $file_scope, $pos->(22.2)
            );
            if (
                bool(
                    $$scope->{'bot'}->property_u( 'commands', $pos->(23.3) )
                      ->property_eval_u( $$scope->{'command'}, $pos->(23.4) )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->fail(
                    $$scope->{'Error'}->(
                        [
                            get_symbol( $f, 'ParameterError' ),
                            add(
                                $scope,               str( $f, "Command ." ),
                                $$scope->{'command'}, str( $f, " exists" )
                            )
                        ],
                        $scope, undef,
                        $pos->(24.15)
                    ),
                    $pos->(24.05)
                );
            }
            lex_assign(
                $scope,
                response =>
                  $$scope->{'message'}->property_u( 'fromWord', $pos->(27.4) )
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(27.5) ),
                $file_scope, $pos->(27.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'command'} ],
                $$scope->{'response'}, $scope, $pos->(28.5) );
            $$scope->{'bot'}->property_u( 'commands', $pos->(29.1) )
              ->set_property_eval(
                $$scope->{'command'} => $$scope->{'respondFactoid'},
                $pos->(29.35)
              );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(31.1) )->(
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
                $pos->(31.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_5 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     35.2 ) or return;
            need( $scope, $args, 'channel', 35.4 ) or return;
            lex_assign(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(36.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(36.5) ),
                $file_scope, $pos->(36.2)
            );
            lex_assign(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(39.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(39.5)
                  ),
                $file_scope,
                $pos->(39.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(40.3) ),
                        num( $f, "2" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->fail(
                    $$scope->{'Error'}->(
                        [
                            get_symbol( $f, 'ParameterError' ),
                            str( $f, "Not enough parameters" )
                        ],
                        $scope, undef,
                        $pos->(41.3)
                    ),
                    $pos->(41.1)
                );
            }
            lex_assign(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(45.4) )
                  ->property_u( 'lowercase', $pos->(45.7) ),
                $file_scope, $pos->(45.2)
            );
            lex_assign(
                $scope,
                existed => $$this->{'factoids'}->get_index_value(
                    [ $$scope->{'command'} ],
                    $scope, $pos->(46.4)
                ),
                $file_scope,
                $pos->(46.2)
            );
            if ( bool( _not( $$scope->{'existed'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->fail(
                    $$scope->{'Error'}->(
                        [
                            get_symbol( $f, 'ParameterError' ),
                            add(
                                $scope,
                                str( $f, "No such factoid ." ),
                                $$scope->{'command'}
                            )
                        ],
                        $scope, undef,
                        $pos->(48.15)
                    ),
                    $pos->(48.05)
                );
            }
            $$scope->{'bot'}->property_u( 'commands', $pos->(52.3) )
              ->delete_property_ow_eval( $$scope->{'command'}, $pos->(52.1) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(54.1) )->(
                [
                    add(
                        $scope,
                        str( $f, "OK, I will no longer respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'existed'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(54.15)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_6 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     66.2 ) or return;
            need( $scope, $args, 'channel', 66.4 ) or return;
            lex_assign(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(67.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(67.2)
                  )->property_u( 'eval', $pos->(67.5) )
                  ->( [ undef, [] ], $scope, undef, $pos->(67.55) ),
                $file_scope,
                $pos->(67.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(68.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(69.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(69.5) ) ],
                    $scope, undef, $pos->(69.3)
                );
                return $ret_func->();
            }
            lex_assign(
                $scope,
                string => $$scope->{'inspect'}->(
                    [
                        undef,
                        [
                            value => $$scope->{'res'}
                              ->property_u( 'result', $pos->(72.35) ),
                            quiet => $true
                        ]
                    ],
                    $scope, undef,
                    $pos->(72.2)
                  )->property_u( 'string', $pos->(72.6) ),
                $file_scope,
                $pos->(72.1)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(73.2) )
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(73.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_7 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     77.2 ) or return;
            need( $scope, $args, 'channel', 77.4 ) or return;
            lex_assign(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(78.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(78.2)
                  )->property_u( 'tokenize', $pos->(78.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(78.55)
                  ),
                $file_scope,
                $pos->(78.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(79.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(80.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(80.5) ) ],
                    $scope, undef, $pos->(80.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(83.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(83.5) ) ],
                $scope, undef, $pos->(83.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_8 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     87.2 ) or return;
            need( $scope, $args, 'channel', 87.4 ) or return;
            lex_assign(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(88.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(88.2)
                  )->property_u( 'construct', $pos->(88.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(88.55)
                  ),
                $file_scope,
                $pos->(88.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(89.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(90.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(90.5) ) ],
                    $scope, undef, $pos->(90.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(93.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(93.5) ) ],
                $scope, undef, $pos->(93.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_9 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     97.2 ) or return;
            need( $scope, $args, 'channel', 97.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(98.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_10 = function_def(
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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg',     102.2 ) or return;
            need( $scope, $args, 'channel', 102.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(103.1)
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
    load_namespaces( $context,
        qw(COMPILER Error IRC IRC::Bot IRC::Connection IRC::Massage) );
    lex_assign(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(1.35) ),
        undef, $pos->(1.15)
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(3.3) ),
        'info',
        $self,
        $scope,
        $func_3->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => create_hash( $f, [] ), $pos->(10.3) );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(12.3) ),
        'add',
        $self,
        $scope,
        $func_4->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(34.3) ),
        'del',
        $self,
        $scope,
        $func_5->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(65.3) ),
        'e',
        $self,
        $scope,
        $func_6->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(76.3) ),
        't',
        $self,
        $scope,
        $func_7->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(86.3) ),
        'c',
        $self,
        $scope,
        $func_8->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(96.3) ),
        'p',
        $self,
        $scope,
        $func_9->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(101.3) ),
        'pp',
        $self,
        $scope,
        $func_10->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    lex_assign(
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
            $pos->(122.35)
        ),
        undef,
        $pos->(122.15)
    );
    $$scope->{'conn'}->set_property(
        autojoin => create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(123.3)
    );
    $$scope->{'bot'}->property_u( 'addConnection', $pos->(124.2) )
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(124.3) );
    $$scope->{'bot'}->property_u( 'connect', $pos->(125.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(125.3) );
};

after_content();
