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
.vertices -> [
    @topLeft,
    @topRight,
    @bottomLeft,
    @bottomRight
]

#> bottom left vertex of the rectangle
.bottomLeft -> @origin

#> bottom right vertex of the rectangle
.bottomRight -> Point(@origin.x + @width, @origin.y)

#> top left vertex of the rectangle
.topLeft -> Point(@origin.x, @origin.y + @height)

#> top right vertex of the rectangle
.topRight -> Point(@origin.x + @width, @origin.y + @height)

#> line segment formed by the bottom vertices of the rectangle
.bottom -> Segment(@bottomLeft, @bottomRight)

#> line segment formed by the top vertices of the rectangle
.top -> Segment(@topLeft, @topRight)

#> center point of the rectangle
.center {
    $x = @origin.x + @width  / 2
    $y = @origin.y + @height / 2
    -> Point($x, $y)
}

.description {
    $o = @origin
    $c = @center
    -> "[ @width" + "x@height; Origin($o.x, $o.y); Center($c.x, $c.y) ]"
}
