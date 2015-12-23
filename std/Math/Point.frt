package Math
class Point

init {
    need @x: Num, @y: Num
}

method distanceTo {
    need $pt2: Point
    $dx = @x - $pt2.x
    $dy = @y - $pt2.y
    return sqrt($dx ^ 2 + $dy ^ 2)
}

prop distanceFromOrigin {
    return @distanceTo(*class(0, 0))
}

prop pretty {
    return "(@x, @y)"
}

method toString {
    return @pretty
}

method description {
    return "Point" + @pretty
}

func midpoint {
    need $pt1: Point, $pt2: Point
    return *class(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2,
    )
}

func distanceBetween {
    need $pt1: Point, $pt2: Point
    return $pt1.distanceTo($pt2)
}
