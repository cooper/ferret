# Number

This is the Number class.

A number is a basic datatype for an arithmetical value which represents a
particular quantity. Numbers are useful for counting things and for
performing mathematical calculations.

This class encompasses all sorts of
[real numbers](https://en.wikipedia.org/wiki/Real_number), including integers
and inexact floating-point values in the native architecture's
double-precision representation; as well as the more abstract concepts of
[infinity](#inf) and [NaN](#nan).

The Number class is only concerned with real numbers, but Ferret has native
support for complex numbers as well through the [Complex](Complex.md) class.



## Methods

### even

```
$number.even
```

Property. Boolean evenness of the number.



### odd

```
$number.odd
```

Property. Boolean oddness of the number.



### round

```
$number.round
```

Property. Nearest integer to the number.
Examples: `3.5` -> `4`, `3.4` -> `3`.



### ceil

```
$number.ceil
```

Property. Smallest integer that is greater than or equal to the number.
Example: `3.001.ceil` -> `4`.



### floor

```
$number.floor
```

Property. Greatest integer less than or equal to the number.
Example: `3.999` -> `3`.



### square

```
$number.square
```

Property. Square of the number (`n ^ 2`).
Example: `2.square` -> `4`.



### sqrt

```
$number.sqrt
```

Property. Square root of the number (`n ^ (1/2)`).
Returns a complex number if `n < 0`.
Example: `4.sqrt` -> `2`.



### cbrt

```
$number.cbrt
```

Property. Cube root of the number (`n ^ (1/3)`).
Example: `8.cbrt` -> `2`.



### root

```
$number.root($root: Num)
```

Mth root of the number N (`N ^ (1/M)`).
Returns a complex number if `M` is even and `N < 0`.
Example: `8.root(3)` -> `2`.


* __root__: [Num](/doc/std/Number.md) - Root. For example, `3` is the cube root.



### factorial

```
$number.factorial()
```

The number's factorial (`n!`). This can also be written `n!` because
"calling" a number yields its factorial. Non-integers are transformed with
`.floor`.

## Class properties

### Inf

```
Number.Inf
```

Infinity. Alias `Inf` exists in the global context.

### NaN

```
Number.NaN
```

Not a number. Alias `NaN` exists in the global context.

## Type interfaces

### Even

An interface to which only even numbers conform.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Num](/doc/std/Number.md).
2. __satisfies__: The number is even according to `.even`.


### Odd

An interface to which only odd numbers conform.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Num](/doc/std/Number.md).
2. __satisfies__: The number is odd according to `.odd`.


### Integer

This interface promises an integer value, returning the `.floor` property
of floating-point numbers. Alias `Int` exists in the global context.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Num](/doc/std/Number.md).
2. __transform__: The number is truncated to its `.floor` value.


End of the Number class.

This file was generated automatically by the Ferret compiler from
Number.frtdoc.