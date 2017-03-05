package Math
class Line
#< represents a line segment

#> creates a line segment given two endpoints
init {
    need @pt1: Point    #< an endpoint
    need @pt2: Point    #< another endpoint
}

#> length of the line segment
prop length {
    return @pt1.distanceTo(@pt2)
}

#> a list of endpoints
prop endpoints {
    return [ @pt1, @pt2 ]
}

#> midpoint of the line segment
prop midpoint {
    return @pt1.midpoint(@pt2)
}

method description {
    return "|(@pt1.x, @pt1.y)---(@pt2.x, @pt2.y)|"
}
