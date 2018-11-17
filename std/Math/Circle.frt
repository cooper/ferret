package Math
class Circle
#< represents a circle

share $unit ?= *class(1, 0, 0)

#> creates a circle given radius and center coordinates
init {
    need @r: Num #< radius
    need @h: Num #< x-coordinate of center
    need @k: Num #< y-coordinate of center
}

#> creates a circle given radius and center
init {
    need @r: Num #< radius
    need $center: Point #< center
    @h = $center.x
    @k = $center.y
}

#> creates a circle at the origin given area
init {
    need $area: Num     #< area
    @r = ($area / Math.pi).sqrt
    @h = 0
    @k = 0
}

prop r  #< radius
prop h  #< center x-coordinate
prop k  #< center y-coordinate

#> center point
prop? center {
    return Math::Point(@h, @k)
}

#> squared radius
prop? r2 { 
    return @r ^ 2
}

#> area
prop area {
    return Math.pi * @r2
}

#> diameter
prop? d {
    return @r * 2
}

#> circumference
prop c {
    return Math.pi * @d
}

#> formula in center-radius notation
prop formula {
    $x = "x"; if (@h != 0) { $x = "(x-@h)" }
    $y = "y"; if (@k != 0) { $y = "(y-@k)" }
    return "$x^2 + $y^2 = " + @r2
}

#> diameter. Same as `d`
prop diameter {
    return @d
}

#> circumference. Same as `c`
prop circumference {
    return @c
}

#> tests whether a point is on the circle
method hasPoint {
    need $pt: Point
    return ($pt.x - @h)^2 + ($pt.y - @k)^2 == @r2
}

#> tests whether a line is tangent to the circle
method isTangent {
    need $line: Line
    $m = $line.m    # slope
    $c = $line.c    # y-int
    return (@r2 - @h^2) * $m^2 - 2 * $m * @h * ($c - @k) + @r2 - ($c - @k)^2 == 0
}

method description {
    return "( (@h, @k) r = @r )"
}

#> equality of two circles
operator == {
    need $ehs: Circle
    return $ehs.center == @center && $ehs.r == @r
}