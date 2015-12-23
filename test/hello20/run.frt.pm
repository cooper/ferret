# === Tokenization ===
#         VAR_LEX |                          "bot" | 1.05
#       OP_ASSIGN |                                | 1.1
#        BAREWORD |                          "IRC" | 1.15
#         OP_PACK |                                | 1.2
#        BAREWORD |                          "Bot" | 1.25
#      PAREN_CALL |                                | 1.3
#      PROP_VALUE |                         "addr" | 1.35
#          STRING |              ["k.notroll.net"] | 1.4
#        OP_COMMA |                                | 1.45
#      PROP_VALUE |                         "nick" | 1.5
#          STRING |                     ["bottie"] | 1.55
#        OP_COMMA |                                | 1.6
#      PROP_VALUE |                         "user" | 1.65
#          STRING |                     ["ferret"] | 1.7
#         PAREN_E |                                | 1.75
#         OP_SEMI |                              1 | 1.8
#         VAR_LEX |                          "bot" | 2.1
#        PROPERTY |                     "autojoin" | 2.2
#       OP_ASSIGN |                                | 2.3
#       BRACKET_S |                                | 2.4
#          STRING |                         ["#k"] | 2.5
#       BRACKET_E |                                | 2.6
#         OP_SEMI |                              1 | 2.7
#         VAR_LEX |                          "bot" | 4.1
#        PROPERTY |                   "addCommand" | 4.2
#      PAREN_CALL |                                | 4.3
#          STRING |                       ["info"] | 4.4
#         PAREN_E |                                | 4.5
#       CLOSURE_S |                                | 4.6
#    KEYWORD_NEED |                                | 5.1
#         VAR_LEX |                          "msg" | 5.2
#         OP_SEMI |                              1 | 5.3
#         VAR_LEX |                          "bot" | 6.05
#        PROPERTY |                      "privmsg" | 6.1
#      PAREN_CALL |                                | 6.15
#         VAR_LEX |                          "msg" | 6.2
#        PROPERTY |                      "channel" | 6.25
#        OP_COMMA |                                | 6.3
#          STRING |             ["Ferret IRC bot"] | 6.35
#         PAREN_E |                                | 6.4
#         OP_SEMI |                              1 | 6.45
#       CLOSURE_E |                                | 7.1
#         VAR_LEX |                          "bot" | 9.1
#        PROPERTY |                   "addCommand" | 9.2
#      PAREN_CALL |                                | 9.3
#          STRING |                          ["t"] | 9.4
#         PAREN_E |                                | 9.5
#       CLOSURE_S |                                | 9.6
#    KEYWORD_NEED |                                | 10.1
#         VAR_LEX |                          "msg" | 10.2
#         OP_SEMI |                              1 | 10.3
#      KEYWORD_IF |                                | 11.1
#          OP_NOT |                                | 11.2
#         VAR_LEX |                          "msg" | 11.3
#        PROPERTY |         "commandHasParameters" | 11.4
#        OP_VALUE |                                | 11.5
#  KEYWORD_RETURN |                                | 12.1
#         OP_SEMI |                              1 | 12.2
#         VAR_LEX |                            "c" | 13.05
#       OP_ASSIGN |                                | 13.1
#        BAREWORD |                     "COMPILER" | 13.15
#      PAREN_CALL |                                | 13.2
#        BAREWORD |              "convertNewlines" | 13.25
#      PAREN_CALL |                                | 13.3
#         VAR_LEX |                          "msg" | 13.35
#        PROPERTY |                     "fromWord" | 13.4
#      PAREN_CALL |                                | 13.45
#          NUMBER |                            "1" | 13.5
#         PAREN_E |                                | 13.55
#         PAREN_E |                                | 13.6
#         PAREN_E |                                | 13.65
#         OP_SEMI |                              1 | 13.7
#         VAR_LEX |                          "res" | 14.05
#       OP_ASSIGN |                                | 14.1
#         VAR_LEX |                            "c" | 14.15
#        PROPERTY |                     "tokenize" | 14.2
#      PAREN_CALL |                                | 14.25
#      PROP_VALUE |                       "pretty" | 14.3
#    KEYWORD_TRUE |                                | 14.35
#         PAREN_E |                                | 14.4
#         OP_SEMI |                              1 | 14.45
#      KEYWORD_IF |                                | 15.1
#         VAR_LEX |                          "res" | 15.2
#        PROPERTY |                        "error" | 15.3
#       CLOSURE_S |                                | 15.4
#         VAR_LEX |                          "bot" | 16.05
#        PROPERTY |                      "privmsg" | 16.1
#      PAREN_CALL |                                | 16.15
#         VAR_LEX |                          "msg" | 16.2
#        PROPERTY |                      "channel" | 16.25
#        OP_COMMA |                                | 16.3
#         VAR_LEX |                          "res" | 16.35
#        PROPERTY |                        "error" | 16.4
#         PAREN_E |                                | 16.45
#         OP_SEMI |                              1 | 16.5
#  KEYWORD_RETURN |                                | 17.1
#         OP_SEMI |                              1 | 17.2
#       CLOSURE_E |                                | 18.1
#         VAR_LEX |                          "bot" | 19.05
#        PROPERTY |                      "privmsg" | 19.1
#      PAREN_CALL |                                | 19.15
#         VAR_LEX |                          "msg" | 19.2
#        PROPERTY |                      "channel" | 19.25
#        OP_COMMA |                                | 19.3
#         VAR_LEX |                          "res" | 19.35
#        PROPERTY |                       "pretty" | 19.4
#         PAREN_E |                                | 19.45
#         OP_SEMI |                              1 | 19.5
#       CLOSURE_E |                                | 20.1
#         VAR_LEX |                          "bot" | 22.1
#        PROPERTY |                   "addCommand" | 22.2
#      PAREN_CALL |                                | 22.3
#          STRING |                          ["c"] | 22.4
#         PAREN_E |                                | 22.5
#       CLOSURE_S |                                | 22.6
#    KEYWORD_NEED |                                | 23.1
#         VAR_LEX |                          "msg" | 23.2
#         OP_SEMI |                              1 | 23.3
#      KEYWORD_IF |                                | 24.1
#          OP_NOT |                                | 24.2
#         VAR_LEX |                          "msg" | 24.3
#        PROPERTY |         "commandHasParameters" | 24.4
#        OP_VALUE |                                | 24.5
#  KEYWORD_RETURN |                                | 25.1
#         OP_SEMI |                              1 | 25.2
#         VAR_LEX |                            "c" | 26.05
#       OP_ASSIGN |                                | 26.1
#        BAREWORD |                     "COMPILER" | 26.15
#      PAREN_CALL |                                | 26.2
#        BAREWORD |              "convertNewlines" | 26.25
#      PAREN_CALL |                                | 26.3
#         VAR_LEX |                          "msg" | 26.35
#        PROPERTY |                     "fromWord" | 26.4
#      PAREN_CALL |                                | 26.45
#          NUMBER |                            "1" | 26.5
#         PAREN_E |                                | 26.55
#         PAREN_E |                                | 26.6
#         PAREN_E |                                | 26.65
#         OP_SEMI |                              1 | 26.7
#         VAR_LEX |                          "res" | 27.05
#       OP_ASSIGN |                                | 27.1
#         VAR_LEX |                            "c" | 27.15
#        PROPERTY |                    "construct" | 27.2
#      PAREN_CALL |                                | 27.25
#      PROP_VALUE |                       "pretty" | 27.3
#    KEYWORD_TRUE |                                | 27.35
#         PAREN_E |                                | 27.4
#         OP_SEMI |                              1 | 27.45
#      KEYWORD_IF |                                | 28.1
#         VAR_LEX |                          "res" | 28.2
#        PROPERTY |                        "error" | 28.3
#       CLOSURE_S |                                | 28.4
#         VAR_LEX |                          "bot" | 29.05
#        PROPERTY |                      "privmsg" | 29.1
#      PAREN_CALL |                                | 29.15
#         VAR_LEX |                          "msg" | 29.2
#        PROPERTY |                      "channel" | 29.25
#        OP_COMMA |                                | 29.3
#         VAR_LEX |                          "res" | 29.35
#        PROPERTY |                        "error" | 29.4
#         PAREN_E |                                | 29.45
#         OP_SEMI |                              1 | 29.5
#  KEYWORD_RETURN |                                | 30.1
#         OP_SEMI |                              1 | 30.2
#       CLOSURE_E |                                | 31.1
#         VAR_LEX |                          "bot" | 32.05
#        PROPERTY |                      "privmsg" | 32.1
#      PAREN_CALL |                                | 32.15
#         VAR_LEX |                          "msg" | 32.2
#        PROPERTY |                      "channel" | 32.25
#        OP_COMMA |                                | 32.3
#         VAR_LEX |                          "res" | 32.35
#        PROPERTY |                       "pretty" | 32.4
#         PAREN_E |                                | 32.45
#         OP_SEMI |                              1 | 32.5
#       CLOSURE_E |                                | 33.1
#         VAR_LEX |                          "bot" | 35.1
#        PROPERTY |                   "addCommand" | 35.2
#      PAREN_CALL |                                | 35.3
#          STRING |                          ["e"] | 35.4
#         PAREN_E |                                | 35.5
#       CLOSURE_S |                                | 35.6
#    KEYWORD_NEED |                                | 36.1
#         VAR_LEX |                          "msg" | 36.2
#         OP_SEMI |                              1 | 36.3
#      KEYWORD_IF |                                | 37.1
#          OP_NOT |                                | 37.2
#         VAR_LEX |                          "msg" | 37.3
#        PROPERTY |         "commandHasParameters" | 37.4
#        OP_VALUE |                                | 37.5
#  KEYWORD_RETURN |                                | 38.1
#         OP_SEMI |                              1 | 38.2
#         VAR_LEX |                          "res" | 39.05
#       OP_ASSIGN |                                | 39.1
#        BAREWORD |                     "COMPILER" | 39.15
#      PAREN_CALL |                                | 39.2
#        BAREWORD |              "convertNewlines" | 39.25
#      PAREN_CALL |                                | 39.3
#         VAR_LEX |                          "msg" | 39.35
#        PROPERTY |                     "fromWord" | 39.4
#      PAREN_CALL |                                | 39.45
#          NUMBER |                            "1" | 39.5
#         PAREN_E |                                | 39.55
#         PAREN_E |                                | 39.6
#         PAREN_E |                                | 39.65
#        PROPERTY |                         "eval" | 39.7
#      PAREN_CALL |                                | 39.75
#         PAREN_E |                                | 39.8
#         OP_SEMI |                              1 | 39.85
#      KEYWORD_IF |                                | 40.1
#         VAR_LEX |                          "res" | 40.2
#        PROPERTY |                        "error" | 40.3
#       CLOSURE_S |                                | 40.4
#         VAR_LEX |                          "bot" | 41.05
#        PROPERTY |                      "privmsg" | 41.1
#      PAREN_CALL |                                | 41.15
#         VAR_LEX |                          "msg" | 41.2
#        PROPERTY |                      "channel" | 41.25
#        OP_COMMA |                                | 41.3
#         VAR_LEX |                          "res" | 41.35
#        PROPERTY |                        "error" | 41.4
#         PAREN_E |                                | 41.45
#         OP_SEMI |                              1 | 41.5
#  KEYWORD_RETURN |                                | 42.1
#         OP_SEMI |                              1 | 42.2
#       CLOSURE_E |                                | 43.1
#         VAR_LEX |                       "string" | 44.05
#       OP_ASSIGN |                                | 44.1
#        BAREWORD |                      "inspect" | 44.15
#      PAREN_CALL |                                | 44.2
#      PROP_VALUE |                        "value" | 44.25
#         VAR_LEX |                          "res" | 44.3
#        PROPERTY |                       "result" | 44.35
#        OP_COMMA |                                | 44.4
#      PROP_VALUE |                        "quiet" | 44.45
#    KEYWORD_TRUE |                                | 44.5
#         PAREN_E |                                | 44.55
#        PROPERTY |                       "string" | 44.6
#         OP_SEMI |                              1 | 44.65
#         VAR_LEX |                          "bot" | 45.05
#        PROPERTY |                      "privmsg" | 45.1
#      PAREN_CALL |                                | 45.15
#         VAR_LEX |                          "msg" | 45.2
#        PROPERTY |                      "channel" | 45.25
#        OP_COMMA |                                | 45.3
#         VAR_LEX |                       "string" | 45.35
#         PAREN_E |                                | 45.4
#         OP_SEMI |                              1 | 45.45
#       CLOSURE_E |                                | 46.1
#         VAR_LEX |                          "bot" | 48.1
#        PROPERTY |                   "addCommand" | 48.2
#      PAREN_CALL |                                | 48.3
#          STRING |                          ["p"] | 48.4
#        OP_COMMA |                                | 48.5
#        BAREWORD |                   "handlePerl" | 48.6
#         PAREN_E |                                | 48.7
#         OP_SEMI |                              1 | 48.8
#         VAR_LEX |                          "bot" | 49.1
#        PROPERTY |                   "addCommand" | 49.2
#      PAREN_CALL |                                | 49.3
#          STRING |                         ["pp"] | 49.4
#        OP_COMMA |                                | 49.5
#        BAREWORD |                   "handlePerl" | 49.6
#         PAREN_E |                                | 49.7
#         OP_SEMI |                              1 | 49.8
#        FUNCTION |          {"name":"handlePerl"} | 51.1
#       CLOSURE_S |                                | 51.2
#    KEYWORD_NEED |                                | 52.1
#         VAR_LEX |                          "msg" | 52.2
#         OP_SEMI |                              1 | 52.3
#      KEYWORD_IF |                                | 53.1
#          OP_NOT |                                | 53.2
#         VAR_LEX |                          "msg" | 53.3
#        PROPERTY |         "commandHasParameters" | 53.4
#        OP_VALUE |                                | 53.5
#  KEYWORD_RETURN |                                | 54.1
#         OP_SEMI |                              1 | 54.2
#         VAR_LEX |                            "c" | 55.05
#       OP_ASSIGN |                                | 55.1
#        BAREWORD |                     "COMPILER" | 55.15
#      PAREN_CALL |                                | 55.2
#        BAREWORD |              "convertNewlines" | 55.25
#      PAREN_CALL |                                | 55.3
#         VAR_LEX |                          "msg" | 55.35
#        PROPERTY |                     "fromWord" | 55.4
#      PAREN_CALL |                                | 55.45
#          NUMBER |                            "1" | 55.5
#         PAREN_E |                                | 55.55
#         PAREN_E |                                | 55.6
#         PAREN_E |                                | 55.65
#         OP_SEMI |                              1 | 55.7
#         VAR_LEX |                          "res" | 56.05
#       OP_ASSIGN |                                | 56.1
#         VAR_LEX |                            "c" | 56.15
#        PROPERTY |                      "compile" | 56.2
#      PAREN_CALL |                                | 56.25
#         VAR_LEX |                          "msg" | 56.3
#        PROPERTY |                      "command" | 56.35
#        OP_EQUAL |                                | 56.4
#          STRING |                          ["p"] | 56.45
#         PAREN_E |                                | 56.5
#         OP_SEMI |                              1 | 56.55
#      KEYWORD_IF |                                | 57.1
#         VAR_LEX |                          "res" | 57.2
#        PROPERTY |                        "error" | 57.3
#       CLOSURE_S |                                | 57.4
#         VAR_LEX |                          "bot" | 58.05
#        PROPERTY |                      "privmsg" | 58.1
#      PAREN_CALL |                                | 58.15
#         VAR_LEX |                          "msg" | 58.2
#        PROPERTY |                      "channel" | 58.25
#        OP_COMMA |                                | 58.3
#         VAR_LEX |                          "res" | 58.35
#        PROPERTY |                        "error" | 58.4
#         PAREN_E |                                | 58.45
#         OP_SEMI |                              1 | 58.5
#  KEYWORD_RETURN |                                | 59.1
#         OP_SEMI |                              1 | 59.2
#       CLOSURE_E |                                | 60.1
#         VAR_LEX |                          "bot" | 61.05
#        PROPERTY |                      "privmsg" | 61.1
#      PAREN_CALL |                                | 61.15
#         VAR_LEX |                          "msg" | 61.2
#        PROPERTY |                      "channel" | 61.25
#        OP_COMMA |                                | 61.3
#         VAR_LEX |                          "res" | 61.35
#        PROPERTY |                         "perl" | 61.4
#         PAREN_E |                                | 61.45
#         OP_SEMI |                              1 | 61.5
#       CLOSURE_E |                                | 62.1
#        FUNCTION |     {"name":"convertNewlines"} | 64.1
#       CLOSURE_S |                                | 64.2
#    KEYWORD_NEED |                                | 65.1
#         VAR_LEX |                       "string" | 65.2
#        OP_VALUE |                                | 65.3
#        BAREWORD |                          "Str" | 65.4
#         OP_SEMI |                              1 | 65.5
#  KEYWORD_RETURN |                                | 66.05
#         VAR_LEX |                       "string" | 66.1
#        PROPERTY |                        "split" | 66.15
#      PAREN_CALL |                                | 66.2
#          STRING |                       ["_NL_"] | 66.25
#         PAREN_E |                                | 66.3
#        PROPERTY |                         "join" | 66.35
#      PAREN_CALL |                                | 66.4
#          STRING |                         ["\n"] | 66.45
#         PAREN_E |                                | 66.5
#         OP_SEMI |                              1 | 66.55
#       CLOSURE_E |                                | 67.1
#         VAR_LEX |                          "bot" | 69.1
#        PROPERTY |                      "connect" | 69.2
#      PAREN_CALL |                                | 69.3
#         PAREN_E |                                | 69.4
#         OP_SEMI |                              1 | 69.5
# === Document Model ===
#  Document './test/hello20/run.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
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
#          Assignment (property 'autojoin')
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
#                                  Assignment (lexical variable '$c')
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
#                                  Assignment (lexical variable '$res')
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
#                                  Assignment (lexical variable '$c')
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
#                                  Assignment (lexical variable '$res')
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
#                                  Assignment (lexical variable '$res')
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
#                                  Assignment (lexical variable '$string')
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
#                  Assignment (lexical variable '$c')
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
#                  Assignment (lexical variable '$res')
#                      Call
#                          Property 'compile'
#                              Lexical variable '$c'
#                          Argument list [1 items]
#                              Item 0
#                                  Equality
#                                      Property 'command'
#                                          Lexical variable '$msg'
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
#                      Bareword 'Str'
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

