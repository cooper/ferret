class Point

init {
    need $x, $y;
    @x = $x;
    @y = $y;
}

method oneToRight {
    $pt = *class(@x + 1, @y);
    return $pt;
}

method pretty {
    return ("(@x, @y)");
}

main method midpoint {
    need $pt1, $pt2;
    return Point(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    );
}

class Rect

init {
    need $x, $y, $width, $height;
    @width  = $width;
    @height = $height;
    @origin = Point($x, $y);
}

method bottomLeft  { return @origin; }
method bottomRight { return Point(@origin.x + @width, @origin.y); }
method topLeft     { return Point(@origin.x, @origin.y + @height); }
method topRight    { return Point(@origin.x + @width, @origin.y + @height); }

method center {
    $x = @origin.x + @width  * 0.5;
    $y = @origin.y + @height * 0.5;
    return Point($x, $y);
}

$rect = Rect(x: 5, y: 4, width: 12, height: 10);
say($rect.center!.pretty!);
