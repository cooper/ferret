class Complex 1.0
#< Represents a complex number.
#|
#| Ferret has native support for complex numbers, including syntax for the
#| normal mathematic notation in rectangular form `a + bi`, where `a` and `b`
#| are [real numbers](Number.md) and `i` is the
#| [imaginary unit](https://en.wikipedia.org/wiki/Imaginary_unit).
#| `a` and `b` are commonly called the "real part" and "imaginary part"
#| respectively, despite both being [real numbers](Number.md).
#|
#| Complex numbers can also be constructed from a polar representations
#| `r(cosθ + isinθ)` or `re^(iθ)` with [`Complex.polar()`](#polar).

$docOption_instanceName = "z"

#> Creates a complex number with the given real and imaginary parts. This is
#| only useful to create a complex number from variable parts, since Ferret
#| has native support for inline `a + bi` notation.
#|
#| If the given imaginary part is zero, the constructor returns the real part
#| as a [real number](Number.md).
#|
#| To instead create a complex number from `r` and `θ`,
#| use [`Complex.polar()`](#polar).
init {
    need @a: Num #< real part
    need @b: Num #< imaginary part (a real number, though)

    # if we have no imaginary part, return a real number
    if @b == 0
        return @a
}

#> Create a complex number in polar form given radius `r` and angle `θ`.
#|
#| `z = r(cosθ + isinθ)`
func polar {
    need $r: Num        #< distance from the origin in the complex plane
    need $θ: Num        #< angle between the positive real axis and the
                        #| position vector, measured in radians
    return Complex(
        $r * Math.cos($θ),
        $r * Math.sin($θ)
    )
}

#> [Absolute value](https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers)
#| (or modulus) of the complex number. This is distance from the origin on the
#| [complex plane](https://en.wikipedia.org/wiki/Complex_plane).
#|
#| In polar form, this is `r`.
prop abs {
    return (@a ^ 2 + @b ^ 2).sqrt
}

#> [Argument](https://en.wikipedia.org/wiki/Argument_(complex_analysis)) of
#| the complex number. On the
#| [complex plane](https://en.wikipedia.org/wiki/Complex_plane), this is the
#| angle `θ` between the positive real axis and the position vector.
#|
#| In polar form, this is `θ`.
prop arg {
    return Math.atan2(@b, @a)
}

#> [Conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) of the complex
#| number
prop conj {
    return Complex(@a, -@b)
}

#> [Square root](https://math.stackexchange.com/a/44500) of the complex number
prop sqrt {
    $r = @abs
    $f = *self + $r
    return $r.sqrt * $f / $f.abs
}

#> Nth root of the complex number
method root {
    need $n: Num
    return @abs.root($n) * Math.e ^ (i * @arg / $n)
}

#> addition of complex numbers
operator + {
    need $rhs: Complex
    return Complex(@a + $rhs.a, @b + $rhs.b)
}

#> addition of complex and real numbers
operator + {
    need $ehs: Num
    return Complex(@a + $ehs, @b)
}

#> subtraction of complex numbers
operator - {
    need $rhs: Complex
    return Complex(@a - $rhs.a, @b - $rhs.b)
}

#> subtraction of real number from complex number
operator - {
    need $rhs: Num
    return Complex(@a - $rhs, @b)
}

#> subtraction of complex number from real number
# this is like (r)-(a+bi)
# so it's r - a - bi
operator - {
    need $lhs: Num
    return Complex($lhs - @a, -@b)
}

#> multiplication of complex numbers
operator * {
    need $rhs: Complex
    return Complex(
        @a * $rhs.a - @b * $rhs.b,
        @a * $rhs.b + @b * $rhs.a
    )
}

#> multiplication of real and complex numbers
operator * {
    need $ehs: Num
    return Complex($ehs * @a, $ehs * @b)
}

#> division of complex numbers
operator / {
    need $rhs: Complex
    $conj = $rhs.conj
    $num = *self * $conj
    $den = $rhs  * $conj
    return Complex(
        $num.a / $den.a,
        $num.b / $den.a
    )
}

#> division of complex number by real number
operator / {
    need $rhs: Num
    return Complex(
        @a / $rhs,
        @b / $rhs
    )
}

#> Complex number to real power.
#|
#| This can get expensive for large powers.
#| For a quicker but less precise alternative, use [`.pow()`](#pow).
operator ^ {
    need $rhs: Num
    if $rhs <= 0
        return 1
    return *self * *self ^ ($rhs - 1)
}

#> Real number to a complex power
operator ^ {
    need $lhs: Num
    return Complex.polar($lhs ^ @a, @b * Math.log($lhs))
}

#> equality of complex numbers
operator == {
    need $ehs: Complex
    return @a == $ehs.a && @b == $ehs.b
}

#> equality of complex number and real number
operator == {
    need $ehs: Num
    return @a == $ehs && @b == 0
}

#> Complex number to real power. This is an alternative implementation to the
#| power operator which is faster but less precise.
method pow {
    need $rhs: Num
    $log = Math.log(@abs)
    return Complex.polar(
        Math.exp($rhs * $log),
        $rhs * @arg
    )
}

method description {
    $r = @a
    $i = @b
    if $r == 0 && $i == 0
        return "0"
    if $r == 0
        $r = ""
    if $i == 0
        $i = ""
    else if $i == -1
        $i = "-i"
    else if $i < 0
        $i += "i"
    else if $i == 1
        $i = "+i"
    else
        $i = "+" + $i + "i"
    return ($r + $i).trimPrefix("+")
}
