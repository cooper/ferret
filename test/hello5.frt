class Point 1.0

need $x, $y;

init {
    need $x, $y;
    @x = $x;
    @y = $y;
}

method oneToRight {
    $pt = Point(@x + 1, @y);
    point  -> $pt;
    pretty -> $pt.pretty!;
}

method pretty {
    text -> ("(" + @x + ", " + @y + ")");
}

$pt = Point(5, 3);
say("Created a point  : " + $pt.pretty!.text);
say("One to the right : " + $pt.oneToRight!.pretty.text);
