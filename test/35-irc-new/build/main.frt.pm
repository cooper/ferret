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
#              Delete modifier
#                  Property 'File'
#                      Property 'mainContext'
#                          Bareword 'NATIVE'
#          Instruction
#              Delete modifier
#                  Property 'slurp'
#                      Bareword 'NATIVE'
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
#          Include (COMPILER, Config::JSON2, Error, IRC::Bot, IRC::Connection, IRC::Massage, NATIVE, Str::Any)
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
            need( $scope, $args, 'msg',     71.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 71.4 ) || return $ret_func->();
            var(
                $scope,
                command =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(72.2) )
                  ->get_index_value(
                    [ num( $f, "1" ) ], $scope, $pos->(72.25)
                  )->property_u( 'word', $pos->(72.4) )
                  ->( [ num( $f, "0" ) ], $scope, undef, $pos->(72.45) )
                  ->property_u( 'trimPrefix', $pos->(72.6) )
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(72.65) ),
                $file_scope,
                $pos->(72.1)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(73.2) );
            $$scope->{'inspect'}->(
                [
                    $$this->{'factoids'}->get_index_value(
                        [ $$scope->{'command'} ],
                        $scope, $pos->(74.4)
                    )
                ],
                $scope, undef,
                $pos->(74.2)
            );
            var(
                $scope,
                response => $$this->{'factoids'}
                  ->get_index_value( [ $$scope->{'command'} ],
                    $scope, $pos->(75.4) )->property_u( 'fill', $pos->(75.7) )
                  ->(
                    [
                        undef,
                        [
                            nick => $$scope->{'msg'}
                              ->property_u( 'nick', $pos->(76.3) ),
                            user => $$scope->{'msg'}
                              ->property_u( 'user', $pos->(77.3) ),
                            host => $$scope->{'msg'}
                              ->property_u( 'host', $pos->(78.3) ),
                            chan => $$scope->{'channel'}
                              ->property_u( 'name', $pos->(79.3) )
                        ]
                    ],
                    $scope, undef,
                    $pos->(75.8)
                  ),
                $file_scope,
                $pos->(75.2)
            );
            $$scope->{'inspect'}
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(81.2) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(82.2) )
              ->( [ $$scope->{'response'} ], $scope, undef, $pos->(82.3) );
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
                            undef,                $pos->(99.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(99.33333)
                  )->property_u( 'eval', $pos->(99.53333) )
                  ->( [ undef, [] ], $scope, undef, $pos->(99.56667) )
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
            need( $scope, $args, 'msg',      98.2 ) || return $ret_func->();
            need( $scope, $args, 'channel',  98.4 ) || return $ret_func->();
            need( $scope, $args, 'detailed', 98.6 ) || return $ret_func->();
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
                    $pos->(99.13333)
                ),
                $file_scope,
                $pos->(99.06667)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(100.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(101.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(101.5) ) ],
                    $scope, undef, $pos->(101.3)
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
                              ->property_u( 'result', $pos->(105.15) ),
                            quiet    => $true,
                            detailed => $$scope->{'detailed'}
                        ]
                    ],
                    $scope, undef,
                    $pos->(104.4)
                  )->property_u( 'string', $pos->(105.55) ),
                $file_scope,
                $pos->(104.2)
            );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(106.2) )
              ->( [ $$scope->{'string'} ], $scope, undef, $pos->(106.3) );
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
            need( $scope, $args, 'msg',     140.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 140.4 ) || return $ret_func->();
            need( $scope, $args, 'mini',    140.6 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(141.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(141.2)
                  )->property_u( 'compile', $pos->(141.5) )->(
                    [ undef, [ mini => $$scope->{'mini'} ] ], $scope,
                    undef, $pos->(141.55)
                  ),
                $file_scope,
                $pos->(141.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(142.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(143.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(143.5) ) ],
                    $scope, undef, $pos->(143.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(146.2) )->(
                [ $$scope->{'res'}->property_u( 'perl', $pos->(146.5) ) ],
                $scope, undef, $pos->(146.3)
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
            need( $scope, $args, 'msg', 150.2 ) || return $ret_func->();
            var(
                $scope,
                string => any_true(
                    $scope,
                    $pos->(151.6),
                    sub {
                        $$scope->{'msg'}->property_u( 'params', $pos->(151.2) )
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(151.25) )
                          ->property_u( 'fromWord', $pos->(151.4) )->(
                            [ num( $f, "1" ) ],
                            $scope, undef, $pos->(151.45)
                          );
                    },
                    sub { str( $f, "" ) }
                ),
                $file_scope,
                $pos->(151.1)
            );
            return $ret_func->(
                $$scope->{'string'}->property_u( 'split', $pos->(152.15) )
                  ->( [ str( $f, "_NL_" ) ], $scope, undef, $pos->(152.2) )
                  ->property_u( 'join', $pos->(152.35) )
                  ->( [ str( $f, "\n" ) ], $scope, undef, $pos->(152.4) ) );
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
            need( $scope, $args, 'message', 156.2 ) || return $ret_func->();
            var(
                $scope,
                chan =>
                  $$scope->{'conn'}->property_u( 'getChannel', $pos->(157.2) )
                  ->(
                    [
                        $$scope->{'conn'}
                          ->property_u( 'autojoin', $pos->(157.35) )
                          ->get_index_value(
                            [ num( $f, "0" ) ],
                            $scope, $pos->(157.4)
                          )
                    ],
                    $scope, undef,
                    $pos->(157.25)
                  ),
                $file_scope,
                $pos->(157.1)
            );
            $$scope->{'chan'}->property_u( 'privmsg', $pos->(158.2) )
              ->( [ $$scope->{'message'} ], $scope, undef, $pos->(158.3) );
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
            need( $scope, $args, 'channel', 17.2 ) || return $ret_func->();
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(18.2) )->(
                [
                    str(
                        $f, "Ferret IRC bot https://github.com/cooper/ferret"
                    )
                ],
                $scope, undef,
                $pos->(18.3)
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
            need( $scope, $args, 'msg',     26.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 26.4 ) || return $ret_func->();
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(27.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(27.5) ),
                $file_scope, $pos->(27.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(30.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(30.5)
                  ),
                $file_scope,
                $pos->(30.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $pos->(31.4),
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(31.3) ),
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
                            $pos->(32.3)
                        ),
                        $pos->(32.1)
                    )
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(35.4) )
                  ->property_u( 'lowercase', $pos->(35.7) ),
                $file_scope, $pos->(35.2)
            );
            if (
                bool(
                    $$scope->{'bot'}->property_u( 'commands', $pos->(36.3) )
                      ->property_u( $$scope->{'command'}, $pos->(36.4) )
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
                                    $pos->(37.35),
                                    str( $f, "Command ." ),
                                    $$scope->{'command'},
                                    str( $f, " exists" )
                                )
                            ],
                            $scope, undef,
                            $pos->(37.15)
                        ),
                        $pos->(37.05)
                    )
                );
            }
            var(
                $scope,
                response =>
                  $$scope->{'message'}->property_u( 'fromWord', $pos->(40.4) )
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(40.5) ),
                $file_scope, $pos->(40.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'command'} ],
                $$scope->{'response'}, $scope, $pos->(41.5) );
            $$scope->{'bot'}->property_u( 'commands', $pos->(42.1) )
              ->set_property(
                $$scope->{'command'} => $$scope->{'respondFactoid'},
                $pos->(42.35)
              );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(44.1) )->(
                [
                    add(
                        $scope,
                        $pos->(44.25),
                        str( $f, "OK, I will respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'response'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(44.15)
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
            need( $scope, $args, 'msg',     48.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 48.4 ) || return $ret_func->();
            var(
                $scope,
                message =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(49.4) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(49.5) ),
                $file_scope, $pos->(49.2)
            );
            var(
                $scope,
                parts =>
                  $$scope->{'message'}->property_u( 'split', $pos->(52.4) )->(
                    [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                    undef, $pos->(52.5)
                  ),
                $file_scope,
                $pos->(52.2)
            );
            if (
                bool(
                    less(
                        $scope,
                        $pos->(53.4),
                        $$scope->{'parts'}
                          ->property_u( 'length', $pos->(53.3) ),
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
                            $pos->(54.3)
                        ),
                        $pos->(54.1)
                    )
                );
            }
            var(
                $scope,
                command => $$scope->{'parts'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(58.4) )
                  ->property_u( 'lowercase', $pos->(58.7) ),
                $file_scope, $pos->(58.2)
            );
            var(
                $scope,
                existed => $$this->{'factoids'}->get_index_value(
                    [ $$scope->{'command'} ],
                    $scope, $pos->(59.4)
                ),
                $file_scope,
                $pos->(59.2)
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
                                    $pos->(61.35),
                                    str( $f, "No such factoid ." ),
                                    $$scope->{'command'}
                                )
                            ],
                            $scope, undef,
                            $pos->(61.15)
                        ),
                        $pos->(61.05)
                    )
                );
            }

            $$this->{'factoids'}
              ->delete_index( $$scope->{'command'}, $pos->(64.1) );

            $$scope->{'bot'}->property_u( 'commands', $pos->(65.3) )
              ->delete_property_ow( $$scope->{'command'}, $pos->(65.1) );
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(67.1) )->(
                [
                    add(
                        $scope,
                        $pos->(67.25),
                        str( $f, "OK, I will no longer respond to ." ),
                        $$scope->{'command'},
                        str( $f, " with '" ),
                        $$scope->{'existed'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(67.15)
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
            need( $scope, $args, 'msg',     88.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 88.4 ) || return $ret_func->();
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(89.1)
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
            need( $scope, $args, 'msg',     93.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 93.4 ) || return $ret_func->();
            $$scope->{'handleEval'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(94.1)
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
            need( $scope, $args, 'msg',     110.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 110.4 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(111.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(111.2)
                  )->property_u( 'tokenize', $pos->(111.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(111.55)
                  ),
                $file_scope,
                $pos->(111.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(112.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(113.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(113.5) ) ],
                    $scope, undef, $pos->(113.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(116.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(116.5) ) ],
                $scope, undef, $pos->(116.3)
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
            need( $scope, $args, 'msg',     120.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 120.4 ) || return $ret_func->();
            var(
                $scope,
                res => $$scope->{'COMPILER'}->(
                    [
                        $$scope->{'getParameter'}->(
                            [ $$scope->{'msg'} ], $scope,
                            undef,                $pos->(121.3)
                        )
                    ],
                    $scope, undef,
                    $pos->(121.2)
                  )->property_u( 'construct', $pos->(121.5) )->(
                    [ undef, [ pretty => $true ] ], $scope,
                    undef, $pos->(121.55)
                  ),
                $file_scope,
                $pos->(121.1)
            );
            if (
                bool( $$scope->{'res'}->property_u( 'error', $pos->(122.3) ) ) )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'channel'}->property_u( 'privmsg', $pos->(123.2) )->(
                    [ $$scope->{'res'}->property_u( 'error', $pos->(123.5) ) ],
                    $scope, undef, $pos->(123.3)
                );
                return $ret_func->();
            }
            $$scope->{'channel'}->property_u( 'privmsg', $pos->(126.2) )->(
                [ $$scope->{'res'}->property_u( 'pretty', $pos->(126.5) ) ],
                $scope, undef, $pos->(126.3)
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
            need( $scope, $args, 'msg',     130.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 130.4 ) || return $ret_func->();
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $true ],
                $scope, undef, $pos->(131.1)
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
            need( $scope, $args, 'msg',     135.2 ) || return $ret_func->();
            need( $scope, $args, 'channel', 135.4 ) || return $ret_func->();
            $$scope->{'handlePerl'}->(
                [ $$scope->{'msg'}, $$scope->{'channel'}, $false ],
                $scope, undef, $pos->(136.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_15 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'bot'}->property_u( 'connect', $pos->(164.2) )
              ->( [ undef, [] ], $scope, undef, $pos->(164.3) );
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
                $scope, undef, $pos->(162.2)
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
                $pos->(163.2)
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
    provides_namespaces( $context, $file_name, $pos->(170.5), qw() );
    load_namespaces( $context, $file_name, $pos->(170.5),
        qw(COMPILER Config::JSON2 Error IRC::Bot IRC::Connection IRC::Massage NATIVE Str::Any)
    );
    var(
        $scope,
        conf => $$scope->{'Config::JSON2'}
          ->( [ str( $f, "config.json" ) ], $scope, undef, $pos->(1.3) )
          ->property_u( 'parse', $pos->(1.45) )
          ->( [ undef, [] ], $scope, undef, $pos->(1.5) ),
        undef, $pos->(1.1)
    );

    $$scope->{'NATIVE'}->property_u( 'mainContext', $pos->(4.3) )
      ->delete_property_ow( 'File', $pos->(4.1) );

    $$scope->{'NATIVE'}->delete_property_ow( 'slurp', $pos->(5.1) );
    var(
        $context,
        bot =>
          $$scope->{'IRC::Bot'}->( [ undef, [] ], $scope, undef, $pos->(7.35) ),
        undef, $pos->(7.15)
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
                                $pos->(10.3)
                            ),
                            nick => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "nick" ) ],
                                $scope, $pos->(11.3)
                            ),
                            user => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "user" ) ],
                                $scope, $pos->(12.3)
                            ),
                            real => $$scope->{'conf'}->get_index_value(
                                [ str( $f, "real" ) ],
                                $scope, $pos->(13.3)
                            )
                        ]
                    ],
                    $scope, undef,
                    $pos->(9.7)
                ),
                undef,
                $pos->(9.3)
            );
        },
        sub {
            my ($scope) = @_;
            throw( $$scope->{'e'}, $pos->(14.5) );
        },
        'e'
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(16.3) ),
        'info', $self, $scope,
        $func_6->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'bot'}
      ->set_property( factoids => create_hash( $f, [] ), $pos->(23.3) );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(25.3) ),
        'add', $self, $scope,
        $func_7->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(47.3) ),
        'del', $self, $scope,
        $func_8->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(87.3) ),
        'e', $self, $scope,
        $func_9->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(92.3) ),
        'i', $self, $scope,
        $func_10->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(109.3) ),
        't', $self, $scope,
        $func_11->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(119.3) ),
        'c', $self, $scope,
        $func_12->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(129.3) ),
        'p', $self, $scope,
        $func_13->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    on(
        $$scope->{'bot'}->property_u( 'commands', $pos->(134.3) ),
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
          ->get_index_value( [ str( $f, "autojoin" ) ], $scope, $pos->(168.5) ),
        $pos->(168.3)
    );
    $$scope->{'bot'}->property_u( 'addConnection', $pos->(169.2) )
      ->( [ $$scope->{'conn'} ], $scope, undef, $pos->(169.3) );
    $$scope->{'bot'}->property_u( 'connect', $pos->(170.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(170.3) );
};

after_content($file_name);
