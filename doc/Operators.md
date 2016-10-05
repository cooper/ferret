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

Separates key:value pairs. If it follows a bareword immediately (without
whitespace in between), it is assumed that the bareword is the key for an object
or hash pair.

Tokenized as `OP_VALUE`.

    $object = (key: "value", other: "another")

The symbol data type (e.g. `:sym`) is tokenized separately as `VAR_SYM`; see
[Symbols](https://github.com/cooper/ferret/blob/master/doc/Variables.md#symbols).

### Property operator

    .

Accesses a property on an object.

Tokenized as `OP_PROP`.

Bareword properties such as `.propName`, including the period (`.`), are
tokenized as a single `PROPERTY` token. For non-barewords, `OP_PROP` is used.
This allows property names to be evaluated at runtime. The same example would
be written like so: `.["propName"]`.

    $value = $object.someValue

### Assignment operator

    =

Separates an assignable expression from its new value. At its left must be an
assignable variable, property, or other type of lvalue.

Tokenized as `OP_ASSIGN`.

    $x = 1

See also
* `?=` [`OP_LASSIGN`](#lazy-assignment-operator) - lazy assignment
* `+=` [`OP_ADD_A`](#altering-addition-operator) - addition assignment
* `-=` [`OP_SUB_A`](#altering-subtraction-operator) - subtraction assignment
* `*=` [`OP_MUL_A`](#altering-multiplication-operator) - multiplication assignment
* `/=` [`OP_DIV_A`](#altering-division-operator) - division assignment

### Lazy assignment operator

    ?=

Separates an assignable expression from its lazy-computed value. At its left
must be an assignable variable, property, or other type of lvalue.

Lazy assignment allows the evaluation of a property or variable's value to be
deferred until it is referenced somewhere. This is useful for decreasing load
time when it is unknown whether a value will ever be used in the particular
program.

Tokenized as `OP_LASSIGN`.

    $x ?= doSomething()
    # doSomething will not be called until $x is accessed below

    $y = $x
    # now $x and $y have the semi-permanent value returned by doSomething()

See also [`OP_ASSIGN`](#assignment-operator).

### Return operator

    ->

Adds a named value to the return object of a function.

All functions, methods, and callbacks start with an empty return object. This is
useful for returning multiple values, especially if the routine is extensible
through user-defined event callbacks which may find use in returning values. The
return object is represented by the
[special variable](Variables.md#special-variables) `*return`.

This operator, in the form of `propName -> $value`, provides a more appealing
syntax for the functionally equivalent `*return.propName = $value`.

Additionally, it can be used in place of the [`return`](Keywords.md#return)
keyword in the form `-> $returnValue`. This is only valid when exactly one
value is returned.

Tokenized as `OP_RETURN`.

    func addOneToEach {
        need $x: Num, $y: Num
        newX -> $x + 1
        newY -> $y + 1
    }

    addOneToEach(5, 10)  # returns (newX: 6, newY: 11)

See also the [`return`](Keywords.md#return) keyword.

### Namespace operator

    ::

Separates namespace symbols.

Tokenized as `OP_PACK`.

    $origin = Math::Point(0, 0)

### Inline if operator

    ?

Indicates that a value may not be present and ignores the entire current
instruction in such a case.

This operator is especially useful when the presence of a value is unknown, but
the use of `if` would be repetitive.

Tokenized as `OP_MAYBE`.

    if $x:
        doSomethingWith($x)

    # is better written
    doSomethingWith($x?)

Frequent use case involving named handlers

    # if there is nothing at $handlers[$command], nothing happens.
    # if there is, it is called.
    $handlers[$command]?()

    # this is functionally equivalent to
    if $handlers[$command]:
        $handlers[$command]()

See also the [`prop?`](Keywords.md#prop) keyword and the
[lazy assignment operator](#lazy-assignment-operator) (`?=`).

### Ellipsis

    ...

Indicates that a function argument should consume the remainder of the passed
values. When specified, a function has a variable number of unnamed arguments.

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



## Logic

### Logical AND operator

    &&

True if two or more values evaluate to boolean true.

Tokenized as `OP_AND`.

    $true  = true && 1
    $false = true && true && false

### Logical OR operator

    ||

True if at least one of two or more values evaluates to boolean true.

Tokenized as `OP_OR`.

    $true  = false || 1
    $false = false || undefined || 2.odd

### Logical NOT operator

    !

Negates a value to its boolean opposite.

Tokenized as `OP_NOT`.

    $false = !true



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

Adds values.

    $three = 2 + 1

### Positivity operator

    +

Indicates that a value is positive.

Tokenized as `OP_SADD`.

    $one = +1

### Subtraction operator

    -

Subtracts values.

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

Multiplies values.

Tokenized as `OP_MUL`.

```
$ten = 5 * 2
```

### Division operator

    /

Divides values.

Tokenized as `OP_DIV`.

    $twenty = 100 / 5

### Exponent operator

    ^

Takes a value to the power of another.

Tokenized as `OP_POW`.

    $eight = 2 ^ 3

### Altering addition operator

    +=

Alters a value by adding a value to it. At its left must be an assignable
variable, property, or other type of lvalue.

Tokenized as `OP_ADD_A`.

    $x = 1
    $x += 4
    # $x is now five

### Altering subtraction operator

    -=

Alters a value by subtracting a value from it. At its left must be an assignable
variable, property, or other type of lvalue.

Tokenized as `OP_SUB_A`.

    $x = 5
    $x -= 1
    # $x is now four

### Altering multiplication operator

```
*=
```

Alters a value by multiplying it by a value. At its left must be an assignable
variable, property, or other type of lvalue.

Tokenized as `OP_MUL_A`.

```
$x = 4
$x *= 5
# $x is now 20
```

### Altering division operator

    /=

Alters a value by dividing it by a value. At its left must be an assignable
variable, property, or other type of lvalue.

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

Returns a set representing a range from a value to a value. If the first value
is larger than the second, the items in the set will be in descending order.

Tokenized as `OP_RANGE`.

    $set = 1..5 # $set is <Number>(1, 2, 3, 4, 5)
    $set = 5..1 # $set is <Number>(5, 4, 3, 2, 1)

## Equality, inequality, and similarity

### Equality operator

    ==

Tests the logical equivalence of two or more values. The result is dependent
on the combination of data types and their equality method implementations.

Tokenized as `OP_EQUAL`.

      10 == 10          # true
    "hi" == "hi"        # true
       1 == 1.0 == 1.1  # false

### Reference equality operator

    ===

Tests the memory address equivalence of two or more values.

Tokenized as `OP_EQUAL_I`.

     "hi" === "hi"              # false
    false === false             # true
     true === true === false    # false

### Similarity operator

    =~

Tests the logical similarity of two or more values. The result is dependent
on the combination of data types and their similarity method implementations.

Tokenized as `OP_SIM`.

    "hi" =~ /^h/    # true
    "hi" =~ /k/     # false

### Negated equality operator

    !=

Tests the logical inequivalence of two or more values. The result is dependent
on the combination of data types and their equality method implementations.

Tokenized as `OP_NEQUAL`.

    1 != 2  # true
    0 != 0  # false

### Negated reference equality operator

    !==

Tests the memory address inequivalence of two or more values.

Tokenized as `OP_NEQUAL_I`.

    false !== true  # true
     "hi" !== "hi"  # true
     true !== true  # false

### Negated similarity operator

    !~

Tests the logical dissimilarity of two or more values. The result is dependent
on the combination of data types and their similarity method implementations.

Tokenized as `OP_NSIM`.

    "hi" !~ /^h/    # false
    "hi" !~ /k/     # true

### Less than operator

    <

Tests if the value of left operand is less than the value of right.

Tokenized as `OP_LESS`.

    1 < 2   # true
    6 < 5   # false

### Less than or equal to operator

    <=

Tests if the value of left operand is [less than](#less-than-operator) or
[equal to](#equality-operator) the value of right.

Tokenized as `OP_LESS_E`.

    1 <= 2  # true
    1 <= 1  # true
    6 <= 5  # false

### Greater than operator

    >

Tests if the value of left operand is greater than the value of right.

Tokenized as `OP_GR8R`.

    1 > 2   # false
    6 > 5   # true

### Greater than or equal to operator

    >=

Tests if the value of left operand is [greater than](#greater-than-operator) or
[equal to](#equality-operator) the value of right.

Tokenized as `OP_GR8R_E`.

    1 >= 2  # false
    1 >= 1  # true
    6 >= 5  # true
