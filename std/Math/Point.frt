package Math
class Point

init {
    need @x, @y;
}

method distanceTo {
    need $pt2;
    $dx = @x - $pt2.x;
    $dy = @y - $pt2.y;
    return sqrt($dx ^ 2 + $dy ^ 2);
}

method distanceFromOrigin {
    return @distanceTo(*class(0, 0));
}

method pretty {
    return "(@x, @y)";
}

method toString {
    return @pretty();
}

method description {
    return "Point" + @pretty();
}

main method midpoint {
    need $pt1, $pt2;
    return *class(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    );
}

main method distanceBetween {
    need $pt1, $pt2;
    return $pt1.distanceTo($pt2);
}
