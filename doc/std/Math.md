# Math

This is the Math package.






## Functions

### sin

```
Math.sin($θ: Num)
```

Sine, expressed in radians.

Domain:  `ℝ`

Range:   `[-1, 1]`.


* __θ__: [Num](/doc/std/Number.md)  



### asin

```
Math.asin($num: Num)
```

Inverse sine.

Domain:  `[-1, 1]`

Range:   `ℝ`.


* __num__: [Num](/doc/std/Number.md)  



### cos

```
Math.cos($θ: Num)
```

Cosine, expressed in radians.

Domain:  `ℝ`

Range:   `[-1, 1]`.


* __θ__: [Num](/doc/std/Number.md)  



### acos

```
Math.acos($num: Num)
```

Inverse cosine.

Domain:  `[-1, 1]`

Range:   `[0, π]`.


* __num__: [Num](/doc/std/Number.md)  



### tan

```
Math.tan($θ: Num)
```

Tangent, expressed in radians.

Domain:  `x ≠ π/2 + kπ` for all integers `k`

Range:   `ℝ`.


* __θ__: [Num](/doc/std/Number.md)  



### atan2

```
Math.atan2($y: Num, $x: Num)
```

Two-argument inverse tangent.

Domain:  `ℝ`

Range:   `(-π, π]`

`atan2(y, x) =`
```
atan(y/x)           x > 0
atan(y/x) + π       x < 0 and y ≥ 0
atan(y/x) - π       x < 0 and y < 0
π/2                 x = 0 and y > 0
-π/2                x = 0 and y < 0
indeterminate       x = 0 and y = 0
```

Note that `atan2(0, 0)` is not well-defined.


* __y__: [Num](/doc/std/Number.md)  

* __x__: [Num](/doc/std/Number.md)  



### atan

```
Math.atan($num: Num)
```

Inverse tangent.

Domain:  `ℝ`

Range:   `(-π/2, π/2)`

Note that the range of this function is `(-π/2, π/2)`,
unlike [`atan2()`](#atan2) which adjusts to the proper quadrant.


* __num__: [Num](/doc/std/Number.md)  



### sec

```
Math.sec($θ: Num)
```

Secant, expressed in radians.

Domain:  `x ≠ π/2 + kπ` for all integers `k`

Range:   `(–∞, –1] ∪ [1, ∞)`.


* __θ__: [Num](/doc/std/Number.md)  



### csc

```
Math.csc($θ: Num)
```

Cosecant, expressed in radians.

Domain:  `x ≠ kπ` for all integers `k`

Range:   `(–∞, –1] ∪ [1, ∞)`.


* __θ__: [Num](/doc/std/Number.md)  



### cot

```
Math.cot($θ: Num)
```

Cotangent, expressed in radians.

Domain:  `x ≠ kπ` for all integers `k`

Range:   `ℝ`.


* __θ__: [Num](/doc/std/Number.md)  



### log

```
Math.log($num: Num)
```

Natural logarithm (base *e*).


* __num__: [Num](/doc/std/Number.md)  



### log10

```
Math.log10($num: Num)
```

Log base 10.


* __num__: [Num](/doc/std/Number.md)  



### logb

```
Math.logb($base: Num, $num: Num)
```

Log base `$base`.


* __base__: [Num](/doc/std/Number.md)  

* __num__: [Num](/doc/std/Number.md)  



### exp

```
Math.exp($num: Num)
```

Takes `e` (the base of the natural logarithm) to a power.


* __num__: [Num](/doc/std/Number.md)  

## Shared variables

### π

```
Math.π
```

Ratio of a circle's circumference to it's diameter.

### pi

```
Math.pi
```

Alias for `Math.π`.

### e

```
Math.e
```

Base of the natural logarithm.


End of the Math package.

This file was generated automatically by the Ferret compiler from
Math.frt.