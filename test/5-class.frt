class Point 1.0

init {
    need $x, $y
    @x = $x
    @y = $y
}

method oneToRight {
    $pt = *class(@x + 1, @y)
    -> $pt
}

method pretty
    -> ("(@x, @y)")

method toString
    -> @pretty()

func midpoint {
    need $pt1, $pt2
    -> Point(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    )
}

end

$pt = Point(5, 3)
say("Point$pt")

$rpt = $pt.oneToRight!
say("Right$rpt")

$mdpt = Point.midpoint($pt, $rpt)
say("Midpoint$mdpt")

$nineteen = 4 + 45 / 3
say("Nineteen: $nineteen")
