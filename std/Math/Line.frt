package Math
class Line

init {
    need @pt1: Point, @pt2: Point;
}

method midpoint {
    return (@pt1, @pt2).midpoint();
}

method length {
    return @pt1.distanceTo(@pt2);
}
