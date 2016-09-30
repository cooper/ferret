# Number

This is the Number class.

A number is a basic datatype for an arithmetical value which represents a
particular quantity. Numbers are useful for counting things and for
performing mathematical calculations.

This class encompasses all sorts of
[real numbers](https://en.wikipedia.org/wiki/Real_number), including integers
and inexact floating-point values in the native architecture's
double-precision representation; as well as the
abstract concepts of [infinity](#inf) and [NaN](#nan).



## Methods

### even

```
$number.even
```

Once-computed property. Boolean evenness of the number.



### odd

```
$number.odd
```

Once-computed property. Boolean oddness of the number.



### round

```
$number.round
```

Computed property. The nearest integer to the number.



### ceil

```
$number.ceil
```

Computed property. The smallest integer that is greater than or equal to the number.



### floor

```
$number.floor
```

Computed property. The greatest integer less than or equal to the number.



### square

```
$number.square
```

Computed property. The square of the number (`n ^ 2`).



### sqrt

```
$number.sqrt
```

Computed property. The square root of the number (`n ^ (1/2)`).



### cbrt

```
$number.cbrt
```

Computed property. The cube root of the number (`n ^ (1/3)`).



### root

```
$number.root($root: Num)
```

Returns the Nth root of the number.


#### Arguments

* __root__: [Number](/std/doc/Number.md) - The root. For example, `3` is the cube root.


## Class functions

### sum

```
Number.sum($nums: Num...)
```

Returns the sum of the provided numbers.


#### Arguments

* __nums__: [Number](/std/doc/Number.md)... - Variable number of arguments. A group of numbers.



### product

```
Number.product($nums: Num...)
```

Returns the product of the provied numbers.


#### Arguments

* __nums__: [Number](/std/doc/Number.md)... - Variable number of arguments. A group of numbers.



### min

```
Number.min($nums: Num...)
```

Returns the smallest of the provided numbers.


#### Arguments

* __nums__: [Number](/std/doc/Number.md)... - Variable number of arguments. A group of numbers.



### max

```
Number.max($nums: Num...)
```

Returns the greatest of the provided numbers.


#### Arguments

* __nums__: [Number](/std/doc/Number.md)... - Variable number of arguments. A group of numbers.



## Class properties


### inf

```
Number.inf
```

The constant infinity.

### nan

```
Number.nan
```

The constant NaN value (not a number).

## Type interfaces

### Even

An interface to which only even numbers conform.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [Number](/std/doc/Number.md).
2. __satisfies__: The number is even (`.even`).


### Odd

An interface to which only odd numbers conform.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [Number](/std/doc/Number.md).
2. __satisfies__: The number is odd (`.odd`).


### Integer

An interface which truncates floating point numbers to integers.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [Number](/std/doc/Number.md).
2. __transform__: The number is truncated to its `.floor` value.


End of Number class.

This file was generated automatically by the Ferret compiler from
[Number.frtdoc](../Number.frtdoc).