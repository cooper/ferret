# === Document Model ===
#  Document './test/20-irc-complex/run.frt'
#      Instruction
#          Assignment
#              Lexical variable '$bot'
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
