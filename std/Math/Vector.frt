package Math
class Vector

#> creates a vector with the given components
init {
    want @items: Num...
}

#> dimension of the vector
prop dimension {
    return @items.length
}

#> magnitude of the vector
prop magnitude {
    return @items.map! { -> $_ ^ 2 }.sum.sqrt
}

#> scalar multiplication of the vector
operator * {
    need $ehs: Num
    return Vector(items: @items.map! { -> $_ * $ehs })
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

#> dot product of two vectors
method dot {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimension != @dimension")
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

#> angle between two vectors, measured in radians
method angleBetween {
    need $ehs: Vector
    # a·b = |a||b|cos(theta)
    $cosTheta = @dot($ehs) / (@magnitude * $ehs.magnitude)
    return Math.acos($cosTheta)
}

#> fetches the component at the given index. Allows Vector to conform to
#| IndexedRead such that `$vector[N]` is the N+1th component.
method getValue {
    need $index: Num
    return @items[$index]
}

#> returns a copy of the vector
method copy {
    return Vector(items: @items.copy!)
}

method description {
    return "<" + @items.join(", ") + ">"
}
