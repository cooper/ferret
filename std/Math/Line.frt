package Math
class Line

init {
    need @pt1: Point, @pt2: Point
}

prop endpoints {
    return [ @pt1, @pt2 ]
}

prop pretty {
    $mp  = @midpoint
    $pox = @pt1.x;  $poy = @pt1.y
    $ptx = @pt2.x;  $pty = @pt2.y
    $mx  = $mp.x;   $my  = $mp.y
    return "Segment( |($pox, $poy)---($mx, $my)---($ptx, $pty)| Length = @length )"
}

method description {
    return @pretty
}

prop midpoint {
    return (@pt1, @pt2).midpoint()
}

prop length {
    return @pt1.distanceTo(@pt2)
}