FF::before_content('run.frt');

use Ferret::Core::Operations qw(_not bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'handlePerl' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'handlePerl',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 52.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 55.45
                                  )
                            ],
                            $scope, undef, 55.3
                        )
                    ],
                    $scope, undef, 55.2
                ),
                55.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('compile')->call_u(
                    [
                        $scope->property_u('msg')->property_u('command')
                          ->equal_to( str( $f, "p" ), $scope )
                    ],
                    $scope, undef, 56.25
                ),
                56.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 58.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('perl')
                ],
                $scope, undef, 61.15
            );
            return $return;
        }
    );

    # Function event 'convertNewlines' definition
    my $func_1 = FF::function_event_def(
        $f, $scope,
        'convertNewlines',
        [
            {
                name     => 'string',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'string', 65.2 ) or return;
            return $scope->property_u('string')->property_u('split')
              ->call_u( [ str( $f, "_NL_" ) ], $scope, undef, 66.2 )
              ->property_u('join')
              ->call_u( [ str( $f, "\n" ) ], $scope, undef, 66.4 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 5.2 ) or return;
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope, undef, 6.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 10.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 13.45
                                  )
                            ],
                            $scope, undef, 13.3
                        )
                    ],
                    $scope, undef, 13.2
                ),
                13.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('tokenize')
                  ->call_u( { pretty => $true }, $scope, undef, 14.25 ),
                14.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 16.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 19.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_4 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 23.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 26.45
                                  )
                            ],
                            $scope, undef, 26.3
                        )
                    ],
                    $scope, undef, 26.2
                ),
                26.1
            );
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('c')->property_u('construct')
                  ->call_u( { pretty => $true }, $scope, undef, 27.25 ),
                27.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 29.15
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope, undef, 32.15
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_5 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'msg', 36.2 ) or return;
            if (
                bool(
                    _not(
                        $scope->property_u('msg')
                          ->property_u('commandHasParameters')
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('convertNewlines')->call_u(
                            [
                                $scope->property_u('msg')
                                  ->property_u('fromWord')->call_u(
                                    [ num( $f, 1 ) ],
                                    $scope, undef, 39.45
                                  )
                            ],
                            $scope, undef, 39.3
                        )
                    ],
                    $scope, undef, 39.2
                  )->property_u('eval')->call_u( {}, $scope, undef, 39.75 ),
                39.1
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope, undef, 41.15
                );
                return $return;
            }
            $scope->set_property_ow(
                $context,
                string => $scope->property_u('inspect')->call_u(
                    {
                        value =>
                          $scope->property_u('res')->property_u('result'),
                        quiet => $true
                    },
                    $scope, undef, 44.2
                  )->property_u('string'),
                44.1
            );
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('string')
                ],
                $scope, undef, 45.15
            );
            return $return;
        }
    );
    $func_0->inside_scope( handlePerl => $scope, $scope, undef, undef, undef );
    $func_1->inside_scope(
        convertNewlines => $scope,
        $scope, undef, undef, undef
    );
    FF::load_namespaces( $context, qw(COMPILER IRC IRC::Bot Str) );
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('IRC::Bot')->call_u(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope, undef, 1.3
        ),
        1.1
    );
    $scope->property_u('bot')->set_property(
        autojoin => FF::create_list( $f, [ str( $f, "#k" ) ] ),
        2.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "info" ),
            $func_2->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 4.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "t" ),
            $func_3->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 9.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "c" ),
            $func_4->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 22.3
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "e" ),
            $func_5->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 35.3
    );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "p" ), $scope->property_u('handlePerl') ],
        $scope, undef, 48.3 );
    $scope->property_u('bot')->property_u('addCommand')
      ->call_u( [ str( $f, "pp" ), $scope->property_u('handlePerl') ],
        $scope, undef, 49.3 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 69.3 );
};

FF::after_content();
