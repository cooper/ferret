class Complex

init {
    need @real: Int #< real part
    need @imag: Int #< imaginary part
}

operator + {
    need $rhs: Complex
    return Complex(@real + $rhs.real, @imag + $rhs.imag)
}

operator - {
    need $rhs: Complex
    return Complex(@real - $rhs.real, @imag - $rhs.imag)
}

method description {
    $r = @real
    $i = @imag
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
