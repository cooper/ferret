# === Document Model ===
#  Document './test/35-irc-new.frt'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$bot'
#                  Call
#                      Bareword 'IRC::Bot'
#                      Argument list [0 items]
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
#                          Argument list [1 item]
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
#                              Index list [1 item]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$parts'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 item]
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
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 item]
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
#                              Argument list [1 item]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment
#                          Index
#                              This variable '%factoids'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$command'
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 item]
#                                  Item 0
#                                      Lexical variable '$command'
#                          Bareword 'respondFactoid'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
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
#                              Index list [1 item]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$parts'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 item]
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
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$existed'
#                          Index
#                              This variable '%factoids'
#                              Index list [1 item]
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
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$command'
#                  Instruction
#                      Delete modifier
#                          Property (name evaluated at runtime)
#                              Property 'commands'
#                                  Lexical variable '$bot'
#                              Property index [1 item]
#                                  Item 0
#                                      Lexical variable '$command'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
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
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '1'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '0'
#                          Argument list [1 item]
#                              Item 0
#                                  String '.'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$msg'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 item]
#                          Item 0
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#              Instruction
#                  Assignment
#                      Lexical variable '$response'
#                      Call
#                          Property 'fill'
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 item]
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
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$response'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 item]
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
#                      Call
#                          Bareword 'handleEval'
#                          Argument list [3 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$channel'
#                              Item 2
#                                  Boolean false
#      On
#          Expression ('on' parameter)
#              Property 'i'
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
#                          Bareword 'handleEval'
#                          Argument list [3 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$channel'
#                              Item 2
#                                  Boolean true
#      Function 'handleEval'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Need
#                      Lexical variable '$channel'
#              Instruction
#                  Need
#                      Lexical variable '$detailed'
#              Instruction
#                  Assignment
#                      Lexical variable '$code'
#                      Operation
#                          String 'share $bot...'
#                          Addition operator (+)
#                          Call
#                              Bareword 'getParameter'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Lexical variable '$res'
#                      Call
#                          Property 'eval'
#                              Call
#                                  Bareword 'COMPILER'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$code'
#                          Argument list [0 items]
#              If
#                  Expression ('if' parameter)
#                      Property 'error'
#                          Lexical variable '$res'
#                  Body ('if' scope)
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      Property 'error'
#                                          Lexical variable '$res'
#                      Instruction
#                          Return
#              Instruction
#                  Assignment
#                      Lexical variable '$string'
#                      Property 'string'
#                          Call
#                              Bareword 'inspect'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'value'
#                                          Property 'result'
#                                              Lexical variable '$res'
#                                  Item 1
#                                      Pair 'quiet'
#                                          Boolean true
#                                  Item 2
#                                      Pair 'detailed'
#                                          Lexical variable '$detailed'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$string'
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
#                                      Argument list [1 item]
#                                          Item 0
#                                              Call
#                                                  Bareword 'getParameter'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$msg'
#                              Named argument list [1 item]
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
#                                  Argument list [1 item]
#                                      Item 0
#                                          Property 'error'
#                                              Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
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
#                                      Argument list [1 item]
#                                          Item 0
#                                              Call
#                                                  Bareword 'getParameter'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$msg'
#                              Named argument list [1 item]
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
#                                  Argument list [1 item]
#                                      Item 0
#                                          Property 'error'
#                                              Lexical variable '$res'
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
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
#                                  Argument list [1 item]
#                                      Item 0
#                                          Call
#                                              Bareword 'getParameter'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Lexical variable '$msg'
#                          Named argument list [1 item]
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
#                              Argument list [1 item]
#                                  Item 0
#                                      Property 'error'
#                                          Lexical variable '$res'
#                      Instruction
#                          Return
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$channel'
#                      Argument list [1 item]
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
#                                      Index list [1 item]
#                                          Item 0
#                                              Number '1'
#                              Argument list [1 item]
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
#                                  Argument list [1 item]
#                                      Item 0
#                                          String '_NL_'
#                          Argument list [1 item]
#                              Item 0
#                                  String '␤'
#      Function 'ircsay'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#                      Argument type
#                          Bareword 'Str::Any'
#              Instruction
#                  Assignment
#                      Lexical variable '$chan'
#                      Call
#                          Property 'getChannel'
#                              Lexical variable '$conn'
#                          Argument list [1 item]
#                              Item 0
#                                  Index
#                                      Property 'autojoin'
#                                          Lexical variable '$conn'
#                                      Index list [1 item]
#                                          Item 0
#                                              Number '0'
#              Instruction
#                  Call
#                      Property 'privmsg'
#                          Lexical variable '$chan'
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$msg'
#      Instruction
#          Assignment
#              Property 'autojoin'
#                  Lexical variable '$conn'
#              Value list [1 item]
#                  Item 0
#                      String '#k'
#      Instruction
#          Call
#              Property 'addConnection'
#                  Lexical variable '$bot'
#              Argument list [1 item]
#                  Item 0
#                      Lexical variable '$conn'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (COMPILER, Error, IRC, IRC::Bot, IRC::Connection, IRC::Massage, Str, Str::Any)
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     59.2 ) || return;
            need( $scope, $args, 'channel', 59.4 ) || return;
            var(
                $scope,
                command =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(60.2) )
                  ->get_index_value(
                    [ num( $f, "1" ) ], $scope, $pos->(60.25)
                  )->property_u( 'word', $pos->(60.4) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(60.45) )
                  ->property_u( 'trimPrefix', $pos->(60.6) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(60.65) ),
                $file_scope,
                $pos->(60.1)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(61.2) );
            $$scope->{'inspect'}->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(62.4)
                    )
                ],
                $scope, undef,
                $pos->(62.2)
            );
            var(
                $scope,
                response => $$this->{'factoids'}
                  ->get_index_value( [ $$scope->{'command'} ],
                    $scope, $pos->(63.4) )->property_u( 'fill', $pos->(63.7) )
                  ->(
                    [
                        undef,
                        [
                            nick => $$scope->{'msg'}
                              ->property_u( 'nick', $pos->(64.3) ),
                            user => $$scope->{'msg'}
                              ->property_u( 'user', $pos->(65.3) ),
                            host => $$scope->{'msg'}
                              ->property_u( 'host', $pos->(66.3) ),
                            chan => $$scope->{'channel'}
                              ->property_u( 'name', $pos->(67.3) )
                        ]
                    ],
                    $scope, undef,
                    $pos->(63.8)
                  ),
                $file_scope,
                $pos->(63.2)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(69.2) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(70.2) )
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(70.3) );
            return $ret;
        }
    );

    # Function event 'handleEval' definition
    my $func_1 = function_event_def(
        $f, $context,
        'handleEval',
        undef,
        [
            { name => 'msg', type => undef, optional => undef, more => undef },
            {
                name     => 'channel',
                type     => undef,
                optional => undef,
                more     => undef
            },
            {
                name     => 'detailed',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',      86.2 ) || return;
            need( $scope, $args, 'channel',  86.4 ) || return;
            need( $scope, $args, 'detailed', 86.6 ) || return;
            var(
                $scope,
                code => add(
                    $scope,
                    str( $f, "share \$bot; undefined; " ),
                    $$scope->{'getParameter'}
                      ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(87.3) )
                ),
                $file_scope,
                $pos->(87.1)
            );
            var(
                $scope,
                res => $$scope->{'COMPILER'}
                  ->( [ $$scope->{'code'} ], $scope, undef, $pos->(88.2) )
                  ->property_u( 'eval', $pos->(88.35) )
                  ->( [ undef, [] ], $scope, undef, $pos->(88.4) ),
                $file_scope, $pos->(88.1)
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
            var(
                $scope,
                string => $$scope->{'inspect'}->(
                    [
                        undef,
                        [
                            value => $$scope->{'res'}
                              ->property_u( 'result', $pos->(94.15) ),
                            quiet    => $true,
                            detailed => $$scope->{'detailed'}
                        ]
                    ],
                    $scope, undef,
                    $pos->(93.4)
                  )->property_u( 'string', $pos->(94.55) ),
                $file_scope,
                $pos->(93.2)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(95.2) )
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(95.3) );
            return $ret;
        }
    );

    # Function event 'handlePerl' definition
    my $func_2 = function_event_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     129.2 ) || return;
            need( $scope, $args, 'channel', 129.4 ) || return;
            need( $scope, $args, 'mini',    129.6 ) || return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(130.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(130.2)
                  )->property_u( 'compile', $pos->(130.5) )->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(130.55)
                  ),
                $file_scope,
                $pos->(130.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(131.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(132.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(132.5) ) ],
                    $scope, undef, $pos->(132.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(135.2) )->(
                [ $$scope->{'res'}->property_u( 'perl', $pos->(135.5) ) ],
                $scope, undef, $pos->(135.3)
            );
            return $ret;
        }
    );

    # Function event 'getParameter' definition
    my $func_3 = function_event_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 139.2 ) || return;
            var(
                $scope,
                string => any_true(
                    $scope,
                    sub {
                        $$scope->{'msg'}->property_u( 'params', $pos->(140.2) )
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(140.25) )
                          ->property_u( 'fromWord', $pos->(140.4) )->(
                            [ num( $f, "1" ) ],
                            $scope, undef, $pos->(140.45)
                          );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(140.1)
            );
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(141.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(141.2) )
                  ->property_u( 'join', $pos->(141.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(141.4) ) );
            return $ret;
        }
    );

    # Function event 'ircsay' definition
    my $func_4 = function_event_def(
        $f, $context, 'ircsay', undef,
        [
            {
                name     => 'msg',
                type     => 'Str::Any',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 145.2 ) || return;
            var(
                $scope,
                chan =>
                  $$scope->{'conn'}->property_u( 'getChannel', $pos->(146.2) )
                  ->(
                    [
                        $$scope->{'conn'}
                          ->property_u( 'autojoin', $pos->(146.35) )
                          ->get_index_value(
                            [ num( $f, "0" ) ],
                            $scope, $pos->(146.4)
                          )
                    ],
                    $scope, undef,
                    $pos->(146.25)
                  ),
                $file_scope,
                $pos->(146.1)
            );
            $$scope->{'chan'}->property_u( 'privmsg', $pos->(147.2) )
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(147.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_5 = function_def(
        $f, undef, undef,
        [
            {
                name     => 'channel',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'channel', 5.2 ) || return;
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(6.2) )->(
                [
                    str(
                        $f, "Ferret IRC bot https://github.com/cooper/ferret"
                    )
                ],
                $scope, undef,
                $pos->(6.3)
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     14.2 ) || return;
            need( $scope, $args, 'channel', 14.4 ) || return;
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(15.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(15.5) ),
                $file_scope, $pos->(15.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(18.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(18.5)
                  ),
                $file_scope,
                $pos->(18.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(19.3) ),
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
                        $pos->(20.3)
                    ),
                    $pos->(20.1)
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(23.4) )
                  ->property_u( 'lowercase', $pos->(23.7) ),
                $file_scope, $pos->(23.2)
            );
            if (
                bool(
                    $$scope->{'bot'}->property_u( 'commands', $pos->(24.3) )
                      ->property_u( $$scope->{'command'}, $pos->(24.4) )
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
                        $pos->(25.15)
                    ),
                    $pos->(25.05)
                );
            }
            var(
                $scope,
                response =>
                  $$scope->{'message'}->property_u( 'fromWord', $pos->(28.4) )
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(28.5) ),
                $file_scope, $pos->(28.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'command'} ],
                $$scope->{'response'}, $scope, $pos->(29.5) );
            $$scope->{'bot'}->property_u( 'commands', $pos->(30.1) )
              ->set_property(
                $$scope->{'command'} => $$scope->{'respondFactoid'},
                $pos->(30.35)
              );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(32.1) )->(
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
                $pos->(32.15)
            );
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     36.2 ) || return;
            need( $scope, $args, 'channel', 36.4 ) || return;
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(37.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(37.5) ),
                $file_scope, $pos->(37.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(40.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(40.5)
                  ),
                $file_scope,
                $pos->(40.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(41.3) ),
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
                        $pos->(42.3)
                    ),
                    $pos->(42.1)
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(46.4) )
                  ->property_u( 'lowercase', $pos->(46.7) ),
                $file_scope, $pos->(46.2)
            );
            var(
                $scope,
                existed => $$this->{'factoids'}->get_index_value(
                    [ $$scope->{'command'} ],
                    $scope, $pos->(47.4)
                ),
                $file_scope,
                $pos->(47.2)
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
                        $pos->(49.15)
                    ),
                    $pos->(49.05)
                );
            }

            $$this->{'factoids'}
              ->delete_index( $$scope->{'command'}, $pos->(52.1) );

            $$scope->{'bot'}->property_u( 'commands', $pos->(53.3) )
              ->delete_property_ow( $$scope->{'command'}, $pos->(53.1) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(55.1) )->(
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
                $pos->(55.15)
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     76.2 ) || return;
            need( $scope, $args, 'channel', 76.4 ) || return;
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(77.1)
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     81.2 ) || return;
            need( $scope, $args, 'channel', 81.4 ) || return;
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(82.1)
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     99.2 ) || return;
            need( $scope, $args, 'channel', 99.4 ) || return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(100.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(100.2)
                  )->property_u( 'tokenize', $pos->(100.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(100.55)
                  ),
                $file_scope,
                $pos->(100.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(101.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(102.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(102.5) ) ],
                    $scope, undef, $pos->(102.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(105.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(105.5) ) ],
                $scope, undef, $pos->(105.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_11 = function_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     109.2 ) || return;
            need( $scope, $args, 'channel', 109.4 ) || return;
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(110.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(110.2)
                  )->property_u( 'construct', $pos->(110.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(110.55)
                  ),
                $file_scope,
                $pos->(110.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(111.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(112.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(112.5) ) ],
                    $scope, undef, $pos->(112.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(115.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(115.5) ) ],
                $scope, undef, $pos->(115.3)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_12 = function_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     119.2 ) || return;
            need( $scope, $args, 'channel', 119.4 ) || return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(120.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_13 = function_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg',     124.2 ) || return;
            need( $scope, $args, 'channel', 124.4 ) || return;
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(125.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        respondFactoid => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        handleEval => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope(
        handlePerl => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_3->inside_scope(
        getParameter => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_4->inside_scope(
        ircsay => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context,
        qw(COMPILER Error IRC IRC::Bot IRC::Connection IRC::Massage Str Str::Any)
    );
    var(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(1.35) ),
        undef, $pos->(1.15)
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
            $pos->(2.35)
        ),
        undef,
        $pos->(2.15)
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(4.3) ),
        'info', $self, $scope,
        $func_5->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => create_hash( $f, [] ), $pos->(11.3) );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(13.3) ),
        'add', $self, $scope,
        $func_6->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(35.3) ),
        'del', $self, $scope,
        $func_7->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(75.3) ),
        'e', $self, $scope,
        $func_8->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(80.3) ),
        'i', $self, $scope,
        $func_9->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(98.3) ),
        't', $self, $scope,
        $func_10->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(108.3) ),
        'c', $self, $scope,
        $func_11->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(118.3) ),
        'p', $self, $scope,
        $func_12->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(123.3) ),
        'pp', $self, $scope,
        $func_13->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'conn'}->set_property(
        autojoin => create_list( $f, [ str( $f, "#k" ) ] ),
        $pos->(150.3)
    );
    $$scope->{'bot'}->property_u( 'addConnection', $pos->(151.2) )
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(151.3) );
    $$scope->{'bot'}->property_u( 'connect', $pos->(152.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(152.3) );
};

after_content();
