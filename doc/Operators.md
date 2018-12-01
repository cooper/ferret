# Operators

This documentation explains the uses of all operators.



## General

### Semicolon

    ;

Terminates an instruction. The semicolon is optional and can be inferred
in most cases, depending on which type of token terminates a line.

    doSomething(); doSomethingElse()

Tokenized as `OP_SEMI`.

### Comma

    ,

Separates function arguments and collection entries.

```
myFunc(1, 2, 3)
```
```
$myList = [1, 2, 3]
```

Tokenized as `OP_COMMA`.

### Colon

    :

Separates key-value pairs.

If it follows a bareword immediately (without whitespace in between), it is
assumed that the bareword is the key for an object or hash pair and is tokenized
as `PROP_VALUE`.

    $object = (key: "value", other: "another")

Any other expression can precede it, in which case it is tokenized as
`OP_VALUE`.

    $object = ("key": "value", "other": "another")

The symbol data type (e.g. `:sym`) is tokenized separately as `VAR_SYM`; see
[Symbols](https://github.com/cooper/ferret/blob/master/doc/Variables.md#symbols).

Tokenized as `PROP_VALUE` or `OP_VALUE`.

### Property operator

    .

Accesses a property on an object.

Bareword properties such as `.propName`, including the period (`.`), are
tokenized as a single `PROPERTY` token.

    $value = $object.propName

For non-barewords, `OP_PROP` is used and must be followed by an expression
delimited in square brackets `[` and `]`. This allows property names to be
evaluated at runtime.

    $prop  = "propName"
    $value = $object.[$prop]    # note: NOT the same as $object[$prop]

Tokenized as `PROPERTY` or `OP_PROP`.

### Assignment operator

    =

Separates an assignable expression from its new value. At its left must be an
assignable variable, property, index, or other type of lvalue.

```
$x = 1
```
```
$object.property = "hello"
```
```
$list[0] = "world"
```

Tokenized as `OP_ASSIGN`.

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

    $x ?= doSomething()
    # doSomething will not be called until $x is accessed below

    $y = $x
    # now $x and $y have the semi-permanent value returned by doSomething()

Tokenized as `OP_LASSIGN`.

See also [`OP_ASSIGN`](#assignment-operator).

### Return operator

    ->

The return operator does three things:

1. With a bareword to its left and expression at right, adds a named value
   to the [return object](Functions.md#return-objects)
   of the function but allows execution to continue.
2. With nothing to its left and an expression at right, overrides the return
   object with the specified single return value and stops execution of the
   function.
3. All by itself, as a standalone instruction, stops execution of the
   function, yielding the return object in its current state.

All functions, methods, and callbacks start with an empty
[return object](Functions.md#return-objects). This is
useful for returning multiple values, especially if the routine is extensible
through user-defined event callbacks which may find use in returning values.


__Case 1__ - Within the body of the function, the return object is represented by
the [special variable](Variables.md#special-variables) `*return`, but rarely
should you need to access it that way because of the convenient syntax provided
by this operator. The return operator, in the form of `propName -> $value`,
provides a more appealing syntax for the functionally equivalent
`*return.propName = $value`.

    func addOneToEach {
        need $x: Num, $y: Num
        newX -> $x + 1
        newY -> $y + 1
    }

    addOneToEach(5, 10)  # returns (newX: 6, newY: 11)

__Case 2__ -  The return operator can be used in place of the return keyword
that exists in many other languages, like so: `-> $returnValue`. Ferret has
no return keyword. Consider the following one-liner as an example:

    [1,2,3].map! { -> $_ * 2 }      # [2, 4, 6]

Note that When used within an event callback, it is possible that the provided
value will not ultimately be returned by the event call. If multiple callbacks
have an explicit `->` statement, the value of the lattermost statement is used.

```
func simple {
    -> "t"
}

func complex {
    want $x: Num
    if $x {
        gotX  -> true
        value -> $x
        ->
    }
    -> "reached bottom"
}

simple()    # returns "t"
complex(5)  # returns (gotX: true, value: 5)
complex()   # returns "reached bottom"
```

__Case 3__ - The return operator can stop execution of the function without
providing a value. In this case, the functions yields the
[return object](Functions.md#return-objects), NOT a void value.

    func calculate {
        
        # in progress already, so return!
        if $alreadyCalculating
            ->

        # continue...
    }

Tokenized as `OP_RETURN`.

### Namespace separator

    ::

Separates namespace symbols.

Since contexts and classes are simple objects, this is functionally equivalent
to the [property operator](#property-operator), except that autoloading is also
considered.

When accessing classes, contexts, and interfaces, you should always use `::`
(rather than `.`) so that the compiler knows which files to include. In the
below example, the compiled code automatically includes the `Math::Point` class.

    $intercept = Math::Point(1, 0)

For shared variables (which, by convention, have lowercase names), use the
normal `.` accessor.

    $origin = Math::Point.origin

Tokenized as `OP_PACK`.

### Inline if operator

    ?

Indicates that a value may not be present and ignores the entire current
instruction in such a case.

This operator is especially useful when the presence of a value is unknown, but
the use of `if` would be repetitive.

    if $x
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

Tokenized as `OP_MAYBE`.

See also the [`prop?`](Keywords.md#prop) keyword and the
[lazy assignment operator](#lazy-assignment-operator) (`?=`).

### Ellipsis

    ...

Indicates that a function argument should consume the remainder of the passed
values. When specified, a function can be called with a variable number of
arguments which will be passed to the implementation as a list.

    func getSum {
        need $nums: Num...
        -> $nums.sum
    }

    getSum(1, 2, 3, 4, 5)   # 15

The ellipsis can be preceded by any number of regular named arguments.

    func party {
        need $day: Str, $people: Str...
        say("On $day, we are throwing a party. $people.length are coming:")
        for $name in $people
            say("    $name")
    }

    party(
        "Saturday",
        "Shirley", "Shelly",
        "Sherry", "Cheryl",
        "Sheila", "Chanel",
        "Shannon", "Shania"
    )

If the ellipsis argument is a [`need`](Keywords.md#need) as in the above
examples, the function argument requirements will only be satisfied if at least
one unnamed argument matches. If it is instead a [`want`](Keywords.md#want), the
ellipsis argument will yield an empty list in the case that no unnamed arguments
match. In any case, it is guaranteed that the ellipsis argument yields a list.

    func party {
        need $day: Str
        want $people: Str...
        if $people.empty
            say("No one RSVP'd for $day; we'll have to reschedule")
        else
            say("$people.length people are coming to our party $day")
    }

    party("Friday") # satisfies the function, with $people empty list []

Passing the ellipsis argument as a list is also possible, but to prevent
unexpected results when working with lists, the argument name must be explicit:

    $list = ["Frank", "Monica", "Fiona", "Jimmy", "Kev", "Veronica"]
    party("Friday", people: $list)      # ok
    party("Friday", $list)              # NOT ok (type mismatch List != Str)

Tokenized as `OP_ELLIP`.

### Zero-argument call operator

    !

Calls a function with no arguments.

    someFunction!

    # equivalent to
    someFunction()

Tokenized as `OP_CALL`.

See also the [factorial operator](#factorial-operator).

## Logic

### Logical AND operator

    &&

True if two or more values evaluate to boolean true.

    $true  = true && 1
    $false = true && true && false

Tokenized as `OP_AND`.

### Logical OR operator

    ||

True if at least one of two or more values evaluates to boolean true.

    $true  = false || 1
    $false = false || undefined || 2.odd

Tokenized as `OP_OR`.

### Logical NOT operator

    !

Negates a value to its boolean opposite.

    $false = !true

Tokenized as `OP_NOT`.

## Math

The absolute order of math operation precedence is as follows:

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

Adds values.

    $three = 2 + 1

Tokenized as `OP_ADD`.

### Positivity operator

    +

Indicates that a value is positive.

    $one = +1

Tokenized as `OP_SADD`.

### Subtraction operator

    -

Subtracts values.

    $five = 6 - 1

Tokenized as `OP_SUB`.

### Negation operator

    -

Indicates that a value is negative.

    $negativeOne = -1

Tokenized as `OP_SSUB`.

### Multiplication operator

```
*
```

Multiplies values.

```
$ten = 5 * 2
```

Tokenized as `OP_MUL`.

### Division operator

    /

Divides values.

    $twenty = 100 / 5

Tokenized as `OP_DIV`.

### Exponent operator

    ^

Takes a value to the power of another.

    $eight = 2 ^ 3

Tokenized as `OP_POW`.

### Altering addition operator

    +=

Alters a value by adding a value to it. At its left must be an assignable
variable, property, index, or other type of lvalue.

    $x = 1
    $x += 4
    # $x is now five

Tokenized as `OP_ADD_A`.

### Altering subtraction operator

    -=

Alters a value by subtracting a value from it. At its left must be an assignable
variable, property, index, or other type of lvalue.

    $x = 5
    $x -= 1
    # $x is now four

Tokenized as `OP_SUB_A`.

### Altering multiplication operator

```
*=
```

Alters a value by multiplying it by a value. At its left must be an assignable
variable, property, index, or other type of lvalue.

```
$x = 4
$x *= 5
# $x is now 20
```

Tokenized as `OP_MUL_A`.

### Altering division operator

    /=

Alters a value by dividing it by a value. At its left must be an assignable
variable, property, index, or other type of lvalue.

    $x = 100
    $x /= 4
    # $x is now 25

Tokenized as `OP_DIV_A`.

### Modulus operator

    %

Returns the remainder from the division of two values.

    47 % 7  # 0
    17 % 2  # 1

Tokenized as `OP_MOD`.

### Range operator

    ..

Returns a list representing a range from a value to a value. If the first value
is larger than the second, the items in the set will be in descending order.

    $nums = 1..5    # [1, 2, 3, 4, 5]
    $nums = 5..1    # [5, 4, 3, 2, 1]

Tokenized as `OP_RANGE`.

### Factorial operator

    !

Returns the factorial of the integer before it.

This is not truly a math operator but rather the
[zero-argument call operator](#zero-argument-call-operator). Calling a integer
returns its factorial. Calling a non-integer Number returns the factorial of its
`.floor`.

    $f = 4!         # 24
    $f = 4.9999!    # also 24

Tokenized as `OP_CALL`.

## Equality, inequality, and similarity

### Equality operator

    ==

Tests the logical equivalence of two or more values.

      10 == 10          # true
    "hi" == "hi"        # true
       1 == 1.0 == 1.1  # false

Tokenized as `OP_EQUAL`.

### Reference equality operator

    ===

Tests the memory address equivalence of two or more values.

     "hi" === "hi"              # false
    false === false             # true
     true === true === false    # false

Tokenized as `OP_EQUAL_I`.

### Similarity operator

    =~

Tests the logical similarity of two or more values.

    "hi" =~ /^h/    # true
    "hi" =~ /k/     # false

Tokenized as `OP_SIM`.

### Negated equality operator

    !=

Tests the logical inequivalence of two or more values.

    1 != 2  # true
    0 != 0  # false

Tokenized as `OP_NEQUAL`.

### Negated reference equality operator

    !==

Tests the memory address inequivalence of two or more values.

    false !== true  # true
     "hi" !== "hi"  # true
     true !== true  # false

 Tokenized as `OP_NEQUAL_I`.

### Negated similarity operator

    !~

Tests the logical dissimilarity of two or more values.

    "hi" !~ /^h/    # false
    "hi" !~ /k/     # true

Tokenized as `OP_NSIM`.

### Less than operator

    <

Tests if the value of left operand is less than the value of right.

    1 < 2   # true
    6 < 5   # false

Tokenized as `OP_LESS`.

### Less than or equal to operator

    <=

Tests if the value of left operand is [less than](#less-than-operator) or
[equal to](#equality-operator) the value of right.

    1 <= 2  # true
    1 <= 1  # true
    6 <= 5  # false

Tokenized as `OP_LESS_E`.

### Greater than operator

    >

Tests if the value of left operand is greater than the value of right.

    1 > 2   # false
    6 > 5   # true

Tokenized as `OP_GR8R`.

### Greater than or equal to operator

    >=

Tests if the value of left operand is [greater than](#greater-than-operator) or
[equal to](#equality-operator) the value of right.

    1 >= 2  # false
    1 >= 1  # true
    6 >= 5  # true

Tokenized as `OP_GR8R_E`.
