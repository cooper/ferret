package Math
class Point

init {
    need @x, @y;
}

method distanceTo {
    need $pt2;
    $dx = @x - $pt2.x;
    $dy = @y - $pt2.y;
    return CORE::sqrt($dx ^ 2 + $dy ^ 2);
}

method distanceFromOrigin {
    return @distanceTo(*class(0, 0));
}

method pretty {
    return "(@x, @y)";
}

main method midpoint {
    need $pt1, $pt2;
    return Point(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    );
}
