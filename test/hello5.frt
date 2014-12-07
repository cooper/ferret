class Point 1.0

need $x, $y;

init {
    need $x, $y;
    @x = $x;
    @y = $y;
}

method oneToRight {
    $pt = Point(@x + 1, @y);
    return $pt;
}

method pretty {
    return ("(" + @x + ", " + @y + ")");
}

main method midpoint {
    need $pt1, $pt2;
    return Point(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    );
}

$pt = Point(5, 3);
say("Created a point  : " + $pt.pretty!);
say("One to the right : " + $pt.oneToRight!.pretty!);


$nineteen = 4 + 5 * 3;
