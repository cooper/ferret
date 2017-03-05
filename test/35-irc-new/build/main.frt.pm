# === Document Model ===
#  File './test/35-irc-new/main.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$conf'
#                  Call
#                      Property 'parse'
#                          Call
#                              Bareword 'Config::JSON2'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'config.json'
#                      Argument list [0 items]
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$bot'
#                      Call
#                          Bareword 'IRC::Bot'
#                          Argument list [0 items]
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$conn'
#                      Call
#                          Bareword 'IRC::Connection'
#                          Named argument list [4 items]
#                              Item 0
#                                  Pair 'addr'
#                                      Index
#                                          Lexical variable '$conf'
#                                          Index list [1 item]
#                                              Item 0
#                                                  String 'server'
#                              Item 1
#                                  Pair 'nick'
#                                      Index
#                                          Lexical variable '$conf'
#                                          Index list [1 item]
#                                              Item 0
#                                                  String 'nick'
#                              Item 2
#                                  Pair 'user'
#                                      Index
#                                          Lexical variable '$conf'
#                                          Index list [1 item]
#                                              Item 0
#                                                  String 'user'
#                              Item 3
#                                  Pair 'real'
#                                      Index
#                                          Lexical variable '$conf'
#                                          Index list [1 item]
#                                              Item 0
#                                                  String 'real'
#              Catch
#                  Expression ('catch' parameter)
#                      Lexical variable '$e'
#                  Catch body
#                      Instruction
#                          Throw (fatal exception)
#                              Lexical variable '$e'
#          On
#              Expression ('on' parameter)
#                  Property 'info'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'Ferret IRC...'
#          Instruction
#              Assignment
#                  Property 'factoids'
#                      Lexical variable '$bot'
#                  Hash [0 items]
#          On
#              Expression ('on' parameter)
#                  Property 'add'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Assignment
#                              Lexical variable '$message'
#                              Index
#                                  Property 'params'
#                                      Lexical variable '$msg'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                      Instruction
#                          Assignment
#                              Lexical variable '$parts'
#                              Call
#                                  Property 'split'
#                                      Lexical variable '$message'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Regex /\s+/
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Property 'length'
#                                      Lexical variable '$parts'
#                                  Less than operator (<)
#                                  Number '3'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :ParameterError
#                                              Item 1
#                                                  String 'Not enough...'
#                      Instruction
#                          Assignment
#                              Lexical variable '$command'
#                              Property 'lowercase'
#                                  Index
#                                      Lexical variable '$parts'
#                                      Index list [1 item]
#                                          Item 0
#                                              Number '1'
#                      If
#                          Expression ('if' parameter)
#                              Property (name evaluated at runtime)
#                                  Property 'commands'
#                                      Lexical variable '$bot'
#                                  Property index [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :ParameterError
#                                              Item 1
#                                                  Operation
#                                                      String 'Command .'
#                                                      Addition operator (+)
#                                                      Lexical variable '$command'
#                                                      Addition operator (+)
#                                                      String ' exists'
#                      Instruction
#                          Assignment
#                              Lexical variable '$response'
#                              Call
#                                  Property 'fromWord'
#                                      Lexical variable '$message'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '2'
#                      Instruction
#                          Assignment
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                              Lexical variable '$response'
#                      Instruction
#                          Assignment
#                              Property (name evaluated at runtime)
#                                  Property 'commands'
#                                      Lexical variable '$bot'
#                                  Property index [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                              Bareword 'respondFactoid'
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'OK, I will...'
#                                          Addition operator (+)
#                                          Lexical variable '$command'
#                                          Addition operator (+)
#                                          String ' with ''
#                                          Addition operator (+)
#                                          Lexical variable '$response'
#                                          Addition operator (+)
#                                          String '''
#          On
#              Expression ('on' parameter)
#                  Property 'del'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Assignment
#                              Lexical variable '$message'
#                              Index
#                                  Property 'params'
#                                      Lexical variable '$msg'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                      Instruction
#                          Assignment
#                              Lexical variable '$parts'
#                              Call
#                                  Property 'split'
#                                      Lexical variable '$message'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Regex /\s+/
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Property 'length'
#                                      Lexical variable '$parts'
#                                  Less than operator (<)
#                                  Number '2'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :ParameterError
#                                              Item 1
#                                                  String 'Not enough...'
#                      Instruction
#                          Assignment
#                              Lexical variable '$command'
#                              Property 'lowercase'
#                                  Index
#                                      Lexical variable '$parts'
#                                      Index list [1 item]
#                                          Item 0
#                                              Number '1'
#                      Instruction
#                          Assignment
#                              Lexical variable '$existed'
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                      If
#                          Expression ('if' parameter)
#                              Negation
#                                  Lexical variable '$existed'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :ParameterError
#                                              Item 1
#                                                  Operation
#                                                      String 'No such fa...'
#                                                      Addition operator (+)
#                                                      Lexical variable '$command'
#                      Instruction
#                          Delete modifier
#                              Index
#                                  This variable '%factoids'
#                                  Index list [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                      Instruction
#                          Delete modifier
#                              Property (name evaluated at runtime)
#                                  Property 'commands'
#                                      Lexical variable '$bot'
#                                  Property index [1 item]
#                                      Item 0
#                                          Lexical variable '$command'
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'OK, I will...'
#                                          Addition operator (+)
#                                          Lexical variable '$command'
#                                          Addition operator (+)
#                                          String ' with ''
#                                          Addition operator (+)
#                                          Lexical variable '$existed'
#                                          Addition operator (+)
#                                          String '''
#          Function 'respondFactoid' { $msg $channel }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                  Instruction
#                      Assignment
#                          Lexical variable '$command'
#                          Call
#                              Property 'trimPrefix'
#                                  Call
#                                      Property 'word'
#                                          Index
#                                              Property 'params'
#                                                  Lexical variable '$msg'
#                                              Index list [1 item]
#                                                  Item 0
#                                                      Number '1'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Number '0'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '.'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 item]
#                              Item 0
#                                  Index
#                                      This variable '%factoids'
#                                      Index list [1 item]
#                                          Item 0
#                                              Lexical variable '$command'
#                  Instruction
#                      Assignment
#                          Lexical variable '$response'
#                          Call
#                              Property 'fill'
#                                  Index
#                                      This variable '%factoids'
#                                      Index list [1 item]
#                                          Item 0
#                                              Lexical variable '$command'
#                              Named argument list [4 items]
#                                  Item 0
#                                      Pair 'nick'
#                                          Property 'nick'
#                                              Lexical variable '$msg'
#                                  Item 1
#                                      Pair 'user'
#                                          Property 'user'
#                                              Lexical variable '$msg'
#                                  Item 2
#                                      Pair 'host'
#                                          Property 'host'
#                                              Lexical variable '$msg'
#                                  Item 3
#                                      Pair 'chan'
#                                          Property 'name'
#                                              Lexical variable '$channel'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$response'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$response'
#          On
#              Expression ('on' parameter)
#                  Property 'e'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Call
#                              Bareword 'handleEval'
#                              Argument list [3 items]
#                                  Item 0
#                                      Lexical variable '$msg'
#                                  Item 1
#                                      Lexical variable '$channel'
#                                  Item 2
#                                      Boolean false
#          On
#              Expression ('on' parameter)
#                  Property 'i'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Call
#                              Bareword 'handleEval'
#                              Argument list [3 items]
#                                  Item 0
#                                      Lexical variable '$msg'
#                                  Item 1
#                                      Lexical variable '$channel'
#                                  Item 2
#                                      Boolean true
#          Function 'handleEval' { $msg $channel $detailed -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                  Instruction
#                      Need
#                          Lexical variable '$detailed'
#                  Instruction
#                      Assignment
#                          Lexical variable '$res'
#                          Call
#                              Bareword 'timeout'
#                              Argument list [2 items]
#                                  Item 0
#                                      Number '5'
#                                  Item 1
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Call
#                                                          Property 'eval'
#                                                              Call
#                                                                  Bareword 'COMPILER'
#                                                                  Argument list [1 item]
#                                                                      Item 0
#                                                                          Call
#                                                                              Bareword 'getParameter'
#                                                                              Argument list [1 item]
#                                                                                  Item 0
#                                                                                      Lexical variable '$msg'
#                                                          Argument list [0 items]
#                  If
#                      Expression ('if' parameter)
#                          Property 'error'
#                              Lexical variable '$res'
#                      If body
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
#                      Assignment
#                          Lexical variable '$string'
#                          Property 'string'
#                              Call
#                                  Bareword 'inspect'
#                                  Named argument list [3 items]
#                                      Item 0
#                                          Pair 'value'
#                                              Property 'result'
#                                                  Lexical variable '$res'
#                                      Item 1
#                                          Pair 'quiet'
#                                              Boolean true
#                                      Item 2
#                                          Pair 'detailed'
#                                              Lexical variable '$detailed'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$channel'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$string'
#          On
#              Expression ('on' parameter)
#                  Property 't'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Assignment
#                              Lexical variable '$res'
#                              Call
#                                  Property 'tokenize'
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Call
#                                                      Bareword 'getParameter'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$msg'
#                                  Named argument list [1 item]
#                                      Item 0
#                                          Pair 'pretty'
#                                              Boolean true
#                      If
#                          Expression ('if' parameter)
#                              Property 'error'
#                                  Lexical variable '$res'
#                          If body
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$channel'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      Property 'pretty'
#                                          Lexical variable '$res'
#          On
#              Expression ('on' parameter)
#                  Property 'c'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Assignment
#                              Lexical variable '$res'
#                              Call
#                                  Property 'construct'
#                                      Call
#                                          Bareword 'COMPILER'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Call
#                                                      Bareword 'getParameter'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$msg'
#                                  Named argument list [1 item]
#                                      Item 0
#                                          Pair 'pretty'
#                                              Boolean true
#                      If
#                          Expression ('if' parameter)
#                              Property 'error'
#                                  Lexical variable '$res'
#                          If body
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$channel'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                      Instruction
#                          Call
#                              Property 'privmsg'
#                                  Lexical variable '$channel'
#                              Argument list [1 item]
#                                  Item 0
#                                      Property 'pretty'
#                                          Lexical variable '$res'
#          On
#              Expression ('on' parameter)
#                  Property 'p'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Call
#                              Bareword 'handlePerl'
#                              Argument list [3 items]
#                                  Item 0
#                                      Lexical variable '$msg'
#                                  Item 1
#                                      Lexical variable '$channel'
#                                  Item 2
#                                      Boolean true
#          On
#              Expression ('on' parameter)
#                  Property 'pp'
#                      Property 'commands'
#                          Lexical variable '$bot'
#              Anonymous function { $msg $channel }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$msg'
#                      Instruction
#                          Need
#                              Lexical variable '$channel'
#                      Instruction
#                          Call
#                              Bareword 'handlePerl'
#                              Argument list [3 items]
#                                  Item 0
#                                      Lexical variable '$msg'
#                                  Item 1
#                                      Lexical variable '$channel'
#                                  Item 2
#                                      Boolean false
#          Function 'handlePerl' { $msg $channel $mini -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                  Instruction
#                      Need
#                          Lexical variable '$mini'
#                  Instruction
#                      Assignment
#                          Lexical variable '$res'
#                          Call
#                              Property 'compile'
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
#                                      Pair 'mini'
#                                          Lexical variable '$mini'
#                  If
#                      Expression ('if' parameter)
#                          Property 'error'
#                              Lexical variable '$res'
#                      If body
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
#                                  Property 'perl'
#                                      Lexical variable '$res'
#          Function 'getParameter' { $msg:IRC::Massage -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                          Argument type
#                              Bareword 'IRC::Massage'
#                  Instruction
#                      Assignment
#                          Lexical variable '$string'
#                          Operation
#                              Call
#                                  Property 'fromWord'
#                                      Index
#                                          Property 'params'
#                                              Lexical variable '$msg'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '1'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Logical or operator (||)
#                              String ''
#                  Instruction
#                      Return
#                          Call
#                              Property 'join'
#                                  Call
#                                      Property 'split'
#                                          Lexical variable '$string'
#                                      Argument list [1 item]
#                                          Item 0
#                                              String '_NL_'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '␤'
#          Function 'ircsay' { $message:Str::Any }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Argument type
#                              Bareword 'Str::Any'
#                  Instruction
#                      Assignment
#                          Lexical variable '$chan'
#                          Call
#                              Property 'getChannel'
#                                  Lexical variable '$conn'
#                              Argument list [1 item]
#                                  Item 0
#                                      Index
#                                          Property 'autojoin'
#                                              Lexical variable '$conn'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '0'
#                  Instruction
#                      Call
#                          Property 'privmsg'
#                              Lexical variable '$chan'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$message'
#          On
#              Expression ('on' parameter)
#                  Property 'disconnected'
#                      Lexical variable '$conn'
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'Disconnect...'
#                      Instruction
#                          Call
#                              Bareword 'delay'
#                              Argument list [2 items]
#                                  Item 0
#                                      Number '5'
#                                  Item 1
#                                      Anonymous function
#                                          Function body
#                                              Instruction
#                                                  Call
#                                                      Property 'connect'
#                                                          Lexical variable '$bot'
#                                                      Argument list [0 items]
#          Instruction
#              Assignment
#                  Property 'autojoin'
#                      Lexical variable '$conn'
#                  Index
#                      Lexical variable '$conf'
#                      Index list [1 item]
#                          Item 0
#                              String 'autojoin'
#          Instruction
#              Call
#                  Property 'addConnection'
#                      Lexical variable '$bot'
#                  Argument list [1 item]
#                      Item 0
#                          Lexical variable '$conn'
#          Instruction
#              Call
#                  Property 'connect'
#                      Lexical variable '$bot'
#                  Argument list [0 items]
#          Include (COMPILER, Config::JSON2, Error, IRC::Bot, IRC::Connection, IRC::Massage, Str::Any)
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
use Ferret::Core::Operations qw(_not add any_true bool less num rgx str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'main.frt', './test/35-irc-new/main.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.05 );
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
            need( $scope, $args, 'msg',     67.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 67.4 ) || return $ret_func->();
            var(
                $scope,
                command =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(68.2) )
                  ->get_index_value(
                    [ num( $f, "1" ) ], $scope, $pos->(68.25)
                  )->property_u( 'word', $pos->(68.4) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(68.45) )
                  ->property_u( 'trimPrefix', $pos->(68.6) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(68.65) ),
                $file_scope,
                $pos->(68.1)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(69.2) );
            $$scope->{'inspect'}->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(70.4)
                    )
                ],
                $scope, undef,
                $pos->(70.2)
            );
            var(
                $scope,
                response => $$this->{'factoids'}
                  ->get_index_value( [ $$scope->{'command'} ],
                    $scope, $pos->(71.4) )->property_u( 'fill', $pos->(71.7) )
                  ->(
                    [
                        undef,
                        [
                            nick => $$scope->{'msg'}
                              ->property_u( 'nick', $pos->(72.3) ),
                            user => $$scope->{'msg'}
                              ->property_u( 'user', $pos->(73.3) ),
                            host => $$scope->{'msg'}
                              ->property_u( 'host', $pos->(74.3) ),
                            chan => $$scope->{'channel'}
                              ->property_u( 'name', $pos->(75.3) )
                        ]
                    ],
                    $scope, undef,
                    $pos->(71.8)
                  ),
                $file_scope,
                $pos->(71.2)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(77.2) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(78.2) )
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(78.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            return $ret_func->(
                $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(95.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(95.33333)
                  )->property_u( 'eval', $pos->(95.53333) )
                  ->( [ undef, [] ], $scope, undef, $pos->(95.56667) )
            );
            return $ret;
        }
    );

    # Function event 'handleEval' definition
    my $func_2 = function_event_def(
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
            need( $scope, $args, 'msg',      94.2 ) || return $ret_func->();
            need( $scope, $args, 'channel',  94.4 ) || return $ret_func->();
            need( $scope, $args, 'detailed', 94.6 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'timeout'}->(
                    [
                        num( $f, "5" ),
                        $func_1->inside_scope(
                            (undef) => $scope,
                            undef, undef, $ins, undef, undef
                        )
                    ],
                    $scope, undef,
                    $pos->(95.13333)
                ),
                $file_scope,
                $pos->(95.06667)
            );
            if ( bool( $$scope->{'res'}->property_u( 'error', $pos->(96.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(97.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(97.5) ) ],
                    $scope, undef, $pos->(97.3)
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
                              ->property_u( 'result', $pos->(101.15) ),
                            quiet    => $true,
                            detailed => $$scope->{'detailed'}
                        ]
                    ],
                    $scope, undef,
                    $pos->(100.4)
                  )->property_u( 'string', $pos->(101.55) ),
                $file_scope,
                $pos->(100.2)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(102.2) )
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(102.3) );
            return $ret;
        }
    );

    # Function event 'handlePerl' definition
    my $func_3 = function_event_def(
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
            need( $scope, $args, 'msg',     136.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 136.4 ) || return $ret_func->();
            need( $scope, $args, 'mini',    136.6 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(137.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(137.2)
                  )->property_u( 'compile', $pos->(137.5) )->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(137.55)
                  ),
                $file_scope,
                $pos->(137.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(138.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(139.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(139.5) ) ],
                    $scope, undef, $pos->(139.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(142.2) )->(
                [ $$scope->{'res'}->property_u( 'perl', $pos->(142.5) ) ],
                $scope, undef, $pos->(142.3)
            );
            return $ret;
        }
    );

    # Function event 'getParameter' definition
    my $func_4 = function_event_def(
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
            need( $scope, $args, 'msg', 146.2 ) || return $ret_func->();
            var(
                $scope,
                string => any_true(
                    $scope,
                    $pos->(147.6),
                    sub {
                        $$scope->{'msg'}->property_u( 'params', $pos->(147.2) )
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(147.25) )
                          ->property_u( 'fromWord', $pos->(147.4) )->(
                            [ num( $f, "1" ) ],
                            $scope, undef, $pos->(147.45)
                          );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(147.1)
            );
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(148.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(148.2) )
                  ->property_u( 'join', $pos->(148.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(148.4) ) );
            return $ret;
        }
    );

    # Function event 'ircsay' definition
    my $func_5 = function_event_def(
        $f, $context, 'ircsay', undef,
        [
            {
                name     => 'message',
                type     => 'Str::Any',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'message', 152.2 ) || return $ret_func->();
            var(
                $scope,
                chan =>
                  $$scope->{'conn'}->property_u( 'getChannel', $pos->(153.2) )
                  ->(
                    [
                        $$scope->{'conn'}
                          ->property_u( 'autojoin', $pos->(153.35) )
                          ->get_index_value(
                            [ num( $f, "0" ) ],
                            $scope, $pos->(153.4)
                          )
                    ],
                    $scope, undef,
                    $pos->(153.25)
                  ),
                $file_scope,
                $pos->(153.1)
            );
            $$scope->{'chan'}->property_u( 'privmsg', $pos->(154.2) )
              ->( [ $$scope->{'message'} ], $scope, undef, $pos->(154.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_6 = function_def(
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
            need( $scope, $args, 'channel', 13.2 ) || return $ret_func->();
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(14.2) )->(
                [
                    str(
                        $f, "Ferret IRC bot https://github.com/cooper/ferret"
                    )
                ],
                $scope, undef,
                $pos->(14.3)
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
            need( $scope, $args, 'msg',     22.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 22.4 ) || return $ret_func->();
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(23.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(23.5) ),
                $file_scope, $pos->(23.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(26.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(26.5)
                  ),
                $file_scope,
                $pos->(26.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $pos->(27.4),
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(27.3) ),
                        num( $f, "3" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->(
                    $ret->fail(
                        $$scope->{'Error'}->(
                            [
                                get_symbol( $f, 'ParameterError' ),
                                str( $f, "Not enough parameters" )
                            ],
                            $scope, undef,
                            $pos->(28.3)
                        ),
                        $pos->(28.1)
                    )
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(31.4) )
                  ->property_u( 'lowercase', $pos->(31.7) ),
                $file_scope, $pos->(31.2)
            );
            if (
                bool(
                    $$scope->{'bot'}->property_u( 'commands', $pos->(32.3) )
                      ->property_u( $$scope->{'command'}, $pos->(32.4) )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->(
                    $ret->fail(
                        $$scope->{'Error'}->(
                            [
                                get_symbol( $f, 'ParameterError' ),
                                add(
                                    $scope,
                                    $pos->(33.35),
                                    str( $f, "Command ." ),
                                    $$scope->{'command'},
                                    str( $f, " exists" )
                                )
                            ],
                            $scope, undef,
                            $pos->(33.15)
                        ),
                        $pos->(33.05)
                    )
                );
            }
            var(
                $scope,
                response =>
                  $$scope->{'message'}->property_u( 'fromWord', $pos->(36.4) )
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(36.5) ),
                $file_scope, $pos->(36.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'command'} ],
                $$scope->{'response'}, $scope, $pos->(37.5) );
            $$scope->{'bot'}->property_u( 'commands', $pos->(38.1) )
              ->set_property(
                $$scope->{'command'} => $$scope->{'respondFactoid'},
                $pos->(38.35)
              );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(40.1) )->(
                [
                    add(
                        $scope,
                        $pos->(40.25),
                        str( $f, "OK, I will respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'response'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(40.15)
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
            need( $scope, $args, 'msg',     44.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 44.4 ) || return $ret_func->();
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(45.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(45.5) ),
                $file_scope, $pos->(45.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(48.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(48.5)
                  ),
                $file_scope,
                $pos->(48.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $pos->(49.4),
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(49.3) ),
                        num( $f, "2" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->(
                    $ret->fail(
                        $$scope->{'Error'}->(
                            [
                                get_symbol( $f, 'ParameterError' ),
                                str( $f, "Not enough parameters" )
                            ],
                            $scope, undef,
                            $pos->(50.3)
                        ),
                        $pos->(50.1)
                    )
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(54.4) )
                  ->property_u( 'lowercase', $pos->(54.7) ),
                $file_scope, $pos->(54.2)
            );
            var(
                $scope,
                existed => $$this->{'factoids'}->get_index_value(
                    [ $$scope->{'command'} ],
                    $scope, $pos->(55.4)
                ),
                $file_scope,
                $pos->(55.2)
            );
            if ( bool( _not( $$scope->{'existed'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->(
                    $ret->fail(
                        $$scope->{'Error'}->(
                            [
                                get_symbol( $f, 'ParameterError' ),
                                add(
                                    $scope,
                                    $pos->(57.35),
                                    str( $f, "No such factoid ." ),
                                    $$scope->{'command'}
                                )
                            ],
                            $scope, undef,
                            $pos->(57.15)
                        ),
                        $pos->(57.05)
                    )
                );
            }

            $$this->{'factoids'}
              ->delete_index( $$scope->{'command'}, $pos->(60.1) );

            $$scope->{'bot'}->property_u( 'commands', $pos->(61.3) )
              ->delete_property_ow( $$scope->{'command'}, $pos->(61.1) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(63.1) )->(
                [
                    add(
                        $scope,
                        $pos->(63.25),
                        str( $f, "OK, I will no longer respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'existed'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(63.15)
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
            need( $scope, $args, 'msg',     84.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 84.4 ) || return $ret_func->();
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(85.1)
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
            need( $scope, $args, 'msg',     89.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 89.4 ) || return $ret_func->();
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(90.1)
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
            need( $scope, $args, 'msg',     106.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 106.4 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(107.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(107.2)
                  )->property_u( 'tokenize', $pos->(107.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(107.55)
                  ),
                $file_scope,
                $pos->(107.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(108.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(109.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(109.5) ) ],
                    $scope, undef, $pos->(109.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(112.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(112.5) ) ],
                $scope, undef, $pos->(112.3)
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
            need( $scope, $args, 'msg',     116.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 116.4 ) || return $ret_func->();
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
                  )->property_u( 'construct', $pos->(117.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
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
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(122.5) ) ],
                $scope, undef, $pos->(122.3)
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
            need( $scope, $args, 'msg',     126.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 126.4 ) || return $ret_func->();
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(127.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_14 = function_def(
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
            need( $scope, $args, 'msg',     131.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 131.4 ) || return $ret_func->();
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(132.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_15 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'bot'}->property_u( 'connect', $pos->(160.2) )
              ->( [ undef, [] ], $scope, undef, $pos->(160.3) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_16 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [ str( $f, "Disconnected. Trying again." ) ],
                $scope, undef, $pos->(158.2)
            );
            $$scope->{'delay'}->(
                [
                    num( $f, "5" ),
                    $func_15->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    )
                ],
                $scope, undef,
                $pos->(159.2)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        respondFactoid => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope(
        handleEval => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_3->inside_scope(
        handlePerl => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_4->inside_scope(
        getParameter => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_5->inside_scope(
        ircsay => $scope,
        $context, undef, $ins, undef, undef
    );
    provides_namespaces( $context, $file_name, $pos->(166.5), qw() );
    load_namespaces( $context, $file_name, $pos->(166.5),
        qw(COMPILER Config::JSON2 Error IRC::Bot IRC::Connection IRC::Massage Str::Any)
    );
    var(
        $scope,
        conf => $$scope->{'Config::JSON2'}
          ->( [ str( $f, "config.json" ) ], $scope, undef, $pos->(1.3) )
          ->property_u( 'parse', $pos->(1.45) )
          ->( [ undef, [] ], $scope, undef, $pos->(1.5) ),
        undef, $pos->(1.1)
    );
    var(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(3.35) ),
        undef, $pos->(3.15)
    );
    try_catch(
        $f, $scope,
        sub {
            var(
                $context,
                conn => $$scope->{'IRC::Connection'}->(
                    [
                        undef,
                        [
                            addr => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "server" ) ], $scope,
                                $pos->(6.3)
                            ),
                            nick => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "nick" ) ],
                                $scope, $pos->(7.3)
                            ),
                            user => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "user" ) ],
                                $scope, $pos->(8.3)
                            ),
                            real => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "real" ) ],
                                $scope, $pos->(9.3)
                            )
                        ]
                    ],
                    $scope, undef,
                    $pos->(5.7)
                ),
                undef,
                $pos->(5.3)
            );
        },
        sub {
            my ($scope) = @_;
            throw( $$scope->{'e'}, $pos->(10.5) );
        },
        'e'
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(12.3) ),
        'info', $self, $scope,
        $func_6->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => create_hash( $f, [] ), $pos->(19.3) );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(21.3) ),
        'add', $self, $scope,
        $func_7->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(43.3) ),
        'del', $self, $scope,
        $func_8->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(83.3) ),
        'e', $self, $scope,
        $func_9->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(88.3) ),
        'i', $self, $scope,
        $func_10->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(105.3) ),
        't', $self, $scope,
        $func_11->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(115.3) ),
        'c', $self, $scope,
        $func_12->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(125.3) ),
        'p', $self, $scope,
        $func_13->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(130.3) ),
        'pp', $self, $scope,
        $func_14->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'conn'},
        'disconnected',
        $self, $scope,
        $func_16->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'conn'}->set_property(
        autojoin => $$scope->{'conf'}
          ->get_index_value( [ str( $f, "autojoin" ) ], $scope, $pos->(164.5) ),
        $pos->(164.3)
    );
    $$scope->{'bot'}->property_u( 'addConnection', $pos->(165.2) )
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(165.3) );
    $$scope->{'bot'}->property_u( 'connect', $pos->(166.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(166.3) );
};

after_content($file_name);
