class Complex

init {
    need $real: Num #< real part
    need $imag: Num #< imaginary part
    @a = $real
    @b = $imag
}

operator + {
    need $rhs: Complex
    return Complex(@a + $rhs.a, @b + $rhs.b)
}

operator - {
    need $rhs: Complex
    return Complex(@a - $rhs.a, @b - $rhs.b)
}

operator * {
    need $rhs: Complex
    return Complex(
        @a * $rhs.a - @b * $rhs.b,
        @a * $rhs.b + @b * $rhs.a
    )
}

operator / {
    need $rhs: Complex
    $conj = $rhs.conj
    $num = *self * $conj
    $den = $rhs  * $conj
    inspect([ num: $num, den: $den ])
    return Complex(
        $num.a / $den.a,
        $num.b / $den.a
    )
}

# hilarious
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

prop abs {
    return (@a^2 + @b^2).sqrt
}

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
