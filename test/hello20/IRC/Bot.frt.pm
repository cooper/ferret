# === Tokenization ===
#         PKG_DEC |                 {"name":"IRC"} | 1.1
#       CLASS_DEC |                 {"name":"Bot"} | 2.1
#         VAR_LEX |                     "handlers" | 4.1
#       OP_ASSIGN |                                | 4.2
#       BRACKET_S |                                | 4.3
#      PROP_VALUE |                         "MODE" | 5.1
#        BAREWORD |                "_joinChannels" | 5.2
#        OP_COMMA |                                | 5.3
#      PROP_VALUE |                         "PING" | 6.1
#        BAREWORD |                        "_pong" | 6.2
#        OP_COMMA |                                | 6.3
#      PROP_VALUE |                      "PRIVMSG" | 7.1
#        BAREWORD |               "_handleMessage" | 7.2
#         OP_SEMI |                              1 | 7.3
#       BRACKET_E |                                | 8.1
#         OP_SEMI |                              1 | 8.2
#         VAR_LEX |              "initialCommands" | 10.1
#       OP_ASSIGN |                                | 10.2
#       BRACKET_S |                                | 10.3
#      PROP_VALUE |                        "hello" | 11.1
#        BAREWORD |                "_commandHello" | 11.2
#        OP_COMMA |                                | 11.3
#      PROP_VALUE |                           "hi" | 12.1
#        BAREWORD |                "_commandHello" | 12.2
#        OP_COMMA |                                | 12.3
#      PROP_VALUE |                          "add" | 13.1
#        BAREWORD |                  "_commandAdd" | 13.2
#         OP_SEMI |                              1 | 13.3
#       BRACKET_E |                                | 14.1
#         OP_SEMI |                              1 | 14.2
#          METHOD |     {"main":1,"name":"_init_"} | 16.1
#       CLOSURE_S |                                | 16.2
#    KEYWORD_NEED |                                | 17.05
#        VAR_THIS |                         "addr" | 17.1
#        OP_VALUE |                                | 17.15
#        BAREWORD |                          "Str" | 17.2
#        OP_COMMA |                                | 17.25
#        VAR_THIS |                         "nick" | 17.3
#        OP_VALUE |                                | 17.35
#        BAREWORD |                          "Str" | 17.4
#         OP_SEMI |                              1 | 17.45
#    KEYWORD_WANT |                                | 18.1
#        VAR_THIS |                         "port" | 18.2
#        OP_VALUE |                                | 18.3
#        BAREWORD |                          "Num" | 18.4
#       OP_ASSIGN |                                | 18.5
#          NUMBER |                         "6667" | 18.6
#         OP_SEMI |                              1 | 18.7
#    KEYWORD_WANT |                                | 19.1
#        VAR_THIS |                         "user" | 19.2
#        OP_VALUE |                                | 19.3
#        BAREWORD |                          "Str" | 19.4
#       OP_ASSIGN |                                | 19.5
#          STRING |                     ["ferret"] | 19.6
#         OP_SEMI |                              1 | 19.7
#    KEYWORD_WANT |                                | 20.1
#        VAR_THIS |                         "real" | 20.2
#        OP_VALUE |                                | 20.3
#        BAREWORD |                          "Str" | 20.4
#       OP_ASSIGN |                                | 20.5
#          STRING |                 ["Ferret IRC"] | 20.6
#         OP_SEMI |                              1 | 20.7
#        VAR_THIS |                     "commands" | 22.1
#       OP_ASSIGN |                                | 22.2
#         VAR_LEX |              "initialCommands" | 22.3
#         OP_SEMI |                              1 | 22.4
#        VAR_THIS |                     "factoids" | 23.1
#       OP_ASSIGN |                                | 23.2
#       BRACKET_S |                                | 23.3
#        OP_VALUE |                                | 23.4
#       BRACKET_E |                                | 23.5
#         OP_SEMI |                              1 | 23.6
#        VAR_THIS |                         "sock" | 26.05
#       OP_ASSIGN |                                | 26.1
#        BAREWORD |                       "Socket" | 26.15
#         OP_PACK |                                | 26.2
#        BAREWORD |                          "TCP" | 26.25
#      PAREN_CALL |                                | 26.3
#      PROP_VALUE |                      "address" | 26.35
#        VAR_THIS |                         "addr" | 26.4
#        OP_COMMA |                                | 26.45
#      PROP_VALUE |                         "port" | 26.5
#        VAR_THIS |                         "port" | 26.55
#        OP_COMMA |                                | 26.6
#      PROP_VALUE |                     "readMode" | 26.65
#         VAR_SYM |                         "line" | 26.7
#         PAREN_E |                                | 26.75
#         OP_SEMI |                              1 | 26.8
#      KEYWORD_ON |                                | 29.1
#        VAR_THIS |                         "sock" | 29.2
#        PROPERTY |                    "connected" | 29.3
#        OP_COMMA |                                | 29.4
#         VAR_SYM |             "sendRegistration" | 29.5
#       CLOSURE_S |                                | 29.6
#        VAR_THIS |                         "send" | 30.1
#      PAREN_CALL |                                | 30.2
#          STRING | ["USER ",["VAR_THIS","user",30]," ","*"," ","*"," :",["VAR_THIS","real",30]] | 30.3
#         PAREN_E |                                | 30.4
#         OP_SEMI |                              1 | 30.5
#        VAR_THIS |                         "send" | 31.1
#      PAREN_CALL |                                | 31.2
#          STRING | ["NICK ",["VAR_THIS","nick",31]] | 31.3
#         PAREN_E |                                | 31.4
#         OP_SEMI |                              1 | 31.5
#       CLOSURE_E |                                | 32.1
#      KEYWORD_ON |                                | 35.1
#        VAR_THIS |                         "sock" | 35.2
#        PROPERTY |                      "gotLine" | 35.3
#        OP_COMMA |                                | 35.4
#         VAR_SYM |                   "handleLine" | 35.5
#       CLOSURE_S |                                | 35.6
#    KEYWORD_NEED |                                | 36.1
#         VAR_LEX |                         "data" | 36.2
#         OP_SEMI |                              1 | 36.3
#        VAR_THIS |                   "handleLine" | 37.1
#      PAREN_CALL |                                | 37.2
#         VAR_LEX |                         "data" | 37.3
#         PAREN_E |                                | 37.4
#         OP_SEMI |                              1 | 37.5
#       CLOSURE_E |                                | 38.1
#       CLOSURE_E |                                | 40.1
#          METHOD |          {"name":"addCommand"} | 42.1
#       CLOSURE_S |                                | 42.2
#    KEYWORD_NEED |                                | 43.1
#         VAR_LEX |                      "command" | 43.2
#        OP_VALUE |                                | 43.3
#        BAREWORD |                          "Str" | 43.4
#        OP_COMMA |                                | 43.5
#         VAR_LEX |                     "callback" | 43.6
#         OP_SEMI |                              1 | 43.7
#      KEYWORD_IF |                                | 44.1
#        VAR_THIS |                     "commands" | 44.2
#     BRACKET_IDX |                                | 44.3
#         VAR_LEX |                      "command" | 44.4
#       BRACKET_E |                                | 44.5
#        OP_VALUE |                                | 44.6
#        BAREWORD |                    "overwrote" | 45.1
#       OP_RETURN |                                | 45.2
#    KEYWORD_TRUE |                                | 45.3
#         OP_SEMI |                              1 | 45.4
#        VAR_THIS |                     "commands" | 46.1
#     BRACKET_IDX |                                | 46.2
#         VAR_LEX |                      "command" | 46.3
#       BRACKET_E |                                | 46.4
#       OP_ASSIGN |                                | 46.5
#         VAR_LEX |                     "callback" | 46.6
#         OP_SEMI |                              1 | 46.7
#        BAREWORD |                        "added" | 47.1
#       OP_RETURN |                                | 47.2
#    KEYWORD_TRUE |                                | 47.3
#         OP_SEMI |                              1 | 47.4
#       CLOSURE_E |                                | 48.1
#          METHOD |             {"name":"connect"} | 50.1
#       CLOSURE_S |                                | 50.2
#        VAR_THIS |                         "sock" | 51.1
#        PROPERTY |                      "connect" | 51.2
#      PAREN_CALL |                                | 51.3
#         PAREN_E |                                | 51.4
#         OP_SEMI |                              1 | 51.5
#       CLOSURE_E |                                | 52.1
#          METHOD |                {"name":"send"} | 54.1
#       CLOSURE_S |                                | 54.2
#    KEYWORD_NEED |                                | 55.1
#         VAR_LEX |                         "line" | 55.2
#         OP_SEMI |                              1 | 55.3
#        BAREWORD |                          "say" | 56.1
#      PAREN_CALL |                                | 56.2
#          STRING | ["send: ",["VAR_LEX","line",56]] | 56.3
#         PAREN_E |                                | 56.4
#         OP_SEMI |                              1 | 56.5
#        VAR_THIS |                         "sock" | 57.1
#        PROPERTY |                      "println" | 57.2
#      PAREN_CALL |                                | 57.3
#         VAR_LEX |                         "line" | 57.4
#         PAREN_E |                                | 57.5
#         OP_SEMI |                              1 | 57.6
#       CLOSURE_E |                                | 58.1
#          METHOD |          {"name":"handleLine"} | 60.1
#       CLOSURE_S |                                | 60.2
#    KEYWORD_NEED |                                | 61.1
#         VAR_LEX |                         "line" | 61.2
#         OP_SEMI |                              1 | 61.3
#         VAR_LEX |                            "s" | 64.1
#       OP_ASSIGN |                                | 64.2
#         VAR_LEX |                         "line" | 64.3
#        PROPERTY |                        "split" | 64.4
#      PAREN_CALL |                                | 64.5
#          STRING |                          [" "] | 64.6
#         PAREN_E |                                | 64.7
#         OP_SEMI |                              1 | 64.8
#         VAR_LEX |                      "command" | 65.1
#       OP_ASSIGN |                                | 65.2
#         VAR_LEX |                            "s" | 65.3
#     BRACKET_IDX |                                | 65.4
#          NUMBER |                            "1" | 65.5
#       BRACKET_E |                                | 65.6
#         OP_SEMI |                              1 | 65.7
#      KEYWORD_IF |                                | 68.1
#         VAR_LEX |                            "s" | 68.2
#     BRACKET_IDX |                                | 68.3
#          NUMBER |                            "0" | 68.4
#       BRACKET_E |                                | 68.5
#        OP_EQUAL |                                | 68.6
#          STRING |                       ["PING"] | 68.7
#        OP_VALUE |                                | 68.8
#         VAR_LEX |                      "command" | 69.1
#       OP_ASSIGN |                                | 69.2
#         VAR_LEX |                            "s" | 69.3
#     BRACKET_IDX |                                | 69.4
#          NUMBER |                            "0" | 69.5
#       BRACKET_E |                                | 69.6
#         OP_SEMI |                              1 | 69.7
#        BAREWORD |                          "say" | 71.1
#      PAREN_CALL |                                | 71.2
#          STRING | ["recv[",["VAR_LEX","command",71],"]: ",["VAR_LEX","line",71]] | 71.3
#         PAREN_E |                                | 71.4
#         OP_SEMI |                              1 | 71.5
#         VAR_LEX |                     "handlers" | 74.1
#     BRACKET_IDX |                                | 74.2
#         VAR_LEX |                      "command" | 74.3
#       BRACKET_E |                                | 74.4
#        OP_MAYBE |                                | 74.5
#      PAREN_CALL |                                | 74.6
#      PROP_VALUE |                        "_self" | 75.1
#        VAR_SPEC |                         "self" | 75.2
#        OP_COMMA |                                | 75.3
#      PROP_VALUE |                         "line" | 76.1
#         VAR_LEX |                         "line" | 76.2
#        OP_COMMA |                                | 76.3
#      PROP_VALUE |                      "command" | 77.1
#         VAR_LEX |                      "command" | 77.2
#        OP_COMMA |                                | 77.3
#      PROP_VALUE |                            "s" | 78.1
#         VAR_LEX |                            "s" | 78.2
#         OP_SEMI |                              1 | 78.3
#         PAREN_E |                                | 79.1
#         OP_SEMI |                              1 | 79.2
#       CLOSURE_E |                                | 81.1
#          METHOD |             {"name":"privmsg"} | 83.1
#       CLOSURE_S |                                | 83.2
#    KEYWORD_NEED |                                | 84.05
#         VAR_LEX |                      "channel" | 84.1
#        OP_VALUE |                                | 84.15
#        BAREWORD |                          "Str" | 84.2
#        OP_COMMA |                                | 84.25
#         VAR_LEX |                      "message" | 84.3
#        OP_VALUE |                                | 84.35
#        BAREWORD |                          "Str" | 84.4
#         OP_SEMI |                              1 | 84.45
#     KEYWORD_FOR |                                | 85.05
#         VAR_LEX |                         "line" | 85.1
#      KEYWORD_IN |                                | 85.15
#         VAR_LEX |                      "message" | 85.2
#        PROPERTY |                        "split" | 85.25
#      PAREN_CALL |                                | 85.3
#          STRING |                         ["\n"] | 85.35
#         PAREN_E |                                | 85.4
#       CLOSURE_S |                                | 85.45
#      KEYWORD_IF |                                | 86.1
#         VAR_LEX |                         "line" | 86.2
#        PROPERTY |                       "length" | 86.3
#       OP_NEQUAL |                                | 86.4
#          NUMBER |                            "0" | 86.5
#        OP_VALUE |                                | 86.6
#        VAR_THIS |                         "send" | 87.1
#      PAREN_CALL |                                | 87.2
#          STRING | ["PRIVMSG ",["VAR_LEX","channel",87]," :",["VAR_LEX","line",87]] | 87.3
#         PAREN_E |                                | 87.4
#         OP_SEMI |                              1 | 87.5
#       CLOSURE_E |                                | 88.1
#       CLOSURE_E |                                | 89.1
#        FUNCTION |       {"name":"_joinChannels"} | 91.1
#       CLOSURE_S |                                | 91.2
#      KEYWORD_IF |                                | 94.1
#        VAR_THIS |              "_joinedChannels" | 94.2
#        OP_VALUE |                                | 94.3
#  KEYWORD_RETURN |                                | 95.1
#         OP_SEMI |                              1 | 95.2
#        VAR_THIS |              "_joinedChannels" | 96.1
#       OP_ASSIGN |                                | 96.2
#    KEYWORD_TRUE |                                | 96.3
#         OP_SEMI |                              1 | 96.4
#      KEYWORD_IF |                                | 98.1
#        VAR_THIS |                     "autojoin" | 98.2
#       CLOSURE_S |                                | 98.3
#     KEYWORD_FOR |                                | 99.1
#         VAR_LEX |                         "chan" | 99.2
#      KEYWORD_IN |                                | 99.3
#        VAR_THIS |                     "autojoin" | 99.4
#       CLOSURE_S |                                | 99.5
#        VAR_THIS |                         "send" | 100.1
#      PAREN_CALL |                                | 100.2
#          STRING | ["JOIN ",["VAR_LEX","chan",100]] | 100.3
#         PAREN_E |                                | 100.4
#         OP_SEMI |                              1 | 100.5
#       CLOSURE_E |                                | 101.1
#       CLOSURE_E |                                | 102.1
#       CLOSURE_E |                                | 103.1
#        FUNCTION |               {"name":"_pong"} | 107.1
#       CLOSURE_S |                                | 107.2
#    KEYWORD_NEED |                                | 108.1
#         VAR_LEX |                            "s" | 108.2
#         OP_SEMI |                              1 | 108.3
#        VAR_THIS |                         "send" | 109.05
#      PAREN_CALL |                                | 109.1
#          STRING |                      ["PONG "] | 109.15
#          OP_ADD |                                | 109.2
#         VAR_LEX |                            "s" | 109.25
#     BRACKET_IDX |                                | 109.3
#          NUMBER |                            "1" | 109.35
#       BRACKET_E |                                | 109.4
#         PAREN_E |                                | 109.45
#         OP_SEMI |                              1 | 109.5
#       CLOSURE_E |                                | 110.1
#        FUNCTION |      {"name":"_handleMessage"} | 112.1
#       CLOSURE_S |                                | 112.2
#    KEYWORD_NEED |                                | 113.1
#         VAR_LEX |                         "line" | 113.2
#        OP_COMMA |                                | 113.3
#         VAR_LEX |                            "s" | 113.4
#         OP_SEMI |                              1 | 113.5
#         VAR_LEX |                          "msg" | 116.05
#       OP_ASSIGN |                                | 116.1
#        BAREWORD |                          "IRC" | 116.15
#         OP_PACK |                                | 116.2
#        BAREWORD |                      "Message" | 116.25
#      PAREN_CALL |                                | 116.3
#         VAR_LEX |                         "line" | 116.35
#         PAREN_E |                                | 116.4
#         OP_SEMI |                              1 | 116.45
#        BAREWORD |                          "msg" | 117.1
#       OP_RETURN |                                | 117.2
#         VAR_LEX |                          "msg" | 117.3
#         OP_SEMI |                              1 | 117.4
#      KEYWORD_IF |                                | 120.05
#         VAR_LEX |                          "msg" | 120.1
#        PROPERTY |                      "command" | 120.15
#        OP_VALUE |                                | 120.2
#        VAR_THIS |                     "commands" | 120.25
#     BRACKET_IDX |                                | 120.3
#         VAR_LEX |                          "msg" | 120.35
#        PROPERTY |                      "command" | 120.4
#       BRACKET_E |                                | 120.45
#        OP_MAYBE |                                | 120.5
#      PAREN_CALL |                                | 120.55
#      PROP_VALUE |                        "_self" | 121.1
#        VAR_SPEC |                         "self" | 121.2
#        OP_COMMA |                                | 121.3
#      PROP_VALUE |                         "line" | 122.1
#         VAR_LEX |                         "line" | 122.2
#        OP_COMMA |                                | 122.3
#      PROP_VALUE |                            "s" | 123.1
#         VAR_LEX |                            "s" | 123.2
#        OP_COMMA |                                | 123.3
#      PROP_VALUE |                          "msg" | 124.1
#         VAR_LEX |                          "msg" | 124.2
#         OP_SEMI |                              1 | 124.3
#         PAREN_E |                                | 125.1
#         OP_SEMI |                              1 | 125.2
#       CLOSURE_E |                                | 127.1
#        FUNCTION |       {"name":"_commandHello"} | 129.1
#       CLOSURE_S |                                | 129.2
#    KEYWORD_NEED |                                | 130.1
#         VAR_LEX |                          "msg" | 130.2
#         OP_SEMI |                              1 | 130.3
#         VAR_LEX |                     "nickname" | 131.1
#       OP_ASSIGN |                                | 131.2
#         VAR_LEX |                          "msg" | 131.3
#        PROPERTY |                     "nickname" | 131.4
#         OP_SEMI |                              1 | 131.5
#        VAR_THIS |                      "privmsg" | 132.1
#      PAREN_CALL |                                | 132.2
#         VAR_LEX |                          "msg" | 132.3
#        PROPERTY |                      "channel" | 132.4
#        OP_COMMA |                                | 132.5
#          STRING | ["Hi ",["VAR_LEX","nickname",132],"!"] | 132.6
#         PAREN_E |                                | 132.7
#         OP_SEMI |                              1 | 132.8
#       CLOSURE_E |                                | 133.1
#        FUNCTION |         {"name":"_commandAdd"} | 135.1
#       CLOSURE_S |                                | 135.2
#    KEYWORD_NEED |                                | 136.1
#         VAR_LEX |                          "msg" | 136.2
#         OP_SEMI |                              1 | 136.3
#        BAREWORD |                      "inspect" | 137.1
#      PAREN_CALL |                                | 137.2
#         VAR_LEX |                          "msg" | 137.3
#         PAREN_E |                                | 137.4
#         OP_SEMI |                              1 | 137.5
#         VAR_LEX |                      "trigger" | 140.1
#       OP_ASSIGN |                                | 140.2
#         VAR_LEX |                          "msg" | 140.3
#        PROPERTY |                        "parts" | 140.4
#     BRACKET_IDX |                                | 140.5
#          NUMBER |                            "1" | 140.6
#       BRACKET_E |                                | 140.7
#         OP_SEMI |                              1 | 140.8
#         VAR_LEX |                     "response" | 141.1
#       OP_ASSIGN |                                | 141.2
#         VAR_LEX |                          "msg" | 141.3
#        PROPERTY |                     "fromWord" | 141.4
#      PAREN_CALL |                                | 141.5
#          NUMBER |                            "2" | 141.6
#         PAREN_E |                                | 141.7
#         OP_SEMI |                              1 | 141.8
#        VAR_THIS |                     "factoids" | 144.1
#     BRACKET_IDX |                                | 144.2
#         VAR_LEX |                      "trigger" | 144.3
#       BRACKET_E |                                | 144.4
#       OP_ASSIGN |                                | 144.5
#         VAR_LEX |                     "response" | 144.6
#         OP_SEMI |                              1 | 144.7
#        VAR_THIS |                     "commands" | 145.1
#     BRACKET_IDX |                                | 145.2
#         VAR_LEX |                      "trigger" | 145.3
#       BRACKET_E |                                | 145.4
#       OP_ASSIGN |                                | 145.5
#        BAREWORD |              "_commandFactoid" | 145.6
#         OP_SEMI |                              1 | 145.7
#        VAR_THIS |                      "privmsg" | 147.1
#      PAREN_CALL |                                | 147.2
#         VAR_LEX |                          "msg" | 147.3
#        PROPERTY |                      "channel" | 147.4
#        OP_COMMA |                                | 147.5
#          STRING | ["alright, associating .",["VAR_LEX","trigger",147]," with '",["VAR_LEX","response",147],"'"] | 147.6
#         PAREN_E |                                | 147.7
#         OP_SEMI |                              1 | 147.8
#       CLOSURE_E |                                | 148.1
#        FUNCTION |     {"name":"_commandFactoid"} | 150.1
#       CLOSURE_S |                                | 150.2
#    KEYWORD_NEED |                                | 151.1
#         VAR_LEX |                          "msg" | 151.2
#         OP_SEMI |                              1 | 151.3
#         VAR_LEX |                     "response" | 152.1
#       OP_ASSIGN |                                | 152.2
#        VAR_THIS |                     "factoids" | 152.3
#     BRACKET_IDX |                                | 152.4
#         VAR_LEX |                          "msg" | 152.5
#        PROPERTY |                      "command" | 152.6
#       BRACKET_E |                                | 152.7
#         OP_SEMI |                              1 | 152.8
#        VAR_THIS |                      "privmsg" | 153.1
#      PAREN_CALL |                                | 153.2
#         VAR_LEX |                          "msg" | 153.3
#        PROPERTY |                      "channel" | 153.4
#        OP_COMMA |                                | 153.5
#         VAR_LEX |                     "response" | 153.6
#         PAREN_E |                                | 153.7
#         OP_SEMI |                              1 | 153.8
#       CLOSURE_E |                                | 154.1
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
                $scope, undef, 30.2
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 31.2
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
            FF::need( $scope, $arguments, 'data', 36.2 ) or return;
            $self->property_u('handleLine')
              ->call_u( [ $scope->property_u('data') ], $scope, undef, 37.2 );
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
            $self->set_property( _joinedChannels => $true, 96.2 );
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
                            $scope, undef, 100.2
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
            FF::need( $scope, $arguments, 's', 108.2 ) or return;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "PONG " ),
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 1 ) ], $scope )
                    )
                ],
                $scope, undef, 109.1
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
            FF::need( $scope, $arguments, 'line', 113.2 ) or return;
            FF::need( $scope, $arguments, 's',    113.4 ) or return;
            $scope->set_property_ow(
                $context,
                msg => $scope->property_u('IRC::Message')->call_u(
                    [ $scope->property_u('line') ],
                    $scope, undef, 116.3
                ),
                116.1
            );
            $return->set_property( msg => $scope->property_u('msg'), 117.2 );
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
                            $scope, undef, 120.55
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
            FF::need( $scope, $arguments, 'msg', 130.2 ) or return;
            $scope->set_property_ow(
                $context,
                nickname => $scope->property_u('msg')->property_u('nickname'),
                131.2
            );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    add(
                        $scope,                         str( $f, "Hi " ),
                        $scope->property_u('nickname'), str( $f, "!" )
                    )
                ],
                $scope, undef, 132.2
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
            FF::need( $scope, $arguments, 'msg', 136.2 ) or return;
            $scope->property_u('inspect')
              ->call_u( [ $scope->property_u('msg') ], $scope, undef, 137.2 );
            $scope->set_property_ow(
                $context,
                trigger => $scope->property_u('msg')->property_u('parts')
                  ->get_index_value( [ num( $f, 1 ) ], $scope ),
                140.2
            );
            $scope->set_property_ow(
                $context,
                response => $scope->property_u('msg')->property_u('fromWord')
                  ->call_u( [ num( $f, 2 ) ], $scope, undef, 141.5 ),
                141.2
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
                $scope, undef, 147.2
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
            FF::need( $scope, $arguments, 'msg', 151.2 ) or return;
            $scope->set_property_ow(
                $context,
                response => $self->property_u('factoids')->get_index_value(
                    [ $scope->property_u('msg')->property_u('command') ],
                    $scope
                ),
                152.2
            );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('response')
                ],
                $scope, undef, 153.2
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
                FF::want( $self, $arguments, 'port', 18.2, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'user', 19.2,
                    str( $f, "ferret" ) );
                FF::want( $self, $arguments, 'real', 20.2,
                    str( $f, "Ferret IRC" ) );
                $self->set_property(
                    commands => $scope->property_u('initialCommands'),
                    22.2
                );
                $self->set_property(
                    factoids => FF::create_hash( $f, {} ),
                    23.2
                );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address  => $self->property_u('addr'),
                            port     => $self->property_u('port'),
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 26.3
                    ),
                    26.1
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
                FF::need( $scope, $arguments, 'command',  43.2 ) or return;
                FF::need( $scope, $arguments, 'callback', 43.6 ) or return;
                if (
                    bool(
                        $self->property_u('commands')->get_index_value(
                            [ $scope->property_u('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property( overwrote => $true, 45.2 );
                }
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('command') ],
                    $scope->property_u('callback'), $scope );
                $return->set_property( added => $true, 47.2 );
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
                  ->call_u( {}, $scope, undef, 51.3 );
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
                FF::need( $scope, $arguments, 'line', 55.2 ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef, 56.2
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 57.3 );
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
                FF::need( $scope, $arguments, 'line', 61.2 ) or return;
                $scope->set_property_ow(
                    $context,
                    s => $scope->property_u('line')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 64.5 ),
                    64.2
                );
                $scope->set_property_ow(
                    $context,
                    command => $scope->property_u('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    65.2
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
                        69.2
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
                    $scope, undef, 71.2
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
                            $scope, undef, 74.6
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
                FF::need( $scope, $arguments, 'channel', 84.1 ) or return;
                FF::need( $scope, $arguments, 'message', 84.3 ) or return;
                FF::iterate(
                    $f, $scope,
                    $scope->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, "\n" ) ], $scope, undef, 85.3 ),
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
                                $scope, undef, 87.2
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
            4.2
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
            10.2
        );
    }
    FF::load_namespaces( $context,
        qw(IRC IRC::Message Num Socket Socket::TCP Str) );
};

FF::after_content();
