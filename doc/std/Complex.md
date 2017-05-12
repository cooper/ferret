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
$z = Complex($a: Num, $b: Num)
```

Creates a complex number with the given real and imaginary parts. This is
only useful to create a complex number from variable parts, since Ferret
has native support for inline `a + bi` notation.

If the given imaginary part is zero, the constructor returns the real part
as a [real number](Number.md).

To instead create a complex number from `r` and `θ`,
use [`Complex.polar()`](#polar).


### Arguments

* __a__: [Num](/doc/std/Number.md) - Real part.

* __b__: [Num](/doc/std/Number.md) - Imaginary part (a real number, though).

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

Computed property. [Conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) of complex the
number.



### Addition operator (+)

```
$z + ($rhs: Complex)
```

Addition of complex numbers.


#### Arguments

* __rhs__: [Complex](/doc/std/Complex.md)  



### Addition operator (+)

```
$z + ($ehs: Num)
```

Addition of complex and real numbers.


#### Arguments

* __ehs__: [Num](/doc/std/Number.md)  



### Subtraction operator (-)

```
$z - ($rhs: Complex)
```

Subtraction of complex numbers.


#### Arguments

* __rhs__: [Complex](/doc/std/Complex.md)  



### Subtraction operator (-)

```
$z - ($rhs: Num)
```

Subtraction of real number from complex number.


#### Arguments

* __rhs__: [Num](/doc/std/Number.md)  



### Subtraction operator (-)

```
$z - ($lhs: Num)
```

Subtraction of complex number from real number.


#### Arguments

* __lhs__: [Num](/doc/std/Number.md)  



### Multiplication operator (*)

```
$z * ($rhs: Complex)
```

Multiplication of complex numbers.


#### Arguments

* __rhs__: [Complex](/doc/std/Complex.md)  



### Multiplication operator (*)

```
$z * ($ehs: Num)
```

Multiplication of real and complex numbers.


#### Arguments

* __ehs__: [Num](/doc/std/Number.md)  



### Division operator (/)

```
$z / ($rhs: Complex)
```

Division of complex numbers.


#### Arguments

* __rhs__: [Complex](/doc/std/Complex.md)  



### Division operator (/)

```
$z / ($rhs: Num)
```

Division of complex number by real number.


#### Arguments

* __rhs__: [Num](/doc/std/Number.md)  



### Exponent operator (^)

```
$z ^ ($rhs: Num)
```

Complex number to real power.

This can get expensive for large powers.
For a quicker but less precise alternative, use [`.pow()`](#pow).


#### Arguments

* __rhs__: [Num](/doc/std/Number.md)  



### pow

```
$z.pow($rhs: Num)
```

Complex number to real power. This is an alternative implementation to the
power operator which is faster but less precise.


#### Arguments

* __rhs__: [Num](/doc/std/Number.md)  



### Exponent operator (^)

```
$z ^ ($lhs: Num)
```

Real number to a complex power.


#### Arguments

* __lhs__: [Num](/doc/std/Number.md)  



### Equality operator (==)

```
$z == ($ehs: Complex)
```

Equality of complex numbers.


#### Arguments

* __ehs__: [Complex](/doc/std/Complex.md)  



### Equality operator (==)

```
$z == ($ehs: Num)
```

Equality of complex number and real number.


#### Arguments

* __ehs__: [Num](/doc/std/Number.md)  



### description

```
$z.description()
```

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