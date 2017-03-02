# === Document Model ===
#  Document './std/Math/Vector.frt'
#      Package 'Math'
#      Class 'Vector'
#          Class method 'initializer__' { ?$items:Num... }
#              Function body
#                  Instruction
#                      Want (...)
#                          Instance variable '@items'
#                          Argument type
#                              Bareword 'Num'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@dimension'
#                              Less than operator (<)
#                              Number '1'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Need dimen...'
#          Computed property 'dimension' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Property 'length'
#                              Instance variable '@items'
#          Computed property 'dimensionHR' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@dimension'
#                              Addition operator (+)
#                              String 'D'
#          Computed property 'magnitude' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Property 'sqrt'
#                              Property 'sum'
#                                  Call
#                                      Property 'map'
#                                          Instance variable '@items'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Anonymous function { -> $result }
#                                                  Function body
#                                                      Instruction
#                                                          Return
#                                                              Operation
#                                                                  Topic variable '$_'
#                                                                  Exponent operator (^)
#                                                                  Number '2'
#          Computed property 'unitVector' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Division operator (/)
#                              Instance variable '@magnitude'
#          Method 'axisUnitVector' { $axis:VectorAxis -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$axis'
#                          Argument type
#                              Bareword 'VectorAxis'
#                  Instruction
#                      Return
#                          Call
#                              Property 'axisUnitVector'
#                                  Bareword 'Vector'
#                              Argument list [2 items]
#                                  Item 0
#                                      Instance variable '@dimension'
#                                  Item 1
#                                      Lexical variable '$axis'
#          Computed property 'x' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '0'
#          Computed property 'y' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '1'
#          Computed property 'z' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '2'
#          Computed property 'direction' { -> $result }
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@dimension'
#                              Negated equality operator (!=)
#                              Number '2'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Direction ...'
#                  Instruction
#                      Return
#                          Call
#                              Property 'atan2'
#                                  Bareword 'Math'
#                              Argument list [2 items]
#                                  Item 0
#                                      Instance variable '@y'
#                                  Item 1
#                                      Instance variable '@x'
#          Method 'opAdd' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  String 'Dimension ...'
#                                                  Addition operator (+)
#                                                  Property 'dimensionHR'
#                                                      Lexical variable '$ehs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimensionHR'
#                  Instruction
#                      Assignment
#                          Lexical variable '$items'
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Number '0'
#                                              Range operator (..)
#                                              Property 'lastIndex'
#                                                  Instance variable '@items'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Operation
#                                                      Index
#                                                          Special variable '*self'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                                                      Addition operator (+)
#                                                      Index
#                                                          Lexical variable '$ehs'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Lexical variable '$items'
#          Method 'opSub' { $lhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$lhs'
#                          Argument type
#                              Bareword 'Num'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$lhs'
#                              Negated equality operator (!=)
#                              Number '0'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Set [2 items]
#                                      Item 0
#                                          Symbol :InvalidOperation
#                                      Item 1
#                                          String 'Unsupporte...'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Gather
#                                              Gather body
#                                                  For (values)
#                                                      Expression ('for' parameter)
#                                                          Lexical variable '$x'
#                                                      Expression ('in' parameter)
#                                                          Instance variable '@items'
#                                                      For body
#                                                          Instruction
#                                                              Take
#                                                                  Operation
#                                                                      Constant zero
#                                                                      Negation operator (-)
#                                                                      Lexical variable '$x'
#          Method 'opSub' { $rhs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$rhs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  String 'Dimension ...'
#                                                  Addition operator (+)
#                                                  Property 'dimensionHR'
#                                                      Lexical variable '$rhs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimensionHR'
#                  Instruction
#                      Assignment
#                          Lexical variable '$items'
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Number '0'
#                                              Range operator (..)
#                                              Property 'lastIndex'
#                                                  Instance variable '@items'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Operation
#                                                      Index
#                                                          Special variable '*self'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                                                      Subtraction operator (-)
#                                                      Index
#                                                          Lexical variable '$rhs'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Lexical variable '$items'
#          Method 'opMul' { $ehs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Call
#                                              Property 'map'
#                                                  Instance variable '@items'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Anonymous function { -> $result }
#                                                          Function body
#                                                              Instruction
#                                                                  Return
#                                                                      Operation
#                                                                          Topic variable '$_'
#                                                                          Multiplication operator (*)
#                                                                          Lexical variable '$ehs'
#          Method 'opDiv' { $rhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Multiplication operator (*)
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Number '1'
#                                          Division operator (/)
#                                          Lexical variable '$rhs'
#          Method 'opMul' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@dot'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$ehs'
#          Method 'opEqual' { $ehs:Vector -> $result $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Return
#                                  Boolean false
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '0'
#                              Range operator (..)
#                              Property 'lastIndex'
#                                  Instance variable '@items'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                      Equality operator (==)
#                                      Index
#                                          Lexical variable '$ehs'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                              If body
#                                  Instruction
#                                      Next
#                          Instruction
#                              Return
#                                  Boolean false
#                  Instruction
#                      Return
#                          Boolean true
#          Method 'dot' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  String 'Dimension ...'
#                                                  Addition operator (+)
#                                                  Property 'dimensionHR'
#                                                      Lexical variable '$ehs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimensionHR'
#                  Instruction
#                      Assignment
#                          Lexical variable '$dot'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '0'
#                              Range operator (..)
#                              Property 'lastIndex'
#                                  Instance variable '@items'
#                      For body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$dot'
#                                  Operation
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                      Multiplication operator (*)
#                                      Index
#                                          Lexical variable '$ehs'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Lexical variable '$dot'
#          Method 'cross' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Number '3'
#                              Logical or operator (||)
#                              Instance variable '@dimension'
#                              Negated equality operator (!=)
#                              Number '3'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Cross prod...'
#                  Instruction
#                      Assignment
#                          Instance variable '@a'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                  Instruction
#                      Assignment
#                          Instance variable '@b'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                  Instruction
#                      Assignment
#                          Instance variable '@c'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Argument list [3 items]
#                                  Item 0
#                                      Instance variable '@a'
#                                  Item 1
#                                      Instance variable '@b'
#                                  Item 2
#                                      Instance variable '@c'
#          Method 'angleBetween' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Assignment
#                          Lexical variable '$cosθ'
#                          Operation
#                              Call
#                                  Instance variable '@dot'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$ehs'
#                              Division operator (/)
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@magnitude'
#                                          Multiplication operator (*)
#                                          Property 'magnitude'
#                                              Lexical variable '$ehs'
#                  Instruction
#                      Return
#                          Call
#                              Property 'acos'
#                                  Bareword 'Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$cosθ'
#          Method 'orthogonalTo' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Instance variable '@dot'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$ehs'
#                              Equality operator (==)
#                              Number '0'
#          Method 'parallelTo' { $ehs:Vector -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  String 'Dimension ...'
#                                                  Addition operator (+)
#                                                  Property 'dimensionHR'
#                                                      Lexical variable '$ehs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimensionHR'
#                  Instruction
#                      Assignment
#                          Lexical variable '$u1'
#                          Instance variable '@unitVector'
#                  Instruction
#                      Assignment
#                          Lexical variable '$u2'
#                          Property 'unitVector'
#                              Lexical variable '$ehs'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$u1'
#                              Equality operator (==)
#                              Lexical variable '$u2'
#                              Logical or operator (||)
#                              Constant zero
#                              Negation operator (-)
#                              Lexical variable '$u1'
#                              Equality operator (==)
#                              Lexical variable '$u2'
#                      If body
#                          Instruction
#                              Return
#                                  Boolean true
#                  Instruction
#                      Return
#                          Boolean false
#          Method 'getValue' { $index:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$index'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Assignment
#                          Lexical variable '$n'
#                          Operation
#                              Lexical variable '$index'
#                              Addition operator (+)
#                              Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@dimension'
#                              Less than operator (<)
#                              Lexical variable '$n'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  Instance variable '@dimensionHR'
#                                                  Addition operator (+)
#                                                  String ' vector ha...'
#                                                  Addition operator (+)
#                                                  Lexical variable '$n'
#                  Instruction
#                      Return
#                          Index
#                              Instance variable '@items'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$index'
#          Method 'copy' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Call
#                                              Property 'copy'
#                                                  Instance variable '@items'
#          Method 'description' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              String '<'
#                              Addition operator (+)
#                              Call
#                                  Property 'join'
#                                      Instance variable '@items'
#                                  Argument list [1 item]
#                                      Item 0
#                                          String ', '
#                              Addition operator (+)
#                              String '>'
#          Class method 'zeroVector' { $dimension:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$dimension'
#                          Argument type
#                              Bareword 'Num'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$dimension'
#                              Less than operator (<)
#                              Number '1'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Need dimen...'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Gather
#                                              Gather body
#                                                  For (values)
#                                                      Expression ('for' parameter)
#                                                          Lexical variable '$i'
#                                                      Expression ('in' parameter)
#                                                          Operation
#                                                              Number '1'
#                                                              Range operator (..)
#                                                              Lexical variable '$dimension'
#                                                      For body
#                                                          Instruction
#                                                              Take
#                                                                  Number '0'
#          Class method 'axisUnitVector' { $dimension:Num $axis:VectorAxis -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$dimension'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$axis'
#                          Argument type
#                              Bareword 'VectorAxis'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$dimension'
#                              Less than operator (<)
#                              Number '1'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Need dimen...'
#                  Instruction
#                      Assignment
#                          Lexical variable '$items'
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Number '1'
#                                              Range operator (..)
#                                              Lexical variable '$dimension'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Lexical variable '$i'
#                                                      Equality operator (==)
#                                                      Lexical variable '$axis'
#                                              If body
#                                                  Instruction
#                                                      Take
#                                                          Number '1'
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Number '0'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Lexical variable '$items'
#          Function '_axisToNumber' { $axis:Num|Char -> $result $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$axis'
#                          Argument type
#                              Bareword 'Num'
#                              Bareword 'Char'
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Special property '*instanceOf'
#                                  Lexical variable '$axis'
#                              Argument list [1 item]
#                                  Item 0
#                                      Bareword 'Num'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$axis'
#                  Instruction
#                      Assignment
#                          Lexical variable '$o'
#                          Property 'ord'
#                              Lexical variable '$axis'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$o'
#                              Greater than operator (>)
#                              Number '119'
#                      If body
#                          Instruction
#                              Return
#                                  Operation
#                                      Lexical variable '$o'
#                                      Subtraction operator (-)
#                                      Number '119'
#                  Instruction
#                      Return
#                          Operation
#                              Lexical variable '$o'
#                              Subtraction operator (-)
#                              Number '104'
#          Type definition ('VectorAxis')
#              Type body
#                  Instruction
#                      Transform
#                          Call
#                              Bareword '_axisToNumber'
#                              Argument list [1 item]
#                                  Item 0
#                                      Topic variable '$_'
#      Include (Char, Error, Math, Num, Vector, VectorAxis)
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

