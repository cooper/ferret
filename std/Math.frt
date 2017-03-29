package Math

#> the ratio of a circle's circumference to it's diameter (π)
share $pi ?= 4 * atan2(1, 1)

#> the base of the natural logarithm
share $e ?= exp(1)

#> sine, expressed in radians
func sin {
    need $θ: Num
    return NATIVE::Math.sin($θ)
}

#> inverse sine
func asin {
    need $num: Num
    return atan2($num, (1 - $num ^ 2).sqrt)
}

#> cosine, expressed in radians
func cos {
    need $θ: Num
    return NATIVE::Math.cos($θ)
}

#> inverse cosine
func acos {
    need $num: Num
    return atan2((1 - $num ^ 2).sqrt, $num)
}

#> tangent, expressed in radians
func tan {
    need $θ: Num
    return sin($θ) / cos($θ)
}

#> two-argument inverse tangent.
#> Note that `atan2(0, 0)` is unreliable.
func atan2 {
    need $y: Num, $x: Num
    return NATIVE::Math.atan2($y, $x)
}

#> inverse tangent
func atan {
    need $num: Num
    return atan2($num, 1)
}

#> secant, expressed in radians
func sec {
    need $θ: Num
    return 1 / cos($θ)
}

#> cosecant, expressed in radians
func csc {
    need $θ: Num
    return 1 / sin($θ)
}

#> natural logarithm (base *e*).
func log {
    need $num: Num
    return NATIVE::Math.log($num)
}

#> log base 10.
func log10 {
    need $num: Num
    return logb(10, $num)
}

#> log base `$base`.
func logb {
    need $base: Num, $num: Num
    return log($num) / log($base)
}

#> takes `e` (the base of the natural logarithm) to a power.
func exp {
    need $num: Num
    return NATIVE::Math.exp($num)
}
