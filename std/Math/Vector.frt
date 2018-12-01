package Math
class Vector
#< Represents a [vector](https://en.wikipedia.org/wiki/Vector_space) of any
#| dimension.

$docOption_instanceName = "v"

#> Creates a vector with the given components.
init {
    want @items: Num...
    if @dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
}

#> dimension of the vector
.dimension -> @items.length

#> human-readable dimension of the vector
.dimensionHR -> @dimension + "D"

#> magnitude of the vector
.magnitude -> @items.map! { -> $_ ^ 2 }.sum.sqrt

#> unit vector in the direction of this vector
.unitVector -> *self / @magnitude

#> returns the unit vector in the direction of the given axis
.axisUnitVector {
    need $axis: VectorAxis #< axis number or letter, starting at 1 or "i"
    -> Vector.axisUnitVector(@dimension, $axis)
}

.x -> *self[0]  #< for a >=1D vector, the first comonent
.y -> *self[1]  #< for a >=2D vector, the second component
.z -> *self[2]  #< for a >=3D vector, the third component

#> for a 2D vector, its direction, measured in radians
.direction {
    if @dimension != 2
        throw Error(:DimensionError, "Direction only exists in 2D")
    -> Math.atan2(@y, @x)
}

#> addition of two vectors
op + {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take *self[$i] + $ehs[$i]
    }
    -> Vector(items: $items)
}

#> allows you to take the opposite vector `-$u`
op - {
    need $lhs: Num
    if $lhs != 0
        throw(:InvalidOperation, "Unsupported operation")
    -> Vector(items: gather for $x in @items {
        take -$x
    })
}

#> subtraction of a vector from another
op - {
    need $rhs: Vector
    if $rhs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $rhs.dimensionHR != @dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take *self[$i] - $rhs[$i]
    }
    -> Vector(items: $items)
}

#> scalar multiplication of the vector
op * {
    need $ehs: Num
    -> Vector(items: @items.map! { -> $_ * $ehs })
}

#> scalar division of the vector
op / {
    need $rhs: Num
    -> *self * (1 / $rhs)
}

#> dot product of two vectors
op * {
    need $ehs: Vector
    -> @dot($ehs)
}

#> vector equality
op == {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        -> false
    for $i in 0..@items.lastIndex {
        if *self[$i] == $ehs[$i]
            next
        -> false
    }
    -> true
}

#> dot product of this vector and another of the same dimension
.dot {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $dot = 0
    for $i in 0..@items.lastIndex {
        $dot += *self[$i] * $ehs[$i]
    }
    -> $dot
}

#> cross product of two 3D vectors
.cross {
    need $ehs: Vector
    if $ehs.dimension != 3 || @dimension != 3
        throw Error(:DimensionError, "Cross product only exists in 3D")
    @a = *self[1] * $ehs[2] - *self[2] * $ehs[1]
    @b = *self[2] * $ehs[0] - *self[0] * $ehs[2]
    @c = *self[0] * $ehs[1] - *self[1] * $ehs[0]
    -> Vector(@a, @b, @c)
}

#> angle between this vector and another of the same dimension, measured in
#| radians
.angleBetween {
    need $ehs: Vector
    # a·b = |a||b|cosθ
    $cosθ = @dot($ehs) / (@magnitude * $ehs.magnitude)
    -> Math.acos($cosθ)
}

#> true if this vector is orthogonal to another of the same dimension
# consider: the dot product is also zero if either is a zero vector. should
# we still -> true in that case?
.orthogonalTo {
    need $ehs: Vector
    -> @dot($ehs) == 0
}

#> true if this vector is parallel to another of the same dimension
.parallelTo {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $u1 = @unitVector
    $u2 = $ehs.unitVector
    if $u1 == $u2 || -$u1 == $u2
        -> true
    -> false
}

#> fetches the component at the given index. Allows Vector to conform to
#| IndexedRead such that `$vector[N]` is the N+1th component.
.getValue {
    need $index: Num
    $n = $index + 1
    if @dimension < $n
        throw Error(:DimensionError, "@dimensionHR vector has no component $n")
    -> @items[$index]
}

#> returns a copy of the vector
method copy -> Vector(items: @items.copy!)

.description -> "<" + @items.join(", ") + ">"

#> returns the zero vector in the given dimension
func zeroVector {
    need $dimension: Num
    if $dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
    -> Vector(items: gather for $i in 1..$dimension { take 0 })
}

#> returns the unit vector for the given dimension and axis
func axisUnitVector {
    need $dimension: Num
    need $axis: VectorAxis #< axis number or letter, starting at 1 or "i"
    if $dimension < 1
        throw Error(:DimensionError, "Need dimension >= 1D")
    $items = gather for $i in 1..$dimension {
        if $i == $axis {
            take 1
            next
        }
        take 0
    }
    -> Vector(items: $items)
}

func _axisToNumber {
    need $axis: Num | Char
    if $axis.*isa(Num)
        -> $axis
    $o = $axis.ord
    if $o > 119
        -> $o - 119
    -> $o - 104
}

#> An interface which accepts an axis letter starting at "i" or number starting
#| at 1. For instance, a 3D vector is represented by axes i, j, and k, which
#| correspond to the numbers 1, 2, and 3, respectively.
type VectorAxis {
    #> converts letters starting at 'i' to axis numbers
    transform _axisToNumber($_)
}
