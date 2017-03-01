class Complex

init {
    need $real: Num #< real part
    need $imag: Num #< imaginary part
    @a = $real
    @b = $imag

    # if we have no imaginary part, return a real number
    if $imag == 0
        return $imag
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

#> subtractions of real numbers from complex numbers
operator - {
    need $rhs: Num
    return Complex(@a - $rhs, @b)
}

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

# hilarious
#> complex numbers to an integer power
operator ^ {
    need $rhs: Int
    if $rhs == 0
        return 1
    if $rhs == 1
        return *self
    $new = *self
    for $i in 2..$rhs:
        $new *= *self
    return $new
}

#> absolute value of complex number
prop abs {
    return (@a ^ 2 + @b ^ 2).sqrt
}

#> conjugate of complex number
prop conj {
    return Complex(@a, -@b)
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
