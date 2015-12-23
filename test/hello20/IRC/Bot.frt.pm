# === Tokenization ===
#         PKG_DEC | {"name":"IRC"}
#       CLASS_DEC | {"name":"Bot"}
#         VAR_LEX | "handlers"
#       OP_ASSIGN | 
#       BRACKET_S | 
#      PROP_VALUE | "MODE"
#        BAREWORD | "_joinChannels"
#        OP_COMMA | 
#      PROP_VALUE | "PING"
#        BAREWORD | "_pong"
#        OP_COMMA | 
#      PROP_VALUE | "PRIVMSG"
#        BAREWORD | "_handleMessage"
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "initialCommands"
#       OP_ASSIGN | 
#       BRACKET_S | 
#      PROP_VALUE | "hello"
#        BAREWORD | "_commandHello"
#        OP_COMMA | 
#      PROP_VALUE | "hi"
#        BAREWORD | "_commandHello"
#        OP_COMMA | 
#      PROP_VALUE | "add"
#        BAREWORD | "_commandAdd"
#       BRACKET_E | 
#         OP_SEMI | 
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#        VAR_THIS | "addr"
#        OP_VALUE | 
#        BAREWORD | "Str"
#        OP_COMMA | 
#        VAR_THIS | "nick"
#        OP_VALUE | 
#        BAREWORD | "Str"
#         OP_SEMI | 
#    KEYWORD_WANT | 
#        VAR_THIS | "port"
#        OP_VALUE | 
#        BAREWORD | "Num"
#       OP_ASSIGN | 
#          NUMBER | "6667"
#         OP_SEMI | 
#    KEYWORD_WANT | 
#        VAR_THIS | "user"
#        OP_VALUE | 
#        BAREWORD | "Str"
#       OP_ASSIGN | 
#          STRING | ["ferret"]
#         OP_SEMI | 
#    KEYWORD_WANT | 
#        VAR_THIS | "real"
#        OP_VALUE | 
#        BAREWORD | "Str"
#       OP_ASSIGN | 
#          STRING | ["Ferret IRC"]
#         OP_SEMI | 
#        VAR_THIS | "commands"
#       OP_ASSIGN | 
#         VAR_LEX | "initialCommands"
#         OP_SEMI | 
#        VAR_THIS | "factoids"
#       OP_ASSIGN | 
#       BRACKET_S | 
#        OP_VALUE | 
#       BRACKET_E | 
#         OP_SEMI | 
#        VAR_THIS | "sock"
#       OP_ASSIGN | 
#        BAREWORD | "Socket"
#         OP_PACK | 
#        BAREWORD | "TCP"
#      PAREN_CALL | 
#      PROP_VALUE | "address"
#        VAR_THIS | "addr"
#        OP_COMMA | 
#      PROP_VALUE | "port"
#        VAR_THIS | "port"
#        OP_COMMA | 
#      PROP_VALUE | "readMode"
#         VAR_SYM | "line"
#         PAREN_E | 
#         OP_SEMI | 
#      KEYWORD_ON | 
#        VAR_THIS | "sock"
#        PROPERTY | "connected"
#        OP_COMMA | 
#         VAR_SYM | "sendRegistration"
#       CLOSURE_S | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["USER ",["VAR_THIS","user",31]," ","*"," ","*"," :",["VAR_THIS","real",31]]
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["NICK ",["VAR_THIS","nick",32]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#      KEYWORD_ON | 
#        VAR_THIS | "sock"
#        PROPERTY | "gotLine"
#        OP_COMMA | 
#         VAR_SYM | "handleLine"
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "data"
#         OP_SEMI | 
#        VAR_THIS | "handleLine"
#      PAREN_CALL | 
#         VAR_LEX | "data"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLOSURE_E | 
#          METHOD | {"name":"addCommand"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "command"
#        OP_VALUE | 
#        BAREWORD | "Str"
#        OP_COMMA | 
#         VAR_LEX | "callback"
#         OP_SEMI | 
#      KEYWORD_IF | 
#        VAR_THIS | "commands"
#     BRACKET_IDX | 
#         VAR_LEX | "command"
#       BRACKET_E | 
#        OP_VALUE | 
#        BAREWORD | "overwrote"
#       OP_RETURN | 
#    KEYWORD_TRUE | 
#         OP_SEMI | 
#        VAR_THIS | "commands"
#     BRACKET_IDX | 
#         VAR_LEX | "command"
#       BRACKET_E | 
#       OP_ASSIGN | 
#         VAR_LEX | "callback"
#         OP_SEMI | 
#        BAREWORD | "added"
#       OP_RETURN | 
#    KEYWORD_TRUE | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"connect"}
#       CLOSURE_S | 
#        VAR_THIS | "sock"
#        PROPERTY | "connect"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"send"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "line"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["send: ",["VAR_LEX","line",57]]
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "sock"
#        PROPERTY | "println"
#      PAREN_CALL | 
#         VAR_LEX | "line"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"handleLine"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "line"
#         OP_SEMI | 
#         VAR_LEX | "s"
#       OP_ASSIGN | 
#         VAR_LEX | "line"
#        PROPERTY | "split"
#      PAREN_CALL | 
#          STRING | [" "]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "command"
#       OP_ASSIGN | 
#         VAR_LEX | "s"
#     BRACKET_IDX | 
#          NUMBER | "1"
#       BRACKET_E | 
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "s"
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#        OP_EQUAL | 
#          STRING | ["PING"]
#        OP_VALUE | 
#         VAR_LEX | "command"
#       OP_ASSIGN | 
#         VAR_LEX | "s"
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["recv[",["VAR_LEX","command",72],"]: ",["VAR_LEX","line",72]]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "handlers"
#     BRACKET_IDX | 
#         VAR_LEX | "command"
#       BRACKET_E | 
#        OP_MAYBE | 
#      PAREN_CALL | 
#      PROP_VALUE | "_self"
#        VAR_SPEC | "self"
#        OP_COMMA | 
#      PROP_VALUE | "line"
#         VAR_LEX | "line"
#        OP_COMMA | 
#      PROP_VALUE | "command"
#         VAR_LEX | "command"
#        OP_COMMA | 
#      PROP_VALUE | "s"
#         VAR_LEX | "s"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"privmsg"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "channel"
#        OP_VALUE | 
#        BAREWORD | "Str"
#        OP_COMMA | 
#         VAR_LEX | "message"
#        OP_VALUE | 
#        BAREWORD | "Str"
#         OP_SEMI | 
#     KEYWORD_FOR | 
#         VAR_LEX | "line"
#      KEYWORD_IN | 
#         VAR_LEX | "message"
#        PROPERTY | "split"
#      PAREN_CALL | 
#          STRING | ["\n"]
#         PAREN_E | 
#       CLOSURE_S | 
#      KEYWORD_IF | 
#         VAR_LEX | "line"
#        PROPERTY | "length"
#       OP_NEQUAL | 
#          NUMBER | "0"
#        OP_VALUE | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["PRIVMSG ",["VAR_LEX","channel",88]," :",["VAR_LEX","line",88]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_joinChannels"}
#       CLOSURE_S | 
#      KEYWORD_IF | 
#        VAR_THIS | "_joinedChannels"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#         OP_SEMI | 
#        VAR_THIS | "_joinedChannels"
#       OP_ASSIGN | 
#    KEYWORD_TRUE | 
#         OP_SEMI | 
#      KEYWORD_IF | 
#        VAR_THIS | "autojoin"
#       CLOSURE_S | 
#     KEYWORD_FOR | 
#         VAR_LEX | "chan"
#      KEYWORD_IN | 
#        VAR_THIS | "autojoin"
#       CLOSURE_S | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["JOIN ",["VAR_LEX","chan",101]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLOSURE_E | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_pong"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "s"
#         OP_SEMI | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["PONG "]
#          OP_ADD | 
#         VAR_LEX | "s"
#     BRACKET_IDX | 
#          NUMBER | "1"
#       BRACKET_E | 
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_handleMessage"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "line"
#        OP_COMMA | 
#         VAR_LEX | "s"
#         OP_SEMI | 
#         VAR_LEX | "msg"
#       OP_ASSIGN | 
#        BAREWORD | "IRC"
#         OP_PACK | 
#        BAREWORD | "Message"
#      PAREN_CALL | 
#         VAR_LEX | "line"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "msg"
#       OP_RETURN | 
#         VAR_LEX | "msg"
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "msg"
#        PROPERTY | "command"
#        OP_VALUE | 
#        VAR_THIS | "commands"
#     BRACKET_IDX | 
#         VAR_LEX | "msg"
#        PROPERTY | "command"
#       BRACKET_E | 
#        OP_MAYBE | 
#      PAREN_CALL | 
#      PROP_VALUE | "_self"
#        VAR_SPEC | "self"
#        OP_COMMA | 
#      PROP_VALUE | "line"
#         VAR_LEX | "line"
#        OP_COMMA | 
#      PROP_VALUE | "s"
#         VAR_LEX | "s"
#        OP_COMMA | 
#      PROP_VALUE | "msg"
#         VAR_LEX | "msg"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_commandHello"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "msg"
#         OP_SEMI | 
#         VAR_LEX | "nickname"
#       OP_ASSIGN | 
#         VAR_LEX | "msg"
#        PROPERTY | "nickname"
#         OP_SEMI | 
#        VAR_THIS | "privmsg"
#      PAREN_CALL | 
#         VAR_LEX | "msg"
#        PROPERTY | "channel"
#        OP_COMMA | 
#          STRING | ["Hi ",["VAR_LEX","nickname",133],"!"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_commandAdd"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "msg"
#         OP_SEMI | 
#        BAREWORD | "inspect"
#      PAREN_CALL | 
#         VAR_LEX | "msg"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "trigger"
#       OP_ASSIGN | 
#         VAR_LEX | "msg"
#        PROPERTY | "parts"
#     BRACKET_IDX | 
#          NUMBER | "1"
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "response"
#       OP_ASSIGN | 
#         VAR_LEX | "msg"
#        PROPERTY | "fromWord"
#      PAREN_CALL | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "factoids"
#     BRACKET_IDX | 
#         VAR_LEX | "trigger"
#       BRACKET_E | 
#       OP_ASSIGN | 
#         VAR_LEX | "response"
#         OP_SEMI | 
#        VAR_THIS | "commands"
#     BRACKET_IDX | 
#         VAR_LEX | "trigger"
#       BRACKET_E | 
#       OP_ASSIGN | 
#        BAREWORD | "_commandFactoid"
#         OP_SEMI | 
#        VAR_THIS | "privmsg"
#      PAREN_CALL | 
#         VAR_LEX | "msg"
#        PROPERTY | "channel"
#        OP_COMMA | 
#          STRING | ["alright, associating .",["VAR_LEX","trigger",148]," with '",["VAR_LEX","response",148],"'"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"_commandFactoid"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "msg"
#         OP_SEMI | 
#         VAR_LEX | "response"
#       OP_ASSIGN | 
#        VAR_THIS | "factoids"
#     BRACKET_IDX | 
#         VAR_LEX | "msg"
#        PROPERTY | "command"
#       BRACKET_E | 
#         OP_SEMI | 
#        VAR_THIS | "privmsg"
#      PAREN_CALL | 
#         VAR_LEX | "msg"
#        PROPERTY | "channel"
#        OP_COMMA | 
#         VAR_LEX | "response"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
# === Document Model ===
#  Document './test/hello20/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Instruction
#              Assignment (lexical variable '$handlers')
#                  Hash [3 items]
#                      Item 0
#                          Pair 'MODE'
#                              Bareword '_joinChannels'
#                      Item 1
#                          Pair 'PING'
#                              Bareword '_pong'
#                      Item 2
#                          Pair 'PRIVMSG'
#                              Bareword '_handleMessage'
#          Instruction
#              Assignment (lexical variable '$initialCommands')
#                  Hash [3 items]
#                      Item 0
#                          Pair 'hello'
#                              Bareword '_commandHello'
#                      Item 1
#                          Pair 'hi'
#                              Bareword '_commandHello'
#                      Item 2
#                          Pair 'add'
#                              Bareword '_commandAdd'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@addr'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@port'
#                          Expression ('want' parameter)
#                              Number '6667'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@user'
#                          Expression ('want' parameter)
#                              String 'ferret'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Expression ('want' parameter)
#                              String 'Ferret IRC'
#                          Bareword 'Str'
#                  Instruction
#                      Assignment (instance variable '@commands')
#                          Lexical variable '$initialCommands'
#                  Instruction
#                      Assignment (instance variable '@factoids')
#                          Hash [0 items]
#                  Instruction
#                      Assignment (instance variable '@sock')
#                          Call
#                              Bareword 'Socket::TCP'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'address'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                                  Item 2
#                                      Pair 'readMode'
#                                          Symbol :line
#                  On ('sendRegistration' callback)
#                      Expression ('on' parameter)
#                          Property 'connected'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'USER '
#                                                  Addition operator (+)
#                                                  Instance variable '@user'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' :'
#                                                  Addition operator (+)
#                                                  Instance variable '@real'
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'NICK '
#                                                  Addition operator (+)
#                                                  Instance variable '@nick'
#                  On ('handleLine' callback)
#                      Expression ('on' parameter)
#                          Property 'gotLine'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Instance variable '@handleLine'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$data'
#          Method 'addCommand'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$command'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$callback'
#                  If
#                      Expression ('if' parameter)
#                          Index
#                              Instance variable '@commands'
#                              Single value [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'overwrote'
#                                  Boolean true
#                  Instruction
#                      Assignment (index)
#                          Lexical variable '$callback'
#                  Instruction
#                      Return pair 'added'
#                          Boolean true
#          Method 'connect'
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Instance variable '@sock'
#                          Argument list [0 items]
#          Method 'send'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'send: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Property 'println'
#                              Instance variable '@sock'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#          Method 'handleLine'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Assignment (lexical variable '$s')
#                          Call
#                              Property 'split'
#                                  Lexical variable '$line'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ' '
#                  Instruction
#                      Assignment (lexical variable '$command')
#                          Index
#                              Lexical variable '$s'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Equality
#                              Index
#                                  Lexical variable '$s'
#                                  Single value [1 items]
#                                      Item 0
#                                          Number '0'
#                              String 'PING'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment (lexical variable '$command')
#                                  Index
#                                      Lexical variable '$s'
#                                      Single value [1 items]
#                                          Item 0
#                                              Number '0'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'recv['
#                                      Addition operator (+)
#                                      Lexical variable '$command'
#                                      Addition operator (+)
#                                      String ']: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Maybe
#                              Index
#                                  Lexical variable '$handlers'
#                                  Single value [1 items]
#                                      Item 0
#                                          Lexical variable '$command'
#                          Named argument list [4 items]
#                              Item 0
#                                  Pair '_self'
#                                      Special variable '*self'
#                              Item 1
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 2
#                                  Pair 'command'
#                                      Lexical variable '$command'
#                              Item 3
#                                  Pair 's'
#                                      Lexical variable '$s'
#          Method 'privmsg'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Bareword 'Str'
#                  For
#                      Expression ('for' parameter)
#                          Lexical variable '$line'
#                      Expression ('in' parameter)
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String '␤'
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Equality
#                                      Property 'length'
#                                          Lexical variable '$line'
#                                      Number '0'
#                              Body ('if' scope)
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Operation
#                                                      String 'PRIVMSG '
#                                                      Addition operator (+)
#                                                      Lexical variable '$channel'
#                                                      Addition operator (+)
#                                                      String ' :'
#                                                      Addition operator (+)
#                                                      Lexical variable '$line'
#          Function '_joinChannels'
#              Body ('function' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@_joinedChannels'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment (instance variable '@_joinedChannels')
#                          Boolean true
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@autojoin'
#                      Body ('if' scope)
#                          For
#                              Expression ('for' parameter)
#                                  Lexical variable '$chan'
#                              Expression ('in' parameter)
#                                  Instance variable '@autojoin'
#                              Body ('for' scope)
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Operation
#                                                      String 'JOIN '
#                                                      Addition operator (+)
#                                                      Lexical variable '$chan'
#          Function '_pong'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'PONG '
#                                      Addition operator (+)
#                                      Index
#                                          Lexical variable '$s'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Number '1'
#          Function '_handleMessage'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Assignment (lexical variable '$msg')
#                          Call
#                              Bareword 'IRC::Message'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$line'
#                  Instruction
#                      Return pair 'msg'
#                          Lexical variable '$msg'
#                  If
#                      Expression ('if' parameter)
#                          Property 'command'
#                              Lexical variable '$msg'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Maybe
#                                      Index
#                                          Instance variable '@commands'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Property 'command'
#                                                      Lexical variable '$msg'
#                                  Named argument list [4 items]
#                                      Item 0
#                                          Pair '_self'
#                                              Special variable '*self'
#                                      Item 1
#                                          Pair 'line'
#                                              Lexical variable '$line'
#                                      Item 2
#                                          Pair 's'
#                                              Lexical variable '$s'
#                                      Item 3
#                                          Pair 'msg'
#                                              Lexical variable '$msg'
#          Function '_commandHello'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$nickname')
#                          Property 'nickname'
#                              Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Operation
#                                      String 'Hi '
#                                      Addition operator (+)
#                                      Lexical variable '$nickname'
#                                      Addition operator (+)
#                                      String '!'
#          Function '_commandAdd'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$trigger')
#                          Index
#                              Property 'parts'
#                                  Lexical variable '$msg'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment (lexical variable '$response')
#                          Call
#                              Property 'fromWord'
#                                  Lexical variable '$msg'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment (index)
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment (index)
#                          Bareword '_commandFactoid'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Operation
#                                      String 'alright, a...'
#                                      Addition operator (+)
#                                      Lexical variable '$trigger'
#                                      Addition operator (+)
#                                      String ' with ''
#                                      Addition operator (+)
#                                      Lexical variable '$response'
#                                      Addition operator (+)
#                                      String '''
#          Function '_commandFactoid'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$response')
#                          Index
#                              Instance variable '@factoids'
#                              Single value [1 items]
#                                  Item 0
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$response'
#      Include (IRC, IRC::Message, Num, Socket, Socket::TCP, Str)
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

FF::before_content('Bot.frt');

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'IRC' );
    FF::load_core('IRC');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope,
        'sendRegistration',
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER " ),
                        $self->property_u('user'),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $self->property_u('real')
                    )
                ],
                $scope, undef, 30.4
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 31.66667
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope,
        'handleLine',
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data', 36.66667 ) or return;
            $self->property_u('handleLine')
              ->call_u( [ $scope->property_u('data') ], $scope, undef, 37.4 );
            return $return;
        }
    );

    # Function event '_joinChannels' definition
    my $func_2 = FF::function_event_def(
        $f, $scope,
        '_joinChannels',
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            if ( bool( $self->property_u('_joinedChannels') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $self->set_property( _joinedChannels => $true, 96.5 );
            if ( bool( $self->property_u('autojoin') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                FF::iterate(
                    $f, $scope,
                    $self->property_u('autojoin'),
                    'chan',
                    sub {
                        my $scope = shift;
                        $self->property_u('send')->call_u(
                            [
                                add(
                                    $scope,
                                    str( $f, "JOIN " ),
                                    $scope->property_u('chan')
                                )
                            ],
                            $scope, undef,
                            100.66667
                        );
                    }
                );
            }
            return $return;
        }
    );

    # Function event '_pong' definition
    my $func_3 = FF::function_event_def(
        $f, $scope, '_pong',
        [ { name => 's', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 's', 108.66667 ) or return;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "PONG " ),
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 1 ) ], $scope )
                    )
                ],
                $scope, undef,
                109.66667
            );
            return $return;
        }
    );

    # Function event '_handleMessage' definition
    my $func_4 = FF::function_event_def(
        $f, $scope,
        '_handleMessage',
        [
            { name => 'line', type => undef, optional => undef, more => undef },
            { name => 's',    type => undef, optional => undef, more => undef }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'line', 115.4 ) or return;
            FF::need( $scope, $arguments, 's',    115.8 ) or return;
            $scope->set_property_ow(
                $context,
                msg => $scope->property_u('IRC::Message')->call_u(
                    [ $scope->property_u('line') ], $scope,
                    undef,                          117.66667
                ),
                117.22222
            );
            $return->set_property( msg => $scope->property_u('msg'), 118.5 );
            if ( bool( $scope->property_u('msg')->property_u('command') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                {
                    my $maybe_0 =
                      $self->property_u('commands')
                      ->get_index_value(
                        [ $scope->property_u('msg')->property_u('command') ],
                        $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->call_u(
                            {
                                _self => $scope->{special}->property_u('self'),
                                line  => $scope->property_u('line'),
                                s     => $scope->property_u('s'),
                                msg   => $scope->property_u('msg')
                            },
                            $scope, undef, 121
                        );
                    }
                }
            }
            return $return;
        }
    );

    # Function event '_commandHello' definition
    my $func_5 = FF::function_event_def(
        $f, $scope,
        '_commandHello',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 130.66667 ) or return;
            $scope->set_property_ow(
                $context,
                nickname => $scope->property_u('msg')->property_u('nickname'),
                131.4
            );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    add(
                        $scope,                         str( $f, "Hi " ),
                        $scope->property_u('nickname'), str( $f, "!" )
                    )
                ],
                $scope, undef,
                132.33333
            );
            return $return;
        }
    );

    # Function event '_commandAdd' definition
    my $func_6 = FF::function_event_def(
        $f, $scope,
        '_commandAdd',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 138.66667 ) or return;
            $scope->property_u('inspect')
              ->call_u( [ $scope->property_u('msg') ], $scope, undef, 139.4 );
            $scope->set_property_ow(
                $context,
                trigger => $scope->property_u('msg')->property_u('parts')
                  ->get_index_value( [ num( $f, 1 ) ], $scope ),
                141.25
            );
            $scope->set_property_ow(
                $context,
                response => $scope->property_u('msg')->property_u('fromWord')
                  ->call_u( [ num( $f, 2 ) ], $scope, undef, 142.625 ),
                142.25
            );
            $self->property_u('factoids')
              ->set_index_value( [ $scope->property_u('trigger') ],
                $scope->property_u('response'), $scope );
            $self->property_u('commands')
              ->set_index_value( [ $scope->property_u('trigger') ],
                $scope->property_u('_commandFactoid'), $scope );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    add(
                        $scope,
                        str( $f, "alright, associating ." ),
                        $scope->property_u('trigger'),
                        str( $f, " with '" ),
                        $scope->property_u('response'),
                        str( $f, "'" )
                    )
                ],
                $scope, undef, 147.25
            );
            return $return;
        }
    );

    # Function event '_commandFactoid' definition
    my $func_7 = FF::function_event_def(
        $f, $scope,
        '_commandFactoid',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 151.66667 ) or return;
            $scope->set_property_ow(
                $context,
                response => $self->property_u('factoids')->get_index_value(
                    [ $scope->property_u('msg')->property_u('command') ],
                    $scope
                ),
                152.25
            );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('response')
                ],
                $scope, undef, 153.25
            );
            return $return;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Bot', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'addr',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                { name => 'port', type => 'Num', optional => 1, more => undef },
                { name => 'user', type => 'Str', optional => 1, more => undef },
                { name => 'real', type => 'Str', optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'addr' ) or return;
                FF::need( $self, $arguments, 'nick' ) or return;
                FF::want( $self, $arguments, 'port', 18.28571,
                    num( $f, 6667 ) );
                FF::want( $self, $arguments, 'user', 19.28571,
                    str( $f, "ferret" ) );
                FF::want( $self, $arguments, 'real', 20.33333,
                    str( $f, "Ferret IRC" ) );
                $self->set_property(
                    commands => $scope->property_u('initialCommands'),
                    25.2
                );
                $self->set_property(
                    factoids => FF::create_hash( $f, {} ),
                    25.6
                );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address  => $self->property_u('addr'),
                            port     => $self->property_u('port'),
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 27.375
                    ),
                    27.125
                );
                FF::on(
                    $self->property_u('sock'),
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self->property_u('sock'),
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                return $return;
            }
        );

        # Method event 'addCommand' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'addCommand',
            [
                {
                    name     => 'command',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'callback',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'command',  43.28571 ) or return;
                FF::need( $scope, $arguments, 'callback', 43.85714 ) or return;
                if (
                    bool(
                        $self->property_u('commands')->get_index_value(
                            [ $scope->property_u('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property( overwrote => $true, 45.5 );
                }
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('command') ],
                    $scope->property_u('callback'), $scope );
                $return->set_property( added => $true, 47.5 );
                return $return;
            }
        );

        # Method event 'connect' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $self->property_u('sock')->property_u('connect')
                  ->call_u( {}, $scope, undef, 51.6 );
                return $return;
            }
        );

        # Method event 'send' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line', 55.66667 ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef, 56.66667
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 58.5 );
                return $return;
            }
        );

        # Method event 'handleLine' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'handleLine',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line', 62.66667 ) or return;
                $scope->set_property_ow(
                    $context,
                    s => $scope->property_u('line')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 64.83333 ),
                    64.33333
                );
                $scope->set_property_ow(
                    $context,
                    command => $scope->property_u('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    66.28571
                );
                if (
                    bool(
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->equal_to( str( $f, "PING" ), $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow(
                        $context,
                        command => $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope ),
                        69.28571
                    );
                }
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,                        str( $f, "recv[" ),
                            $scope->property_u('command'), str( $f, "]: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef, 71.66667
                );
                {
                    my $maybe_0 =
                      $scope->property_u('handlers')
                      ->get_index_value( [ $scope->property_u('command') ],
                        $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->call_u(
                            {
                                _self => $scope->{special}->property_u('self'),
                                line  => $scope->property_u('line'),
                                command => $scope->property_u('command'),
                                s       => $scope->property_u('s')
                            },
                            $scope, undef, 75
                        );
                    }
                }
                return $return;
            }
        );

        # Method event 'privmsg' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'privmsg',
            [
                {
                    name     => 'channel',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'message',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'channel', 84.22222 ) or return;
                FF::need( $scope, $arguments, 'message', 84.66667 ) or return;
                FF::iterate(
                    $f, $scope,
                    $scope->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, "\n" ) ], $scope, undef, 85.66667 ),
                    'line',
                    sub {
                        my $scope = shift;
                        if (
                            bool(
                                _not(
                                    $scope->property_u('line')
                                      ->property_u('length')
                                      ->equal_to( num( $f, 0 ), $scope )
                                )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

                            $self->property_u('send')->call_u(
                                [
                                    add(
                                        $scope,
                                        str( $f, "PRIVMSG " ),
                                        $scope->property_u('channel'),
                                        str( $f, " :" ),
                                        $scope->property_u('line')
                                    )
                                ],
                                $scope, undef, 87.66667
                            );
                        }
                    }
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            addCommand => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            connect => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope( send => $scope, $proto, $class, undef, undef );
        $method_4->inside_scope(
            handleLine => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            privmsg => $scope,
            $proto, $class, undef, undef
        );
        $func_2->inside_scope(
            _joinChannels => $scope,
            $scope, undef, undef, undef
        );
        $func_3->inside_scope( _pong => $scope, $scope, undef, undef, undef );
        $func_4->inside_scope(
            _handleMessage => $scope,
            $scope, undef, undef, undef
        );
        $func_5->inside_scope(
            _commandHello => $scope,
            $scope, undef, undef, undef
        );
        $func_6->inside_scope(
            _commandAdd => $scope,
            $scope, undef, undef, undef
        );
        $func_7->inside_scope(
            _commandFactoid => $scope,
            $scope, undef, undef, undef
        );
        $class->set_property_ow(
            $context,
            handlers => FF::create_hash(
                $f,
                {
                    MODE    => $scope->property_u('_joinChannels'),
                    PING    => $scope->property_u('_pong'),
                    PRIVMSG => $scope->property_u('_handleMessage')
                }
            ),
            4.66667
        );
        $class->set_property_ow(
            $context,
            initialCommands => FF::create_hash(
                $f,
                {
                    hello => $scope->property_u('_commandHello'),
                    hi    => $scope->property_u('_commandHello'),
                    add   => $scope->property_u('_commandAdd')
                }
            ),
            10.66667
        );
    }
    FF::load_namespaces( $context,
        qw(IRC IRC::Message Num Socket Socket::TCP Str) );
};

FF::after_content();
