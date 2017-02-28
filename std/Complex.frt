class Complex

init {
    need $real: Num #< real part
    need $imag: Num #< imaginary part
    @a = $real
    @b = $imag
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
    need $ehs: Num
    return Complex(@a - $ehs, @b)
}

#> multiplication of complex numbers
operator * {
    need $rhs: Complex
    return Complex(
        @a * $rhs.a - @b * $rhs.b,
        @a * $rhs.b + @b * $rhs.a
    )
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
