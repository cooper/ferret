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

$pt = Point(5, 3);
say("Created a point  : " + $pt.pretty!);
say("One to the right : " + $pt.oneToRight!.pretty!);
