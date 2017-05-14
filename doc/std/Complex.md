# Complex

This is the Complex class version 1.0.

Represents a complex number.

Ferret has native support for complex numbers, including syntax for the
normal mathematic notation in rectangular form `a + bi`, where `a` and `b`
are [real numbers](Number.md) and `i` is the
[imaginary unit](https://en.wikipedia.org/wiki/Imaginary_unit).
`a` and `b` are commonly called the "real part" and "imaginary part"
respectively, despite both being [real numbers](Number.md).

Complex numbers can also be constructed from a polar representations
`r(cosθ + isinθ)` or `re^(iθ)` with [`Complex.polar()`](#polar).


## Initializer

```
$z = Complex($r: Num, $θ: Num)
```

Create a complex number in polar form given radius `r` and angle `θ`.

`z = r(cosθ + isinθ)`.


### Arguments

* __r__: [Num](/doc/std/Number.md) - Distance from the origin in the complex plane.

* __θ__: [Num](/doc/std/Number.md) - Angle between the positive real axis and the.

## Methods

### abs

```
$z.abs
```

Computed property. [Absolute value](https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers)
(or modulus) of the complex number. This is distance from the origin on the
[complex plane](https://en.wikipedia.org/wiki/Complex_plane).

In polar form, this is `r`.



### arg

```
$z.arg
```

Computed property. [Argument](https://en.wikipedia.org/wiki/Argument_(complex_analysis)) of
the complex number. On the
[complex plane](https://en.wikipedia.org/wiki/Complex_plane), this is the
angle `θ` between the positive real axis and the position vector.

In polar form, this is `θ`.



### conj

```
$z.conj
```

Computed property. [Conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) of the complex
number.



### sqrt

```
$z.sqrt
```

Computed property. [Square root](https://math.stackexchange.com/a/44500) of the complex number.



### root

```
$z.root($n: Num)
```

Nth root of the complex number.


#### Arguments

* __n__: [Num](/doc/std/Number.md)  



### Addition operator (+)

```
$z + ($rhs: Complex)
```

Addition of complex numbers.





### Addition operator (+)

```
$z + ($ehs: Num)
```

Addition of complex and real numbers.





### Subtraction operator (-)

```
$z - ($rhs: Complex)
```

Subtraction of complex numbers.





### Subtraction operator (-)

```
$z - ($rhs: Num)
```

Subtraction of real number from complex number.





### Subtraction operator (-)

```
$z - ($lhs: Num)
```

Subtraction of complex number from real number.





### Multiplication operator (*)

```
$z * ($rhs: Complex)
```

Multiplication of complex numbers.





### Multiplication operator (*)

```
$z * ($ehs: Num)
```

Multiplication of real and complex numbers.





### Division operator (/)

```
$z / ($rhs: Complex)
```

Division of complex numbers.





### Division operator (/)

```
$z / ($rhs: Num)
```

Division of complex number by real number.





### Exponent operator (^)

```
$z ^ ($rhs: Num)
```

Complex number to real power.

This can get expensive for large powers.
For a quicker but less precise alternative, use [`.pow()`](#pow).





### Exponent operator (^)

```
$z ^ ($lhs: Num)
```

Real number to a complex power.





### Equality operator (==)

```
$z == ($ehs: Complex)
```

Equality of complex numbers.





### Equality operator (==)

```
$z == ($ehs: Num)
```

Equality of complex number and real number.





### pow

```
$z.pow($rhs: Num)
```

Complex number to real power. This is an alternative implementation to the
power operator which is faster but less precise.


#### Arguments

* __rhs__: [Num](/doc/std/Number.md)  

## Class functions

### polar

```
Complex.polar($r: Num, $θ: Num)
```

Create a complex number in polar form given radius `r` and angle `θ`.

`z = r(cosθ + isinθ)`.


#### Arguments

* __r__: [Num](/doc/std/Number.md) - Distance from the origin in the complex plane.

* __θ__: [Num](/doc/std/Number.md) - Angle between the positive real axis and the.




End of the Complex class.

This file was generated automatically by the Ferret compiler from
Complex.frt.