package Math

#> the ratio of a circle's circumference to it's diameter
share $π ?= 4 * atan2(1, 1)

#> alias for `Math.π`
share $pi ?= $π

#> the base of the natural logarithm
share $e ?= exp(1)

#> Sine, expressed in radians.
#|
#| Domain:  `ℝ`
#|
#| Range:   `[-1, 1]`
#|
func sin {
    need $θ: Num
    return NATIVE::Math.sin($θ)
}

#> Inverse sine.
#|
#| Domain:  `[-1, 1]`
#|
#| Range:   `ℝ`
#|
func asin {
    need $num: Num
    return atan2($num, (1 - $num ^ 2).sqrt)
}

#> Cosine, expressed in radians.
#|
#| Domain:  `ℝ`
#|
#| Range:   `[-1, 1]`
#|
func cos {
    need $θ: Num
    return NATIVE::Math.cos($θ)
}

#> Inverse cosine.
#|
#| Domain:  `[-1, 1]`
#|
#| Range:   `[0, π]`
#|
func acos {
    need $num: Num
    return atan2((1 - $num ^ 2).sqrt, $num)
}

#> Tangent, expressed in radians.
#|
#| Domain:  `x ≠ π/2 + kπ` for all integers `k`
#|
#| Range:   `ℝ`
#|
func tan {
    need $θ: Num
    return sin($θ) / cos($θ)
}

#> Two-argument inverse tangent.
#|
#| Domain:  `ℝ`
#|
#| Range:   `(-π, π]`
#|
#| `atan2(y, x) =`
#| ```
#| atan(y/x)           x > 0
#| atan(y/x) + π       x < 0 and y ≥ 0
#| atan(y/x) - π       x < 0 and y < 0
#| π/2                 x = 0 and y > 0
#| -π/2                x = 0 and y < 0
#| indeterminate       x = 0 and y = 0
#| ```
#|
#| Note that `atan2(0, 0)` is not well-defined.
#|
func atan2 {
    need $y: Num, $x: Num
    return NATIVE::Math.atan2($y, $x)
}

#> Inverse tangent.
#|
#| Domain:  `ℝ`
#|
#| Range:   `(-π/2, π/2)`
#|
#| Note that the range of this function is `(-π/2, π/2)`,
#| unlike [`atan2()`](#atan2) which adjusts to the proper quadrant.
func atan {
    need $num: Num
    return atan2($num, 1)
}

#> Secant, expressed in radians.
#|
#| Domain:  `x ≠ π/2 + kπ` for all integers `k`
#|
#| Range:   `(–∞, –1] ∪ [1, ∞)`
#|
func sec {
    need $θ: Num
    return 1 / cos($θ)
}

#> Cosecant, expressed in radians.
#|
#| Domain:  `x ≠ kπ` for all integers `k`
#|
#| Range:   `(–∞, –1] ∪ [1, ∞)`
#|
func csc {
    need $θ: Num
    return 1 / sin($θ)
}

#> Cotangent, expressed in radians.
#|
#| Domain:  `x ≠ kπ` for all integers `k`
#|
#| Range:   `ℝ`
#|
func cot {
    need $θ: Num
    return cos($θ) / sin($θ)
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
