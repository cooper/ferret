# === Tokenization ===
#         PKG_DEC |                 {"name":"IRC"} | 1.5
#       CLASS_DEC |                 {"name":"Bot"} | 2.5
#         VAR_LEX |                     "handlers" | 4.25
#       OP_ASSIGN |                                | 4.5
#       BRACKET_S |                                | 4.75
#      PROP_VALUE |                         "MODE" | 5.25
#        BAREWORD |                "_joinChannels" | 5.5
#        OP_COMMA |                                | 5.75
#      PROP_VALUE |                         "PING" | 6.25
#        BAREWORD |                        "_pong" | 6.5
#        OP_COMMA |                                | 6.75
#      PROP_VALUE |                      "PRIVMSG" | 7.25
#        BAREWORD |               "_handleMessage" | 7.5
#        OP_COMMA |                                | 7.75
#       BRACKET_E |                                | 8.33333
#         OP_SEMI |                                | 8.66667
#         VAR_LEX |              "initialCommands" | 10.25
#       OP_ASSIGN |                                | 10.5
#       BRACKET_S |                                | 10.75
#      PROP_VALUE |                        "hello" | 11.25
#        BAREWORD |                "_commandHello" | 11.5
#        OP_COMMA |                                | 11.75
#      PROP_VALUE |                           "hi" | 12.25
#        BAREWORD |                "_commandHello" | 12.5
#        OP_COMMA |                                | 12.75
#      PROP_VALUE |                          "add" | 13.25
#        BAREWORD |                  "_commandAdd" | 13.5
#        OP_COMMA |                                | 13.75
#       BRACKET_E |                                | 14.33333
#         OP_SEMI |                                | 14.66667
#          METHOD |     {"name":"_init_","main":1} | 16.33333
#       CLOSURE_S |                                | 16.66667
#    KEYWORD_NEED |                                | 17.1
#        VAR_THIS |                         "addr" | 17.2
#        OP_VALUE |                                | 17.3
#        BAREWORD |                          "Str" | 17.4
#        OP_COMMA |                                | 17.5
#        VAR_THIS |                         "nick" | 17.6
#        OP_VALUE |                                | 17.7
#        BAREWORD |                          "Str" | 17.8
#         OP_SEMI |                                | 17.9
#    KEYWORD_WANT |                                | 18.125
#        VAR_THIS |                         "port" | 18.25
#        OP_VALUE |                                | 18.375
#        BAREWORD |                          "Num" | 18.5
#       OP_ASSIGN |                                | 18.625
#          NUMBER |                         "6667" | 18.75
#         OP_SEMI |                                | 18.875
#    KEYWORD_WANT |                                | 19.125
#        VAR_THIS |                         "user" | 19.25
#        OP_VALUE |                                | 19.375
#        BAREWORD |                          "Str" | 19.5
#       OP_ASSIGN |                                | 19.625
#          STRING |                     ["ferret"] | 19.75
#         OP_SEMI |                                | 19.875
#    KEYWORD_WANT |                                | 20.125
#        VAR_THIS |                         "real" | 20.25
#        OP_VALUE |                                | 20.375
#        BAREWORD |                          "Str" | 20.5
#       OP_ASSIGN |                                | 20.625
#          STRING |                 ["Ferret IRC"] | 20.75
#         OP_SEMI |                                | 20.875
#        VAR_THIS |                     "commands" | 22.2
#       OP_ASSIGN |                                | 22.4
#         VAR_LEX |              "initialCommands" | 22.6
#         OP_SEMI |                                | 22.8
#        VAR_THIS |                     "factoids" | 23.14286
#       OP_ASSIGN |                                | 23.28571
#       BRACKET_S |                                | 23.42857
#        OP_VALUE |                                | 23.57143
#       BRACKET_E |                                | 23.71429
#         OP_SEMI |                                | 23.85714
#        VAR_THIS |                         "sock" | 26.05882
#       OP_ASSIGN |                                | 26.11765
#        BAREWORD |                       "Socket" | 26.17647
#         OP_PACK |                                | 26.23529
#        BAREWORD |                          "TCP" | 26.29412
#      PAREN_CALL |                                | 26.35294
#      PROP_VALUE |                      "address" | 26.41176
#        VAR_THIS |                         "addr" | 26.47059
#        OP_COMMA |                                | 26.52941
#      PROP_VALUE |                         "port" | 26.58824
#        VAR_THIS |                         "port" | 26.64706
#        OP_COMMA |                                | 26.70588
#      PROP_VALUE |                     "readMode" | 26.76471
#         VAR_SYM |                         "line" | 26.82353
#         PAREN_E |                                | 26.88235
#         OP_SEMI |                                | 26.94118
#      KEYWORD_ON |                                | 29.14286
#        VAR_THIS |                         "sock" | 29.28571
#        PROPERTY |                    "connected" | 29.42857
#        OP_COMMA |                                | 29.57143
#         VAR_SYM |             "sendRegistration" | 29.71429
#       CLOSURE_S |                                | 29.85714
#        VAR_THIS |                         "send" | 30.16667
#      PAREN_CALL |                                | 30.33333
#          STRING | ["USER ",["VAR_THIS","user",30]," ","*"," ","*"," :",["VAR_THIS","real",30]] | 30.5
#         PAREN_E |                                | 30.66667
#         OP_SEMI |                                | 30.83333
#        VAR_THIS |                         "send" | 31.16667
#      PAREN_CALL |                                | 31.33333
#          STRING | ["NICK ",["VAR_THIS","nick",31]] | 31.5
#         PAREN_E |                                | 31.66667
#         OP_SEMI |                                | 31.83333
#       CLOSURE_E |                                | 32.5
#      KEYWORD_ON |                                | 35.14286
#        VAR_THIS |                         "sock" | 35.28571
#        PROPERTY |                      "gotLine" | 35.42857
#        OP_COMMA |                                | 35.57143
#         VAR_SYM |                   "handleLine" | 35.71429
#       CLOSURE_S |                                | 35.85714
#    KEYWORD_NEED |                                | 36.25
#         VAR_LEX |                         "data" | 36.5
#         OP_SEMI |                                | 36.75
#        VAR_THIS |                   "handleLine" | 37.16667
#      PAREN_CALL |                                | 37.33333
#         VAR_LEX |                         "data" | 37.5
#         PAREN_E |                                | 37.66667
#         OP_SEMI |                                | 37.83333
#       CLOSURE_E |                                | 38.5
#       CLOSURE_E |                                | 40.5
#          METHOD |          {"name":"addCommand"} | 42.33333
#       CLOSURE_S |                                | 42.66667
#    KEYWORD_NEED |                                | 43.125
#         VAR_LEX |                      "command" | 43.25
#        OP_VALUE |                                | 43.375
#        BAREWORD |                          "Str" | 43.5
#        OP_COMMA |                                | 43.625
#         VAR_LEX |                     "callback" | 43.75
#         OP_SEMI |                                | 43.875
#      KEYWORD_IF |                                | 44.14286
#        VAR_THIS |                     "commands" | 44.28571
#     BRACKET_IDX |                                | 44.42857
#         VAR_LEX |                      "command" | 44.57143
#       BRACKET_E |                                | 44.71429
#        OP_VALUE |                                | 44.85714
#        BAREWORD |                    "overwrote" | 45.2
#       OP_RETURN |                                | 45.4
#    KEYWORD_TRUE |                                | 45.6
#         OP_SEMI |                                | 45.8
#        VAR_THIS |                     "commands" | 46.125
#     BRACKET_IDX |                                | 46.25
#         VAR_LEX |                      "command" | 46.375
#       BRACKET_E |                                | 46.5
#       OP_ASSIGN |                                | 46.625
#         VAR_LEX |                     "callback" | 46.75
#         OP_SEMI |                                | 46.875
#        BAREWORD |                        "added" | 47.2
#       OP_RETURN |                                | 47.4
#    KEYWORD_TRUE |                                | 47.6
#         OP_SEMI |                                | 47.8
#       CLOSURE_E |                                | 48.5
#          METHOD |             {"name":"connect"} | 50.33333
#       CLOSURE_S |                                | 50.66667
#        VAR_THIS |                         "sock" | 51.16667
#        PROPERTY |                      "connect" | 51.33333
#      PAREN_CALL |                                | 51.5
#         PAREN_E |                                | 51.66667
#         OP_SEMI |                                | 51.83333
#       CLOSURE_E |                                | 52.5
#          METHOD |                {"name":"send"} | 54.33333
#       CLOSURE_S |                                | 54.66667
#    KEYWORD_NEED |                                | 55.25
#         VAR_LEX |                         "line" | 55.5
#         OP_SEMI |                                | 55.75
#        BAREWORD |                          "say" | 56.16667
#      PAREN_CALL |                                | 56.33333
#          STRING | ["send: ",["VAR_LEX","line",56]] | 56.5
#         PAREN_E |                                | 56.66667
#         OP_SEMI |                                | 56.83333
#        VAR_THIS |                         "sock" | 57.14286
#        PROPERTY |                      "println" | 57.28571
#      PAREN_CALL |                                | 57.42857
#         VAR_LEX |                         "line" | 57.57143
#         PAREN_E |                                | 57.71429
#         OP_SEMI |                                | 57.85714
#       CLOSURE_E |                                | 58.5
#          METHOD |          {"name":"handleLine"} | 60.33333
#       CLOSURE_S |                                | 60.66667
#    KEYWORD_NEED |                                | 61.25
#         VAR_LEX |                         "line" | 61.5
#         OP_SEMI |                                | 61.75
#         VAR_LEX |                            "s" | 64.11111
#       OP_ASSIGN |                                | 64.22222
#         VAR_LEX |                         "line" | 64.33333
#        PROPERTY |                        "split" | 64.44444
#      PAREN_CALL |                                | 64.55556
#          STRING |                          [" "] | 64.66667
#         PAREN_E |                                | 64.77778
#         OP_SEMI |                                | 64.88889
#         VAR_LEX |                      "command" | 65.125
#       OP_ASSIGN |                                | 65.25
#         VAR_LEX |                            "s" | 65.375
#     BRACKET_IDX |                                | 65.5
#          NUMBER |                            "1" | 65.625
#       BRACKET_E |                                | 65.75
#         OP_SEMI |                                | 65.875
#      KEYWORD_IF |                                | 68.11111
#         VAR_LEX |                            "s" | 68.22222
#     BRACKET_IDX |                                | 68.33333
#          NUMBER |                            "0" | 68.44444
#       BRACKET_E |                                | 68.55556
#        OP_EQUAL |                                | 68.66667
#          STRING |                       ["PING"] | 68.77778
#        OP_VALUE |                                | 68.88889
#         VAR_LEX |                      "command" | 69.125
#       OP_ASSIGN |                                | 69.25
#         VAR_LEX |                            "s" | 69.375
#     BRACKET_IDX |                                | 69.5
#          NUMBER |                            "0" | 69.625
#       BRACKET_E |                                | 69.75
#         OP_SEMI |                                | 69.875
#        BAREWORD |                          "say" | 71.16667
#      PAREN_CALL |                                | 71.33333
#          STRING | ["recv[",["VAR_LEX","command",71],"]: ",["VAR_LEX","line",71]] | 71.5
#         PAREN_E |                                | 71.66667
#         OP_SEMI |                                | 71.83333
#         VAR_LEX |                     "handlers" | 74.14286
#     BRACKET_IDX |                                | 74.28571
#         VAR_LEX |                      "command" | 74.42857
#       BRACKET_E |                                | 74.57143
#        OP_MAYBE |                                | 74.71429
#      PAREN_CALL |                                | 74.85714
#      PROP_VALUE |                        "_self" | 75.25
#        VAR_SPEC |                         "self" | 75.5
#        OP_COMMA |                                | 75.75
#      PROP_VALUE |                         "line" | 76.25
#         VAR_LEX |                         "line" | 76.5
#        OP_COMMA |                                | 76.75
#      PROP_VALUE |                      "command" | 77.25
#         VAR_LEX |                      "command" | 77.5
#        OP_COMMA |                                | 77.75
#      PROP_VALUE |                            "s" | 78.25
#         VAR_LEX |                            "s" | 78.5
#        OP_COMMA |                                | 78.75
#         PAREN_E |                                | 79.33333
#         OP_SEMI |                                | 79.66667
#       CLOSURE_E |                                | 81.5
#          METHOD |             {"name":"privmsg"} | 83.33333
#       CLOSURE_S |                                | 83.66667
#    KEYWORD_NEED |                                | 84.1
#         VAR_LEX |                      "channel" | 84.2
#        OP_VALUE |                                | 84.3
#        BAREWORD |                          "Str" | 84.4
#        OP_COMMA |                                | 84.5
#         VAR_LEX |                      "message" | 84.6
#        OP_VALUE |                                | 84.7
#        BAREWORD |                          "Str" | 84.8
#         OP_SEMI |                                | 84.9
#     KEYWORD_FOR |                                | 85.1
#         VAR_LEX |                         "line" | 85.2
#      KEYWORD_IN |                                | 85.3
#         VAR_LEX |                      "message" | 85.4
#        PROPERTY |                        "split" | 85.5
#      PAREN_CALL |                                | 85.6
#          STRING |                         ["\n"] | 85.7
#         PAREN_E |                                | 85.8
#       CLOSURE_S |                                | 85.9
#      KEYWORD_IF |                                | 86.14286
#         VAR_LEX |                         "line" | 86.28571
#        PROPERTY |                       "length" | 86.42857
#       OP_NEQUAL |                                | 86.57143
#          NUMBER |                            "0" | 86.71429
#        OP_VALUE |                                | 86.85714
#        VAR_THIS |                         "send" | 87.16667
#      PAREN_CALL |                                | 87.33333
#          STRING | ["PRIVMSG ",["VAR_LEX","channel",87]," :",["VAR_LEX","line",87]] | 87.5
#         PAREN_E |                                | 87.66667
#         OP_SEMI |                                | 87.83333
#       CLOSURE_E |                                | 88.5
#       CLOSURE_E |                                | 89.5
#        FUNCTION |       {"name":"_joinChannels"} | 91.33333
#       CLOSURE_S |                                | 91.66667
#      KEYWORD_IF |                                | 94.25
#        VAR_THIS |              "_joinedChannels" | 94.5
#        OP_VALUE |                                | 94.75
#  KEYWORD_RETURN |                                | 95.33333
#         OP_SEMI |                                | 95.66667
#        VAR_THIS |              "_joinedChannels" | 96.2
#       OP_ASSIGN |                                | 96.4
#    KEYWORD_TRUE |                                | 96.6
#         OP_SEMI |                                | 96.8
#      KEYWORD_IF |                                | 98.25
#        VAR_THIS |                     "autojoin" | 98.5
#       CLOSURE_S |                                | 98.75
#     KEYWORD_FOR |                                | 99.16667
#         VAR_LEX |                         "chan" | 99.33333
#      KEYWORD_IN |                                | 99.5
#        VAR_THIS |                     "autojoin" | 99.66667
#       CLOSURE_S |                                | 99.83333
#        VAR_THIS |                         "send" | 100.16667
#      PAREN_CALL |                                | 100.33333
#          STRING | ["JOIN ",["VAR_LEX","chan",100]] | 100.5
#         PAREN_E |                                | 100.66667
#         OP_SEMI |                                | 100.83333
#       CLOSURE_E |                                | 101.5
#       CLOSURE_E |                                | 102.5
#       CLOSURE_E |                                | 103.5
#        FUNCTION |               {"name":"_pong"} | 107.33333
#       CLOSURE_S |                                | 107.66667
#    KEYWORD_NEED |                                | 108.25
#         VAR_LEX |                            "s" | 108.5
#         OP_SEMI |                                | 108.75
#        VAR_THIS |                         "send" | 109.09091
#      PAREN_CALL |                                | 109.18182
#          STRING |                      ["PONG "] | 109.27273
#          OP_ADD |                                | 109.36364
#         VAR_LEX |                            "s" | 109.45455
#     BRACKET_IDX |                                | 109.54545
#          NUMBER |                            "1" | 109.63636
#       BRACKET_E |                                | 109.72727
#         PAREN_E |                                | 109.81818
#         OP_SEMI |                                | 109.90909
#       CLOSURE_E |                                | 110.5
#        FUNCTION |      {"name":"_handleMessage"} | 112.33333
#       CLOSURE_S |                                | 112.66667
#    KEYWORD_NEED |                                | 113.16667
#         VAR_LEX |                         "line" | 113.33333
#        OP_COMMA |                                | 113.5
#         VAR_LEX |                            "s" | 113.66667
#         OP_SEMI |                                | 113.83333
#         VAR_LEX |                          "msg" | 116.1
#       OP_ASSIGN |                                | 116.2
#        BAREWORD |                          "IRC" | 116.3
#         OP_PACK |                                | 116.4
#        BAREWORD |                      "Message" | 116.5
#      PAREN_CALL |                                | 116.6
#         VAR_LEX |                         "line" | 116.7
#         PAREN_E |                                | 116.8
#         OP_SEMI |                                | 116.9
#        BAREWORD |                          "msg" | 117.2
#       OP_RETURN |                                | 117.4
#         VAR_LEX |                          "msg" | 117.6
#         OP_SEMI |                                | 117.8
#      KEYWORD_IF |                                | 120.08333
#         VAR_LEX |                          "msg" | 120.16667
#        PROPERTY |                      "command" | 120.25
#        OP_VALUE |                                | 120.33333
#        VAR_THIS |                     "commands" | 120.41667
#     BRACKET_IDX |                                | 120.5
#         VAR_LEX |                          "msg" | 120.58333
#        PROPERTY |                      "command" | 120.66667
#       BRACKET_E |                                | 120.75
#        OP_MAYBE |                                | 120.83333
#      PAREN_CALL |                                | 120.91667
#      PROP_VALUE |                        "_self" | 121.25
#        VAR_SPEC |                         "self" | 121.5
#        OP_COMMA |                                | 121.75
#      PROP_VALUE |                         "line" | 122.25
#         VAR_LEX |                         "line" | 122.5
#        OP_COMMA |                                | 122.75
#      PROP_VALUE |                            "s" | 123.25
#         VAR_LEX |                            "s" | 123.5
#        OP_COMMA |                                | 123.75
#      PROP_VALUE |                          "msg" | 124.25
#         VAR_LEX |                          "msg" | 124.5
#        OP_COMMA |                                | 124.75
#         PAREN_E |                                | 125.33333
#         OP_SEMI |                                | 125.66667
#       CLOSURE_E |                                | 127.5
#        FUNCTION |       {"name":"_commandHello"} | 129.33333
#       CLOSURE_S |                                | 129.66667
#    KEYWORD_NEED |                                | 130.25
#         VAR_LEX |                          "msg" | 130.5
#         OP_SEMI |                                | 130.75
#         VAR_LEX |                     "nickname" | 131.16667
#       OP_ASSIGN |                                | 131.33333
#         VAR_LEX |                          "msg" | 131.5
#        PROPERTY |                     "nickname" | 131.66667
#         OP_SEMI |                                | 131.83333
#        VAR_THIS |                      "privmsg" | 132.11111
#      PAREN_CALL |                                | 132.22222
#         VAR_LEX |                          "msg" | 132.33333
#        PROPERTY |                      "channel" | 132.44444
#        OP_COMMA |                                | 132.55556
#          STRING | ["Hi ",["VAR_LEX","nickname",132],"!"] | 132.66667
#         PAREN_E |                                | 132.77778
#         OP_SEMI |                                | 132.88889
#       CLOSURE_E |                                | 133.5
#        FUNCTION |         {"name":"_commandAdd"} | 135.33333
#       CLOSURE_S |                                | 135.66667
#    KEYWORD_NEED |                                | 136.25
#         VAR_LEX |                          "msg" | 136.5
#         OP_SEMI |                                | 136.75
#        BAREWORD |                      "inspect" | 137.16667
#      PAREN_CALL |                                | 137.33333
#         VAR_LEX |                          "msg" | 137.5
#         PAREN_E |                                | 137.66667
#         OP_SEMI |                                | 137.83333
#         VAR_LEX |                      "trigger" | 140.11111
#       OP_ASSIGN |                                | 140.22222
#         VAR_LEX |                          "msg" | 140.33333
#        PROPERTY |                        "parts" | 140.44444
#     BRACKET_IDX |                                | 140.55556
#          NUMBER |                            "1" | 140.66667
#       BRACKET_E |                                | 140.77778
#         OP_SEMI |                                | 140.88889
#         VAR_LEX |                     "response" | 141.11111
#       OP_ASSIGN |                                | 141.22222
#         VAR_LEX |                          "msg" | 141.33333
#        PROPERTY |                     "fromWord" | 141.44444
#      PAREN_CALL |                                | 141.55556
#          NUMBER |                            "2" | 141.66667
#         PAREN_E |                                | 141.77778
#         OP_SEMI |                                | 141.88889
#        VAR_THIS |                     "factoids" | 144.125
#     BRACKET_IDX |                                | 144.25
#         VAR_LEX |                      "trigger" | 144.375
#       BRACKET_E |                                | 144.5
#       OP_ASSIGN |                                | 144.625
#         VAR_LEX |                     "response" | 144.75
#         OP_SEMI |                                | 144.875
#        VAR_THIS |                     "commands" | 145.125
#     BRACKET_IDX |                                | 145.25
#         VAR_LEX |                      "trigger" | 145.375
#       BRACKET_E |                                | 145.5
#       OP_ASSIGN |                                | 145.625
#        BAREWORD |              "_commandFactoid" | 145.75
#         OP_SEMI |                                | 145.875
#        VAR_THIS |                      "privmsg" | 147.11111
#      PAREN_CALL |                                | 147.22222
#         VAR_LEX |                          "msg" | 147.33333
#        PROPERTY |                      "channel" | 147.44444
#        OP_COMMA |                                | 147.55556
#          STRING | ["alright, associating .",["VAR_LEX","trigger",147]," with '",["VAR_LEX","response",147],"'"] | 147.66667
#         PAREN_E |                                | 147.77778
#         OP_SEMI |                                | 147.88889
#       CLOSURE_E |                                | 148.5
#        FUNCTION |     {"name":"_commandFactoid"} | 150.33333
#       CLOSURE_S |                                | 150.66667
#    KEYWORD_NEED |                                | 151.25
#         VAR_LEX |                          "msg" | 151.5
#         OP_SEMI |                                | 151.75
#         VAR_LEX |                     "response" | 152.11111
#       OP_ASSIGN |                                | 152.22222
#        VAR_THIS |                     "factoids" | 152.33333
#     BRACKET_IDX |                                | 152.44444
#         VAR_LEX |                          "msg" | 152.55556
#        PROPERTY |                      "command" | 152.66667
#       BRACKET_E |                                | 152.77778
#         OP_SEMI |                                | 152.88889
#        VAR_THIS |                      "privmsg" | 153.11111
#      PAREN_CALL |                                | 153.22222
#         VAR_LEX |                          "msg" | 153.33333
#        PROPERTY |                      "channel" | 153.44444
#        OP_COMMA |                                | 153.55556
#         VAR_LEX |                     "response" | 153.66667
#         PAREN_E |                                | 153.77778
#         OP_SEMI |                                | 153.88889
#       CLOSURE_E |                                | 154.5
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
                $scope, undef, 30.33333
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 31.33333
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
            FF::need( $scope, $arguments, 'data', 36.5 ) or return;
            $self->property_u('handleLine')
              ->call_u( [ $scope->property_u('data') ],
                $scope, undef, 37.33333 );
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
            $self->set_property( _joinedChannels => $true, 96.4 );
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
                            100.33333
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
            FF::need( $scope, $arguments, 's', 108.5 ) or return;
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
                109.18182
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
            FF::need( $scope, $arguments, 'line', 113.33333 ) or return;
            FF::need( $scope, $arguments, 's',    113.66667 ) or return;
            $scope->set_property_ow(
                $context,
                msg => $scope->property_u('IRC::Message')->call_u(
                    [ $scope->property_u('line') ],
                    $scope, undef, 116.6
                ),
                116.2
            );
            $return->set_property( msg => $scope->property_u('msg'), 117.4 );
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
                            $scope, undef,
                            120.91667
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
            FF::need( $scope, $arguments, 'msg', 130.5 ) or return;
            $scope->set_property_ow(
                $context,
                nickname => $scope->property_u('msg')->property_u('nickname'),
                131.33333
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
                132.22222
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
            FF::need( $scope, $arguments, 'msg', 136.5 ) or return;
            $scope->property_u('inspect')
              ->call_u( [ $scope->property_u('msg') ],
                $scope, undef, 137.33333 );
            $scope->set_property_ow(
                $context,
                trigger => $scope->property_u('msg')->property_u('parts')
                  ->get_index_value( [ num( $f, 1 ) ], $scope ),
                140.22222
            );
            $scope->set_property_ow(
                $context,
                response => $scope->property_u('msg')->property_u('fromWord')
                  ->call_u( [ num( $f, 2 ) ], $scope, undef, 141.55556 ),
                141.22222
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
                $scope, undef,
                147.22222
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
            FF::need( $scope, $arguments, 'msg', 151.5 ) or return;
            $scope->set_property_ow(
                $context,
                response => $self->property_u('factoids')->get_index_value(
                    [ $scope->property_u('msg')->property_u('command') ],
                    $scope
                ),
                152.22222
            );
            $self->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('response')
                ],
                $scope, undef,
                153.22222
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
                FF::want( $self, $arguments, 'port', 18.25, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'user', 19.25,
                    str( $f, "ferret" ) );
                FF::want( $self, $arguments, 'real', 20.25,
                    str( $f, "Ferret IRC" ) );
                $self->set_property(
                    commands => $scope->property_u('initialCommands'),
                    22.4
                );
                $self->set_property(
                    factoids => FF::create_hash( $f, {} ),
                    23.28571
                );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address  => $self->property_u('addr'),
                            port     => $self->property_u('port'),
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 26.35294
                    ),
                    26.11765
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
                FF::need( $scope, $arguments, 'command',  43.25 ) or return;
                FF::need( $scope, $arguments, 'callback', 43.75 ) or return;
                if (
                    bool(
                        $self->property_u('commands')->get_index_value(
                            [ $scope->property_u('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property( overwrote => $true, 45.4 );
                }
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('command') ],
                    $scope->property_u('callback'), $scope );
                $return->set_property( added => $true, 47.4 );
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
                  ->call_u( {}, $scope, undef, 51.5 );
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
                FF::need( $scope, $arguments, 'line', 55.5 ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef, 56.33333
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 57.42857 );
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
                FF::need( $scope, $arguments, 'line', 61.5 ) or return;
                $scope->set_property_ow(
                    $context,
                    s => $scope->property_u('line')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 64.55556 ),
                    64.22222
                );
                $scope->set_property_ow(
                    $context,
                    command => $scope->property_u('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    65.25
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
                        69.25
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
                    $scope, undef, 71.33333
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
                            $scope, undef, 74.85714
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
                FF::need( $scope, $arguments, 'channel', 84.2 ) or return;
                FF::need( $scope, $arguments, 'message', 84.6 ) or return;
                FF::iterate(
                    $f, $scope,
                    $scope->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, "\n" ) ], $scope, undef, 85.6 ),
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
                                $scope, undef, 87.33333
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
            4.5
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
            10.5
        );
    }
    FF::load_namespaces( $context,
        qw(IRC IRC::Message Num Socket Socket::TCP Str) );
};

FF::after_content();
