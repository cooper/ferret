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
#                          Index
#                              This variable '%factoids'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
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
#                      Bareword 'inspect'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$msg'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 items]
#                          Item 0
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 items]
#                                      Item 0
#                                          Lexical variable '$command'
#              Instruction
#                  Assignment
#                      Lexical variable '$response'
#                      Call
#                          Property 'fill'
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 items]
#                                      Item 0
#                                          Lexical variable '$command'
#                          Named argument list [4 items]
#                              Item 0
#                                  Pair 'nick'
#                                      Property 'nick'
#                                          Lexical variable '$msg'
#                              Item 1
#                                  Pair 'user'
#                                      Property 'user'
#                                          Lexical variable '$msg'
#                              Item 2
#                                  Pair 'host'
#                                      Property 'host'
#                                          Lexical variable '$msg'
#                              Item 3
#                                  Pair 'chan'
#                                      Property 'name'
#                                          Lexical variable '$channel'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$response'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$response'
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

my ( $self, $ins );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     58.2 ) or return;
            need( $scope, $args, 'channel', 58.4 ) or return;
            var(
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
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(60.2) );
            $$scope->{'inspect'}->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(61.4)
                    )
                ],
                $scope, undef,
                $pos->(61.2)
            );
            var(
                $scope,
                response => $$this->{'factoids'}
                  ->get_index_value( [ $$scope->{'command'} ],
                    $scope, $pos->(62.4) )->property_u( 'fill', $pos->(62.7) )
                  ->(
                    [
                        undef,
                        [
                            nick => $$scope->{'msg'}
                              ->property_u( 'nick', $pos->(63.3) ),
                            user => $$scope->{'msg'}
                              ->property_u( 'user', $pos->(64.3) ),
                            host => $$scope->{'msg'}
                              ->property_u( 'host', $pos->(65.3) ),
                            chan => $$scope->{'channel'}
                              ->property_u( 'name', $pos->(66.3) )
                        ]
                    ],
                    $scope, undef,
                    $pos->(62.8)
                  ),
                $file_scope,
                $pos->(62.2)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(68.2) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(69.2) )
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(69.3) );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     116.2 ) or return;
            need( $scope, $args, 'channel', 116.4 ) or return;
            need( $scope, $args, 'mini',    116.6 ) or return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(117.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(117.2)
                  )->property_u( 'compile', $pos->(117.5) )->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(117.55)
                  ),
                $file_scope,
                $pos->(117.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(118.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(119.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(119.5) ) ],
                    $scope, undef, $pos->(119.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(122.2) )->(
                [ $$scope->{'res'}->property_u( 'perl', $pos->(122.5) ) ],
                $scope, undef, $pos->(122.3)
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 126.2 ) or return;
            var(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        $$scope->{'msg'}->property_u( 'params', $pos->(127.2) )
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(127.25) )
                          ->property_u( 'fromWord', $pos->(127.4) )->(
                            [ num( $f, "1" ) ],
                            $scope, undef, $pos->(127.45)
                          );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(127.1)
            );
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(128.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(128.2) )
                  ->property_u( 'join', $pos->(128.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(128.4) ) );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'channel', 4.2 ) or return;
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(5.2) )->(
                [
                    str(
                        $f, "Ferret IRC bot https://github.com/cooper/ferret"
                    )
                ],
                $scope, undef,
                $pos->(5.3)
            );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     13.2 ) or return;
            need( $scope, $args, 'channel', 13.4 ) or return;
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(14.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(14.5) ),
                $file_scope, $pos->(14.2)
            );
            var(
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
            var(
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
            var(
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     35.2 ) or return;
            need( $scope, $args, 'channel', 35.4 ) or return;
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(36.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(36.5) ),
                $file_scope, $pos->(36.2)
            );
            var(
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
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(45.4) )
                  ->property_u( 'lowercase', $pos->(45.7) ),
                $file_scope, $pos->(45.2)
            );
            var(
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
            $$this->{'factoids'}
              ->delete_index( $$scope->{'command'}, $pos->(51.1) );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     75.2 ) or return;
            need( $scope, $args, 'channel', 75.4 ) or return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(76.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(76.2)
                  )->property_u( 'eval', $pos->(76.5) )
                  ->( [ undef, [] ], $scope, undef, $pos->(76.55) ),
                $file_scope,
                $pos->(76.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(77.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(78.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(78.5) ) ],
                    $scope, undef, $pos->(78.3)
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
                              ->property_u( 'result', $pos->(81.35) ),
                            quiet => $true
                        ]
                    ],
                    $scope, undef,
                    $pos->(81.2)
                  )->property_u( 'string', $pos->(81.6) ),
                $file_scope,
                $pos->(81.1)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(82.2) )
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(82.3) );
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     86.2 ) or return;
            need( $scope, $args, 'channel', 86.4 ) or return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(87.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(87.2)
                  )->property_u( 'tokenize', $pos->(87.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(87.55)
                  ),
                $file_scope,
                $pos->(87.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(88.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(89.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(89.5) ) ],
                    $scope, undef, $pos->(89.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(92.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(92.5) ) ],
                $scope, undef, $pos->(92.3)
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     96.2 ) or return;
            need( $scope, $args, 'channel', 96.4 ) or return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(97.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(97.2)
                  )->property_u( 'construct', $pos->(97.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(97.55)
                  ),
                $file_scope,
                $pos->(97.1)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(98.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(99.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(99.5) ) ],
                    $scope, undef, $pos->(99.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(102.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(102.5) ) ],
                $scope, undef, $pos->(102.3)
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     106.2 ) or return;
            need( $scope, $args, 'channel', 106.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(107.1)
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
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     111.2 ) or return;
            need( $scope, $args, 'channel', 111.4 ) or return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(112.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        respondFactoid => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        handlePerl => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope(
        getParameter => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context,
        qw(COMPILER Error IRC IRC::Bot IRC::Connection IRC::Massage) );
    var(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(1.35) ),
        undef, $pos->(1.15)
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(3.3) ),
        'info', $self, $scope,
        $func_3->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => create_hash( $f, [] ), $pos->(10.3) );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(12.3) ),
        'add', $self, $scope,
        $func_4->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(34.3) ),
        'del', $self, $scope,
        $func_5->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(74.3) ),
        'e', $self, $scope,
        $func_6->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(85.3) ),
        't', $self, $scope,
        $func_7->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(95.3) ),
        'c', $self, $scope,
        $func_8->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(105.3) ),
        'p', $self, $scope,
        $func_9->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(110.3) ),
        'pp', $self, $scope,
        $func_10->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    var(
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
            $pos->(131.35)
        ),
        undef,
        $pos->(131.15)
    );
    $$scope->{'conn'}->set_property(
        autojoin => create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(132.3)
    );
    $$scope->{'bot'}->property_u( 'addConnection', $pos->(133.2) )
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(133.3) );
    $$scope->{'bot'}->property_u( 'connect', $pos->(134.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(134.3) );
};

after_content();
