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
    return (@pt1, @pt2).midpoint()
}

method description {
    $mp  = @midpoint
    $pox = @pt1.x;  $poy = @pt1.y
    $ptx = @pt2.x;  $pty = @pt2.y
    $mx  = $mp.x;   $my  = $mp.y
    return "Segment( |($pox, $poy)---($mx, $my)---($ptx, $pty)| Length = @length )"
}
