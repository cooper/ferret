package Math
class Point

init {
    need @x, @y;
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
