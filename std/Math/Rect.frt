package Math
class Rect
#< represents a rectangle

#> creates a rectangle, given its origin (bottom-left vertex) and dimensions
init {
    need $x: Num        #< x-coordinate of the rectangle's origin
    need $y: Num        #< y-coordinate of the rectangle's origin
    need @width: Num    #< width of the rectangle
    need @height: Num   #< height of the rectangle
    @origin = Point($x, $y)
}

#> a list of the four vertices of the rectangle
prop vertices {
    return [
        @topLeft,
        @topRight,
        @bottomLeft,
        @bottomRight
    ]
}

#> bottom left vertex of the rectangle
prop bottomLeft {
    return @origin
}

#> bottom right vertex of the rectangle
prop bottomRight {
    return Point(@origin.x + @width, @origin.y)
}

#> top left vertex of the rectangle
prop topLeft {
    return Point(@origin.x, @origin.y + @height)
}

#> top right vertex of the rectangle
prop topRight {
    return Point(@origin.x + @width, @origin.y + @height)
}

#> line segment formed by the bottom vertices of the rectangle
prop bottom {
    return Segment(@bottomLeft, @bottomRight)
}

#> line segment formed by the top vertices of the rectangle
prop top {
    return Segment(@topLeft, @topRight)
}

#> center point of the rectangle
prop center {
    $x = @origin.x + @width  / 2
    $y = @origin.y + @height / 2
    return Point($x, $y)
}

method description {
    $o = @origin
    $c = @center
    return "[ @width" + "x@height; Origin($o.x, $o.y); Center($c.x, $c.y) ]"
}
