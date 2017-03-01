package Math

share $pi ?= NATIVE::Math.pi!

#> sine, expressed in radians
func sin {
    need $num: Num
    return NATIVE::Math.sin($num)
}

#> inverse sine
func asin {
    need $num: Num
    return atan2($num, (1 - $num ^ 2).sqrt)
}

#> cosine, expressed in radians
func cos {
    need $num: Num
    return NATIVE::Math.cos($num)
}

#> inverse cosine
func acos {
    need $num: Num
    return atan2((1 - $num ^ 2).sqrt, $num)
}

#> tangent, expressed in radians
func tan {
    need $num: Num
    return sin($num) / cos($num)
}

#> two-argument inverse tangent.
#> Note that `atan2(0, 0)` is unreliable.
func atan2 {
    need $y: Num, $x: Num
    return NATIVE::Math.atan2($y, $x)
}

#> secant, expressed in radians
func sec {
    need $num: Num
    return 1 / cos($num)
}

# cosecant, expressed in radians
func csc {
    need $num: Num
    return 1 / sin($num)
}
