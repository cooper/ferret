package Math
class Rect

init {
    need $x: Num, $y: Num, @width: Num, @height: Num;
    @origin = Point($x, $y);
}

prop vertices {
    return [
        @topLeft,
        @topRight,
        @bottomLeft,
        @bottomRight
    ];
}

prop bottomLeft {
    return @origin;
}

prop bottomRight {
    return Point(@origin.x + @width, @origin.y);
}

prop topLeft {
    return Point(@origin.x, @origin.y + @height);
}

prop topRight {
    return Point(@origin.x + @width, @origin.y + @height);
}

prop bottomLine {
    return Line(@bottomLeft, @bottomRight);
}

prop topLine {
    return Line(@topLeft, @topRight);
}

prop center {
    $x = @origin.x + @width  * 0.5;
    $y = @origin.y + @height * 0.5;
    return Point($x, $y);
}

method description {
    $o = @origin;
    $c = @center;
    return "Rect( Origin($o.x, $o.y); Center($c.x, $c.y); Width = @width; Height = @height )";
}
