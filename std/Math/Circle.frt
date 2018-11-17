package Math
class Circle
#< represents a circle

#> unit circle
share $unit ?= *class(1, 0, 0)

#> creates a circle given radius and center coordinates
init {
    need @r: Num    #< radius
    need @h: Num    #< x-coordinate of center
    need @k: Num    #< y-coordinate of center
}

#> creates a circle given radius and center
init {
    need @r: Num    #< radius
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

.r                                      #< radius length
.h                                      #< center x-coordinate
.k                                      #< center y-coordinate
.center?        -> Point(@h, @k)        #< center point
.r2?            -> @r ^ 2               #< squared radius length
.area           -> Math.pi * @r2        #< area
.d              -> @r * 2               #< diameter length
.c              -> Math.pi * @d         #< circumference
.diameter       -> @d                   #< diameter length. Same as `d`
.circumference  -> @c                   #< circumference. Same as `c`

#> formula in center-radius notation
.formula {
    $x = "x"; if @h != 0: $x = "(x-@h)"
    $y = "y"; if @k != 0: $y = "(y-@k)"
    -> "$x^2 + $y^2 = " + @r2
}

#> tests whether a point is on the circle
method hasPoint {
    need $pt: Point
    -> ($pt.x - @h)^2 + ($pt.y - @k)^2 == @r2
}

#> tests whether a line is tangent to the circle
method isTangent {
    need $line: Line
    $m = $line.m    # slope
    $c = $line.c    # y-int
    -> (@r2 - @h^2) * $m^2 - 2 * $m * @h * ($c - @k) + @r2 - ($c - @k)^2 == 0
}

#> tests whether a line segment is a chord of the circle
method isChord {
    need $seg: Segment
    -> @hasPoint($seg.pt1) && @hasPoint($seg.pt2)
}

method description {
    -> "( (@h, @k) r = @r )"
}

#> equality of two circles
operator == {
    need $ehs: Circle
    -> $ehs.center == @center && $ehs.r == @r
}