# Operators

This documentation explains the uses of all operators.



## General

### Semicolon

    ;

Terminates an instruction. The semicolon is optional and can be inferred
in most cases, depending on which type of token terminates a line.

Tokenized as `OP_SEMI`.

### Comma

    ,

Separates list items.

Tokenized as `OP_COMMA`.

### Colon

    :

Separates key:value pairs.

Tokenized as `OP_VALUE`.

### Not operator

    !

Negates a value to its boolean opposite.

Tokenized as `OP_NOT`.

### Property operator

    .

Accesses a property on an object.

Tokenized as `OP_PROP`.

### Assignment operator

    =

Separates an assignable expression from its new value.

Tokenized as `OP_ASSIGN`.

### Return operator

    ->

Adds a named value to the return object of a function.

Tokenized as `OP_RETURN`.

### Namespace operator

    ::

Separates namespace symbols.

Tokenized as `OP_PACK`.

### Inline if operator

    ?

Indicates that a value may not be present, ignoring the entire current
instruction in such a case.

Tokenized as `OP_MAYBE`.

### Ellipsis

    ...

Indicates that a function argument should consume the remainder of the passed
values.

Tokenized as `OP_ELLIP`.

### Zero-argument call operator

    !

Calls a function with no arguments.

Tokenized as `OP_CALL`.



## Math

### Addition operator

    +

Tokenized as `OP_ADD`.

Adds two values.

### Positivity operator

    +

Tokenized as `OP_SADD`.

Indicates that a value is positive.

### Subtraction operator

    -

Subtracts two values.

Tokenized as `OP_SUB`.

### Negation operator

    -

Indicates that a value is negative.

Tokenized as `OP_SSUB`.

### Multiplication operator

    *

Multiplies two values.

Tokenized as `OP_MUL`.

### Division operator

    /

Divides two values.

Tokenized as `OP_DIV`.

### Exponent operator

    ^

Takes a value to the power of another.

Tokenized as `OP_POW`.

### Altering addition operator

    +=

Alters a value by adding a value to it.

Tokenized as `OP_ADD_A`.

### Altering subtraction operator

    -=

Alters a value by subtracting a value from it.

Tokenized as `OP_SUB_A`.

### Altering multiplication operator

    \*=

Alters a value by multiplying it by a value.

Tokenized as `OP_MUL_A`.

### Altering division operator

    /=

Alters a value by dividing it by a value.

Tokenized as `OP_DIV_A`.

### Modulus operator

    %

Returns the remainder from the division of two values.

Tokenized as `OP_MOD`.

### Range operator

    ..

Returns a set representing a range from a value to a value.

Tokenized as `OP_RANGE`.



## Equality and inequality

### Equality operator

    ==

Tests the logical equivalence of two values.

Tokenized as `OP_EQUAL`.

### Reference equality operator

    ===

Tests the memory address equivalence of two values.

Tokenized as `OP_EQUAL_I`.

### Negated equality operator

    !=

Tests the logical inequivalence of two values.

Tokenized as `OP_NEQUAL`.

### Negated reference equality operator

    !==

Tests the memory address inequivalence of two values.

Tokenized as `OP_NEQUAL_I`.
