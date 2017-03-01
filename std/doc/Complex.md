# Complex

This is the Complex class version 1.0.

Represents a complex number. Ferret has native support for complex numbers,
including syntax for the normal mathematic notation. Complex numbers are
written as `a + bi`, where `a` and `b` are [real numbers](Number.md) and `i`
is the [imaginary unit](https://en.wikipedia.org/wiki/Imaginary_unit).

`a` and `b` are commonly called the "real part" and "imaginary part"
respectively, despite both being real numbers.


## Initializer

```
$complex = Complex($a: Num, $b: Num)
```

Creates a complex number with the given real and imaginary parts. This is
only useful to create a complex number from variable parts, since Ferret
has native support for inline `a + bi` notation.


### Arguments

* __a__: [Number](/std/doc/Number.md) - Real part.

* __b__: [Number](/std/doc/Number.md) - Imaginary part (a real number, though).

## Methods

### abs

```
$complex.abs
```

Computed property. [Absolute value](https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers)
(or modulus) of the complex number.



### arg

```
$complex.arg
```

Computed property. [Argument](https://en.wikipedia.org/wiki/Argument_(complex_analysis)) of
the complex number. On the
[complex plane](https://en.wikipedia.org/wiki/Complex_plane), this is the
angle Ï between the positive real axis and the line from the origin to the
point this number represents.



### conj

```
$complex.conj
```

Computed property. [Conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) of complex the
number.



### opAdd

```
$complex.opAdd($rhs: Complex)
```

Addition of complex numbers.


#### Arguments

* __rhs__: Complex  



### opAdd

```
$complex.opAdd($ehs: Num)
```

Addition of complex and real numbers.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



### opSub

```
$complex.opSub($rhs: Complex)
```

Subtraction of complex numbers.


#### Arguments

* __rhs__: Complex  



### opSub

```
$complex.opSub($rhs: Num)
```

Subtraction of real number from complex number.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### opSub

```
$complex.opSub($lhs: Num)
```

Subtraction of complex number from real number.


#### Arguments

* __lhs__: [Number](/std/doc/Number.md)  



### opMul

```
$complex.opMul($rhs: Complex)
```

Multiplication of complex numbers.


#### Arguments

* __rhs__: Complex  



### opMul

```
$complex.opMul($ehs: Num)
```

Multiplication of real and complex numbers.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



### opDiv

```
$complex.opDiv($rhs: Complex)
```

Division of complex numbers.


#### Arguments

* __rhs__: Complex  



### opDiv

```
$complex.opDiv($rhs: Num)
```

Division of complex number by real number.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### opPow

```
$complex.opPow($rhs: Num)
```

Complex number to real power.
This can get expensive for large powers.
For a quicker (and less precise) alternative, see [`.pow()`](#pow).


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### pow

```
$complex.pow($rhs: Num)
```

Complex number to real power. This is an alternative implementation which
uses trigonometric functions to find a quicker but less precise result.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### description

```
$complex.description()
```







End of Complex class.

This file was generated automatically by the Ferret compiler from
[Complex.frt](../Complex.frt).