# === Document Model ===
#  Document './test/18-lists-hashes.frt'
#      Instruction
#          Assignment
#              Lexical variable '$list'
#              Value list [1 items]
#                  Item 0
#                      String 'hi'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$list'
#              Argument list [1 items]
#                  Item 0
#                      String 'there'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$list'
#                  Index list [1 items]
#                      Item 0
#                          Number '4'
#              String 'yeah'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Length: '
#                          Addition operator (+)
#                          Property 'length'
#                              Lexical variable '$list'
#      For
#          Expression ('for' parameter)
#              Lexical variable '$item'
#          Expression ('in' parameter)
#              Lexical variable '$list'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'item: '
#                                  Addition operator (+)
#                                  Lexical variable '$item'
#      Instruction
#          Assignment
#              Lexical variable '$hash'
#              Hash [1 items]
#                  Item 0
#                      Pair 'hi'
#                          String 'there'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$hash'
#                  Index list [1 items]
#                      Item 0
#                          String 'whats'
#              String 'up'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$hash'
#                  Index list [1 items]
#                      Item 0
#                          String 'thank'
#              String 'you'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'whats '
#                          Addition operator (+)
#                          Index
#                              Lexical variable '$hash'
#                              Index list [1 items]
#                                  Item 0
#                                      String 'whats'
#      For
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$key'
#                  Item 1
#                      Lexical variable '$val'
#          Expression ('in' parameter)
#              Lexical variable '$hash'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'pair: key='
#                                  Addition operator (+)
#                                  Lexical variable '$key'
#                                  Addition operator (+)
#                                  String ' value='
#                                  Addition operator (+)
#                                  Lexical variable '$val'
