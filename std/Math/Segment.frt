package Math
class Segment
#< represents a line segment

#> creates a line segment given two endpoints
init {
    need @pt1: Point    #< an endpoint
    need @pt2: Point    #< another endpoint
}

#> length of the line segment
.length -> @pt1.distanceTo(@pt2)

#> a list of endpoints
.endpoints -> [ @pt1, @pt2 ]

#> midpoint of the line segment
.midpoint -> @pt1.midpoint(@pt2)

.description -> "|(@pt1.x, @pt1.y)---(@pt2.x, @pt2.y)|"
