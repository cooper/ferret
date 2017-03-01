package Math
class Vector
#< Represents a [vector](https://en.wikipedia.org/wiki/Vector_space) of any
#| dimension.

#> Creates a vector with the given components.
init {
    want @items: Num...
    if @dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
}

#> dimension of the vector
prop dimension {
    return @items.length
}

#> human-readable dimension of the vector
prop dimensionHR {
    return @dimension + "D"
}

#> magnitude of the vector
prop magnitude {
    return @items.map! { -> $_ ^ 2 }.sum.sqrt
}

#> the unit vector in the direction of this vector
prop unitVector {
    return *self / @magnitude
}

#> returns the unit vector in the direction of the given axis
method axisUnitVector {
    need $axis: VectorAxis #< axis number, starting at 1 (e.g. x-axis)
    return Vector.axisUnitVector(@dimension, $axis)
}

#> for a >=1D vector, the first comonent
prop x {
    return *self[0]
}

#> for a >=2D vector, the second component
prop y {
    return *self[1]
}

#> for a >=3D vector, the third component
prop z {
    return *self[2]
}

#> for a 2D vector, its direction, measured in radians
prop direction {
    return Math.atan2(@y, @x)
}

#> addition of two vectors
operator + {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take *self[$i] + $ehs[$i]
    }
    return Vector(items: $items)
}

#> allows you to take the opposite vector `-$u`
operator - {
    need $lhs: Num
    if $lhs != 0
        throw(:InvalidOperation, "Unsupported operation")
    return Vector(items: gather for $x in @items {
        take -$x
    })
}

#> subtraction of a vector from another
operator - {
    need $rhs: Vector
    if $rhs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $rhs.dimensionHR != @dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take *self[$i] - $rhs[$i]
    }
    return Vector(items: $items)
}

#> scalar multiplication of the vector
operator * {
    need $ehs: Num
    return Vector(items: @items.map! { -> $_ * $ehs })
}

#> scalar division of the vector
operator / {
    need $rhs: Num
    return *self * (1 / $rhs)
}

#> dot product of two vectors
operator * {
    need $ehs: Vector
    return @dot($ehs)
}

#> vector equality
operator == {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        return false
    for $i in 0..@items.lastIndex {
        if *self[$i] == $ehs[$i]
            next
        return false
    }
    return true
}

#> dot product of this vector and another of the same dimension
method dot {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $dot = 0
    for $i in 0..@items.lastIndex {
        $dot += *self[$i] * $ehs[$i]
    }
    return $dot
}

#> cross product of two 3D vectors
method cross {
    need $ehs: Vector
    if $ehs.dimension != 3 || @dimension != 3
        throw Error(:DimensionError, "Cross product only exists in 3D")
    @a = *self[1] * $ehs[2] - *self[2] * $ehs[1]
    @b = *self[2] * $ehs[0] - *self[0] * $ehs[2]
    @c = *self[0] * $ehs[1] - *self[1] * $ehs[0]
    return Vector(@a, @b, @c)
}

#> angle between this vector and another of the same dimension, measured in
#| radians
method angleBetween {
    need $ehs: Vector
    # a·b = |a||b|cosθ
    $cosθ = @dot($ehs) / (@magnitude * $ehs.magnitude)
    return Math.acos($cosθ)
}

#> true if this vector is orthogonal to another of the same dimension
# consider: the dot product is also zero if either is a zero vector. should
# we still return true in that case?
method orthogonalTo {
    need $ehs: Vector
    return @dot($ehs) == 0
}

#> true if this vector is parallel to another of the same dimension
method parallelTo {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $u1 = @unitVector
    $u2 = $ehs.unitVector
    if $u1 == $u2 || -$u1 == $u2
        return true
    return false
}

#> fetches the component at the given index. Allows Vector to conform to
#| IndexedRead such that `$vector[N]` is the N+1th component.
method getValue {
    need $index: Num
    $n = $index + 1
    if @dimension < $n
        throw Error(:DimensionError, "@dimensionHR vector has no component $n")
    return @items[$index]
}

#> returns a copy of the vector
method copy {
    return Vector(items: @items.copy!)
}

method description {
    return "<" + @items.join(", ") + ">"
}

#> returns the zero vector in the given dimension
func zeroVector {
    need $dimension: Num
    if $dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
    return Vector(items: gather for $i in 1..$dimension { take 0 })
}

#> returns the unit vector for the given dimension and axis
func axisUnitVector {
    need $dimension: Num
    need $axis: VectorAxis #< axis number or letter, starting at 1 or "x"
    if $dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
    $items = gather for $i in 1..$dimension {
        if $i == $axis {
            take 1
            next
        }
        take 0
    }
    return Vector(items: $items)
}

type VectorAxis {
    transform _axisToNumber($_)
}

func _axisToNumber {
    need $axis: Num | Char
    if $axis.*instanceOf(Num)
        return $axis
    return 120 - $axis.ord
}
