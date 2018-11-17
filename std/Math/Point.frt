package Math
class Point
#< represents a 2D point

$docOption_instanceName = "pt"

#> the point `(0,0)`
share $origin ?= Point(0, 0)

#> creates a point given x- and y- coordinates
init {
    need @x: Num    #< x-coordinate
    need @y: Num    #< y-coordinate
}

#> returns the distance between this point and another
method distanceTo {
    need $pt2: Point
    $dx = @x - $pt2.x
    $dy = @y - $pt2.y
    return sqrt($dx ^ 2 + $dy ^ 2)
}

#> given another point, returns the point centered between them
method midpoint {
    need $pt2: Point
    return Point(
        x: (@x + $pt2.x) / 2,
        y: (@y + $pt2.y) / 2
    )
}

#> distance between this point and the origin `(0, 0)`
prop distanceFromOrigin {
    return @distanceTo($origin)
}

method description {
    return "(@x, @y)"
}

#> equality of two points
operator == {
    need $ehs: Point
    return $ehs.x == @x && $ehs.y == @y
}