class Complex 1.0
#< Represents a complex number. Ferret has native support for complex numbers,
#| including syntax for the normal mathematic notation. Complex numbers are
#| written as `a + bi`, where `a` and `b` are [real numbers](Number.md) and `i`
#| is the [imaginary unit](https://en.wikipedia.org/wiki/Imaginary_unit).
#|
#| `a` and `b` are commonly called the "real part" and "imaginary part"
#| respectively, despite both being real numbers.
#|

#> Creates a complex number with the given real and imaginary parts. This is
#| only useful to create a complex number from variable parts, since Ferret
#| has native support for inline `a + bi` notation.
init {
    need @a: Num #< real part
    need @b: Num #< imaginary part (a real number, though)

    # if we have no imaginary part, return a real number
    if @b == 0
        return @a
}

#> [Absolute value](https://en.wikipedia.org/wiki/Absolute_value#Complex_numbers)
#| (or modulus) of the complex number.
prop abs {
    return (@a ^ 2 + @b ^ 2).sqrt
}

#> [Argument](https://en.wikipedia.org/wiki/Argument_(complex_analysis)) of
#| the complex number. On the
#| [complex plane](https://en.wikipedia.org/wiki/Complex_plane), this is the
#| angle φ between the positive real axis and the line from the origin to the
#| point this number represents.
prop arg {
    return Math.atan2(@b, @a)
}

#> [Conjugate](https://en.wikipedia.org/wiki/Complex_conjugate) of complex the
#| number
prop conj {
    return Complex(@a, -@b)
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
#| This can get expensive for large powers.
#| For a quicker (and less precise) alternative, see [`.pow()`](#pow).
operator ^ {
    need $rhs: Num
    if $rhs <= 0
        return 1
    return *self * *self ^ ($rhs - 1)
}

#> Complex number to real power. This is an alternative implementation which
#| uses trigonometric functions to find a quicker but less precise result.
method pow {
    need $rhs: Num
    $log_a  = Math.log(@abs)
    $factor = Math.exp($rhs * $log_a)
    $theta  = $rhs * @arg
    return Complex(
        $factor * Math.cos($theta),
        $factor * Math.sin($theta)
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
