# Operators

This documentation explains the uses of all operators.



## General

### Semicolon

    ;

Terminates an instruction. The semicolon is optional and can be inferred
in most cases, depending on which type of token terminates a line.

Tokenized as `OP_SEMI`.

    doSomething(); doSomethingElse()

### Comma

    ,

Separates list items.

Tokenized as `OP_COMMA`.

    (1, 2, 3)

### Colon

    :

Separates key:value pairs.

Tokenized as `OP_VALUE`.

    $object = (key: "value", other: "another")

### Not operator

    !

Negates a value to its boolean opposite.

Tokenized as `OP_NOT`.

    $false = !true

### Property operator

    .

Accesses a property on an object.

Tokenized as `OP_PROP`.

    $value = $object.someValue

### Assignment operator

    =

Separates an assignable expression from its new value.

Tokenized as `OP_ASSIGN`.

    $x = 1

### Return operator

    ->

Adds a named value to the return object of a function.

Tokenized as `OP_RETURN`.

    func addOneToEach {
        need $x: Num, $y: Num
        newX -> $x + 1
        newY -> $y + 1
    }

    addOneToEach(5, 10)  # returns (newX: 6, newY: 11)

### Namespace operator

    ::

Separates namespace symbols.

Tokenized as `OP_PACK`.

    $origin = Math::Point(0, 0)

### Inline if operator

    ?

Indicates that a value may not be present, ignoring the entire current
instruction in such a case.

Tokenized as `OP_MAYBE`.

    # if there is nothing at $handlers[$command], nothing happens.
    # if there is, it is called.
    $handlers[$command]?()

    # this is functionally equivalent to
    if $handlers[$command]:
        $handlers[$command]()

### Ellipsis

    ...

Indicates that a function argument should consume the remainder of the passed
values.

Tokenized as `OP_ELLIP`.

    func getSum {
        need $nums: Num...
        return $nums.toSet().sum()
    }

    getSum(1, 2, 3, 4, 5)   # 15

### Zero-argument call operator

    !

Calls a function with no arguments.

Tokenized as `OP_CALL`.

    someFunction!

    # equivalent to
    someFunction()



## Math

The absolute order of math operations is as follows:

* Positivity `+`
* Negativity `-`
* Range `..`
* Power `^`
* Modulus `%`
* Multiplication `*`
* Division `/`
* Subtraction `-`
* Addition `+`

### Addition operator

    +

Tokenized as `OP_ADD`.

Adds two values.

    $three = 2 + 1

### Positivity operator

    +

Indicates that a value is positive.

Tokenized as `OP_SADD`.

    $one = +1

### Subtraction operator

    -

Subtracts two values.

Tokenized as `OP_SUB`.

    $five = 6 - 1

### Negation operator

    -

Indicates that a value is negative.

Tokenized as `OP_SSUB`.

    $negativeOne = -1

### Multiplication operator

```
*
```

Multiplies two values.

Tokenized as `OP_MUL`.

```
$ten = 5 * 2
```

### Division operator

    /

Divides two values.

Tokenized as `OP_DIV`.

    $twenty = 100 / 5

### Exponent operator

    ^

Takes a value to the power of another.

Tokenized as `OP_POW`.

    $eight = 2 ^ 3

### Altering addition operator

    +=

Alters a value by adding a value to it.

Tokenized as `OP_ADD_A`.

    $x = 1
    $x += 4
    # $x is now five

### Altering subtraction operator

    -=

Alters a value by subtracting a value from it.

Tokenized as `OP_SUB_A`.

    $x = 5
    $x -= 1
    # $x is now four

### Altering multiplication operator

```
*=
```

Alters a value by multiplying it by a value.

Tokenized as `OP_MUL_A`.

```
$x = 4
$x *= 5
# $x is now 20
```

### Altering division operator

    /=

Alters a value by dividing it by a value.

Tokenized as `OP_DIV_A`.

    $x = 100
    $x /= 4
    # $x is now 25

### Modulus operator

    %

Returns the remainder from the division of two values.

Tokenized as `OP_MOD`.

    47 % 7  # 0
    17 % 2  # 1

### Range operator

    ..

Returns a set representing a range from a value to a value.

Tokenized as `OP_RANGE`.

    $set = 1..5
    # $set is <Number>(1, 2, 3, 4, 5)

## Equality and inequality

### Equality operator

    ==

Tests the logical equivalence of two values.

Tokenized as `OP_EQUAL`.

      10 == 10      # true
    "hi" == "hi"    # true

### Reference equality operator

    ===

Tests the memory address equivalence of two values.

Tokenized as `OP_EQUAL_I`.

     "hi" === "hi"      # false
    false === false     # true

### Negated equality operator

    !=

Tests the logical inequivalence of two values.

Tokenized as `OP_NEQUAL`.

    1 != 2  # true
    0 != 0  # false

### Negated reference equality operator

    !==

Tests the memory address inequivalence of two values.

Tokenized as `OP_NEQUAL_I`.

    false !== true  # true
     "hi" !== "hi"  # true
     true !== true  # false