my $file_name = './std/Math/Vector.frt';
my $pos = before_content( 'Vector.frt', $file_name );

use Ferret::Core::Operations
  qw(_sub add any_true bool div equal gr8r less mul nequal num pow range str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Anonymous function definition with topicalizer
    my $func_3 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                pow( $scope, $pos->(25.4), $ins, num( $f, "2" ) ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_14 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                mul( $scope, $pos->(96.55), $ins, $$scope->{'ehs'} ) );
            return $ret;
        }
    );

    # Function event '_axisToNumber' definition
    my $func_29 = function_event_def(
        $f, $scope,
        '_axisToNumber',
        undef,
        [
            {
                name     => 'axis',
                type     => [ 'Num', 'Char' ],
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'axis', 220.2 ) || return $ret_func->();
            if (
                bool(
                    $$scope->{'axis'}
                      ->property_u( '*instanceOf', $pos->(221.3) )
                      ->( [ $$scope->{'Num'} ], $scope, undef, $pos->(221.4) )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->( $$scope->{'axis'} );
            }
            var(
                $scope,
                o => $$scope->{'axis'}->property_u( 'ord', $pos->(223.4) ),
                $file_scope, $pos->(223.2)
            );
            if (
                bool(
                    gr8r(
                        $scope, $pos->(224.3),
                        $$scope->{'o'}, num( $f, "119" )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->(
                    _sub(
                        $scope, $pos->(225.3),
                        $$scope->{'o'}, num( $f, "119" )
                    )
                );
            }
            return $ret_func->(
                _sub( $scope, $pos->(226.3), $$scope->{'o'}, num( $f, "104" ) )
            );
            return $ret;
        }
    );

    # Class 'Vector'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Vector', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'items', type => 'Num', optional => 1, more => 1 } ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'items', 8.2 );
                if (
                    bool(
                        less(
                            $scope, $pos->(9.3),
                            $$self->{'dimension'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str( $f, "Need dimension >= 1D" )
                                ],
                                $scope, undef,
                                $pos->(10.3)
                            ),
                            $pos->(10.1)
                        )
                    );
                }
                return $ret;
            }
        );

        # Method event 'dimension' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'dimension',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'length', $pos->(15.3) ) );
                return $ret;
            }
        );

        # Method event 'dimensionHR' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'dimensionHR',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope, $pos->(20.3),
                        $$self->{'dimension'}, str( $f, "D" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'magnitude' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'magnitude',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'map', $pos->(25.15) )->(
                        [
                            $func_3->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(25.2)
                      )->property_u( 'sum', $pos->(25.55) )
                      ->property_u( 'sqrt', $pos->(25.6) )
                );
                return $ret;
            }
        );

        # Method event 'unitVector' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'unitVector',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    div(
                        $scope, $pos->(30.3), ${ $scope->{special} }->{'self'},
                        $$self->{'magnitude'}
                    )
                );
                return $ret;
            }
        );

        # Method event 'axisUnitVector' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'axisUnitVector',
            [
                {
                    name     => 'axis',
                    type     => 'VectorAxis',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'axis', 35.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Vector'}
                      ->property_u( 'axisUnitVector', $pos->(36.15) )->(
                        [ $$self->{'dimension'}, $$scope->{'axis'} ],
                        $scope, undef, $pos->(36.2)
                      )
                );
                return $ret;
            }
        );

        # Method event 'x' definition
        my $func_7 = method_event_def(
            $f, $scope, 'x', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    ${ $scope->{special} }->{'self'}->get_index_value(
                        [ num( $f, "0" ) ],
                        $scope, $pos->(41.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'y' definition
        my $func_8 = method_event_def(
            $f, $scope, 'y', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    ${ $scope->{special} }->{'self'}->get_index_value(
                        [ num( $f, "1" ) ],
                        $scope, $pos->(46.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'z' definition
        my $func_9 = method_event_def(
            $f, $scope, 'z', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    ${ $scope->{special} }->{'self'}->get_index_value(
                        [ num( $f, "2" ) ],
                        $scope, $pos->(51.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'direction' definition
        my $func_10 = method_event_def(
            $f, $scope,
            'direction',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if (
                    bool(
                        nequal(
                            $scope, $pos->(56.3),
                            $$self->{'dimension'}, num( $f, "2" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str( $f, "Direction only exists in 2D" )
                                ],
                                $scope, undef,
                                $pos->(57.3)
                            ),
                            $pos->(57.1)
                        )
                    );
                }
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'atan2', $pos->(58.15) )->(
                        [ $$self->{'y'}, $$self->{'x'} ], $scope,
                        undef, $pos->(58.2)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_11 = method_event_def(
            $f, $scope, 'opAdd',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 63.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(64.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(64.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(65.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimensionHR', $pos->(65.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimensionHR'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(65.15)
                            ),
                            $pos->(65.05)
                        )
                    );
                }
                var(
                    $scope,
                    items => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $pos->(66.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(66.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                add(
                                                    $scope,
                                                    $pos->(67.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(67.15)
                                                      ),
                                                    $$scope->{'ehs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(67.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(66.15)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(66.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(69.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_12 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'lhs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'lhs', 74.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope, $pos->(75.3),
                            $$scope->{'lhs'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            create_set(
                                $scope,
                                get_symbol( $f, 'InvalidOperation' ),
                                str( $f, "Unsupported operation" )
                            ),
                            $pos->(76.1)
                        )
                    );
                }
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => do {
                                    my ( $gather_status, $gather_ret ) =
                                      gather(
                                        $f, $scope,
                                        sub {
                                            my ( $scope, $take, $ret_func ) =
                                              @_;
                                            {
                                                my ( $loop_status, $loop_ret )
                                                  = iterate(
                                                    $f, $scope,
                                                    $$self->{'items'},
                                                    'x',
                                                    sub {
                                                        my ( $scope, $ret_func )
                                                          = @_;
                                                        $take->(
                                                            _sub(
                                                                $scope,
                                                                $pos->(78.2),
                                                                $f->zero,
                                                                $$scope->{'x'}
                                                            )
                                                        );
                                                    },
                                                    $pos->(77.25)
                                                  );
                                                return $ret_func->($loop_ret)
                                                  if $loop_status eq 'return';
                                            }
                                        }
                                      );
                                    return $ret_func->($gather_ret)
                                      if $gather_status eq 'return';
                                    $gather_ret;
                                  }
                            ]
                        ],
                        $scope,
                        undef,
                        $pos->(77.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_13 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'rhs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 84.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(85.4),
                            $$scope->{'rhs'}
                              ->property_u( 'dimension', $pos->(85.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(86.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'rhs'}->property_u(
                                            'dimensionHR', $pos->(86.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimensionHR'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(86.15)
                            ),
                            $pos->(86.05)
                        )
                    );
                }
                var(
                    $scope,
                    items => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $pos->(87.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(87.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                _sub(
                                                    $scope,
                                                    $pos->(88.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(88.15)
                                                      ),
                                                    $$scope->{'rhs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(88.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(87.15)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(87.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(90.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_15 = method_event_def(
            $f, $scope, 'opMul',
            [
                {
                    name     => 'ehs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 95.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'map', $pos->(96.3) )->(
                                    [
                                        $func_14->inside_scope(
                                            (undef) => $scope,
                                            undef, $class, $ins, undef, undef
                                        )
                                    ],
                                    $scope, undef,
                                    $pos->(96.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(96.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_16 = method_event_def(
            $f, $scope, 'opDiv',
            [
                {
                    name     => 'rhs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 101.2 ) || return $ret_func->();
                return $ret_func->(
                    mul(
                        $scope,
                        $pos->(102.15),
                        ${ $scope->{special} }->{'self'},
                        div(
                            $scope, $pos->(102.3),
                            num( $f, "1" ), $$scope->{'rhs'}
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_17 = method_event_def(
            $f, $scope, 'opMul',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 107.2 ) || return $ret_func->();
                return $ret_func->( $$self->{'dot'}
                      ->( [ $$scope->{'ehs'} ], $scope, undef, $pos->(108.3) )
                );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_18 = method_event_def(
            $f, $scope,
            'opEqual',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 113.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(114.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(114.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($false);
                }
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(116.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(116.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    equal(
                                        $scope,
                                        $pos->(117.3),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(117.15)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(117.4)
                                        )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return 'next';
                            }
                            return $ret_func->($false);
                        },
                        $pos->(116.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'dot' definition
        my $func_19 = method_event_def(
            $f, $scope, 'dot',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 126.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(127.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(127.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(128.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimensionHR', $pos->(128.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimensionHR'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(128.15)
                            ),
                            $pos->(128.05)
                        )
                    );
                }
                var(
                    $scope,
                    dot => num( $f, "0" ),
                    $file_scope, $pos->(129.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(130.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(130.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                dot => add(
                                    $scope,
                                    $pos->(131.1),
                                    $$scope->{'dot'},
                                    mul(
                                        $scope,
                                        $pos->(131.35),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(131.2)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(131.45)
                                        )
                                    )
                                ),
                                $file_scope,
                                $pos->(131.1)
                            );
                        },
                        $pos->(130.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'dot'} );
                return $ret;
            }
        );

        # Method event 'cross' definition
        my $func_20 = method_event_def(
            $f, $scope, 'cross',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 138.2 ) || return $ret_func->();
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(139.2),
                            sub {
                                nequal(
                                    $scope,
                                    $pos->(139.2),
                                    $$scope->{'ehs'}->property_u(
                                        'dimension', $pos->(139.15)
                                    ),
                                    num( $f, "3" )
                                );
                            },
                            sub {
                                nequal( $scope, $pos->(139.2),
                                    $$self->{'dimension'}, num( $f, "3" ) );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str(
                                        $f, "Cross product only exists in 3D"
                                    )
                                ],
                                $scope, undef,
                                $pos->(140.3)
                            ),
                            $pos->(140.1)
                        )
                    );
                }
                $self->set_property(
                    a => _sub(
                        $scope,
                        $pos->(141.23333),
                        mul(
                            $scope,
                            $pos->(141.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(141.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ],
                                $scope, $pos->(141.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(141.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(141.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(141.63333)
                            )
                        )
                    ),
                    $pos->(141.06667)
                );
                $self->set_property(
                    b => _sub(
                        $scope,
                        $pos->(142.23333),
                        mul(
                            $scope,
                            $pos->(142.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(142.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ],
                                $scope, $pos->(142.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(142.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(142.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(142.63333)
                            )
                        )
                    ),
                    $pos->(142.06667)
                );
                $self->set_property(
                    c => _sub(
                        $scope,
                        $pos->(143.23333),
                        mul(
                            $scope,
                            $pos->(143.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(143.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ],
                                $scope, $pos->(143.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(143.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(143.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(143.63333)
                            )
                        )
                    ),
                    $pos->(143.06667)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ $$self->{'a'}, $$self->{'b'}, $$self->{'c'} ],
                        $scope, undef, $pos->(144.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'angleBetween' definition
        my $func_21 = method_event_def(
            $f, $scope,
            'angleBetween',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 150.2 ) || return $ret_func->();
                var(
                    $scope,
                    cosθ => div(
                        $scope,
                        $pos->(152.35),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(152.2)
                        ),
                        mul(
                            $scope,
                            $pos->(152.5),
                            $$self->{'magnitude'},
                            $$scope->{'ehs'}
                              ->property_u( 'magnitude', $pos->(152.6) )
                        )
                    ),
                    $file_scope,
                    $pos->(152.1)
                );
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'acos', $pos->(153.3) )
                      ->( [ $$scope->{'cosθ'} ], $scope, undef, $pos->(153.4) )
                );
                return $ret;
            }
        );

        # Method event 'orthogonalTo' definition
        my $func_22 = method_event_def(
            $f, $scope,
            'orthogonalTo',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 160.2 ) || return $ret_func->();
                return $ret_func->(
                    equal(
                        $scope,
                        $pos->(161.6),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(161.3)
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'parallelTo' definition
        my $func_23 = method_event_def(
            $f, $scope,
            'parallelTo',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 166.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(167.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(167.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(168.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimensionHR', $pos->(168.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimensionHR'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(168.15)
                            ),
                            $pos->(168.05)
                        )
                    );
                }
                var(
                    $scope,
                    u1 => $$self->{'unitVector'},
                    $file_scope, $pos->(169.2)
                );
                var(
                    $scope,
                    u2 => $$scope->{'ehs'}
                      ->property_u( 'unitVector', $pos->(170.4) ),
                    $file_scope, $pos->(170.2)
                );
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(171.15),
                            sub {
                                equal(
                                    $scope,          $pos->(171.15),
                                    $$scope->{'u1'}, $$scope->{'u2'}
                                );
                            },
                            sub {
                                equal(
                                    $scope,
                                    $pos->(171.15),
                                    _sub(
                                        $scope,   $pos->(171.15),
                                        $f->zero, $$scope->{'u1'}
                                    ),
                                    $$scope->{'u2'}
                                );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($true);
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'getValue' definition
        my $func_24 = method_event_def(
            $f, $scope,
            'getValue',
            [
                {
                    name     => 'index',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'index', 179.2 ) || return $ret_func->();
                var(
                    $scope,
                    n => add(
                        $scope, $pos->(180.4),
                        $$scope->{'index'}, num( $f, "1" )
                    ),
                    $file_scope,
                    $pos->(180.2)
                );
                if (
                    bool(
                        less(
                            $scope,                $pos->(181.3),
                            $$self->{'dimension'}, $$scope->{'n'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(182.35),
                                        $$self->{'dimensionHR'},
                                        str( $f, " vector has no component " ),
                                        $$scope->{'n'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(182.15)
                            ),
                            $pos->(182.05)
                        )
                    );
                }
                return $ret_func->(
                    $$self->{'items'}->get_index_value(
                        [ $$scope->{'index'} ],
                        $scope, $pos->(183.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'copy' definition
        my $func_25 = method_event_def(
            $f, $scope, 'copy', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'copy', $pos->(188.3) )->(
                                    [ undef, [] ], $scope,
                                    undef, $pos->(188.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(188.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_26 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(192.15),
                        str( $f, "<" ),
                        $$self->{'items'}->property_u( 'join', $pos->(192.25) )
                          ->(
                            [ str( $f, ", " ) ], $scope,
                            undef, $pos->(192.3)
                          ),
                        str( $f, ">" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'zeroVector' definition
        my $func_27 = method_event_def(
            $f, $scope,
            'zeroVector',
            [
                {
                    name     => 'dimension',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'dimension', 197.2 )
                  || return $ret_func->();
                if (
                    bool(
                        less(
                            $scope, $pos->(198.3),
                            $$scope->{'dimension'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str( $f, "Need dimension >= 1D" )
                                ],
                                $scope, undef,
                                $pos->(199.3)
                            ),
                            $pos->(199.1)
                        )
                    );
                }
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => do {
                                    my ( $gather_status, $gather_ret ) =
                                      gather(
                                        $f, $scope,
                                        sub {
                                            my ( $scope, $take, $ret_func ) =
                                              @_;
                                            {
                                                my ( $loop_status, $loop_ret )
                                                  = iterate(
                                                    $f, $scope,
                                                    range(
                                                        $scope,
                                                        $pos->(200.45),
                                                        num( $f, "1" ),
                                                        $$scope->{'dimension'}
                                                    ),
                                                    'i',
                                                    sub {
                                                        my ( $scope, $ret_func )
                                                          = @_;
                                                        $take->(
                                                            num( $f, "0" ) );
                                                    },
                                                    $pos->(200.25)
                                                  );
                                                return $ret_func->($loop_ret)
                                                  if $loop_status eq 'return';
                                            }
                                        }
                                      );
                                    return $ret_func->($gather_ret)
                                      if $gather_status eq 'return';
                                    $gather_ret;
                                  }
                            ]
                        ],
                        $scope,
                        undef,
                        $pos->(200.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'axisUnitVector' definition
        my $func_28 = method_event_def(
            $f, $scope,
            'axisUnitVector',
            [
                {
                    name     => 'dimension',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'axis',
                    type     => 'VectorAxis',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'dimension', 205.2 )
                  || return $ret_func->();
                need( $scope, $args, 'axis', 206.2 ) || return $ret_func->();
                if (
                    bool(
                        less(
                            $scope, $pos->(207.3),
                            $$scope->{'dimension'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str( $f, "Need dimension >= 1D" )
                                ],
                                $scope, undef,
                                $pos->(208.3)
                            ),
                            $pos->(208.1)
                        )
                    );
                }
                var(
                    $scope,
                    items => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $pos->(209.35),
                                            num( $f, "1" ),
                                            $$scope->{'dimension'}
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            if (
                                                bool(
                                                    equal(
                                                        $scope,
                                                        $pos->(210.3),
                                                        $$scope->{'i'},
                                                        $$scope->{'axis'}
                                                    )
                                                )
                                              )
                                            {
                                                my $scope =
                                                  Ferret::Scope->new( $f,
                                                    parent => $scope );

                                                $take->( num( $f, "1" ) );
                                                return 'next';
                                            }
                                            $take->( num( $f, "0" ) );
                                        },
                                        $pos->(209.15)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(209.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(216.3)
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            dimension => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_2->inside_scope(
            dimensionHR => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            magnitude => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            unitVector => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_6->inside_scope(
            axisUnitVector => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope( x => $scope, $proto, $class, $ins, 1, undef );
        $func_8->inside_scope( y => $scope, $proto, $class, $ins, 1, undef );
        $func_9->inside_scope( z => $scope, $proto, $class, $ins, 1, undef );
        $func_10->inside_scope(
            direction => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_11->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_15->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_16->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_17->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_18->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_19->inside_scope(
            dot => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_20->inside_scope(
            cross => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_21->inside_scope(
            angleBetween => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_22->inside_scope(
            orthogonalTo => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_23->inside_scope(
            parallelTo => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_24->inside_scope(
            getValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_25->inside_scope(
            copy => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_26->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_27->inside_scope(
            zeroVector => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_28->inside_scope(
            axisUnitVector => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_29->inside_scope(
            _axisToNumber => $scope,
            $scope, $class, $ins, undef, undef
        );
        typedef(
            $scope, $class,
            'VectorAxis',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            do {
                                $ins = $transform->(
                                    $$scope->{'_axisToNumber'}->(
                                        [$ins], $scope, undef, $pos->(230.3)
                                    ),
                                    $ins
                                );
                              }
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    load_namespaces( $context, $file_name,
        qw(Char Error Math Num Vector VectorAxis) );
};

after_content($file_name);
