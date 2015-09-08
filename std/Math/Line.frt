package Math
class Line

init {
    need @pt1, @pt2;
}

method midpoint {
    return Point.midpoint(@pt1, @pt2);
}

method length {
    return @pt1.distanceTo(@pt2);
}