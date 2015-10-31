package Math
class Rect

init {
    need $x: Num, $y: Num, @width: Num, @height: Num;
    @origin = Point($x, $y);
}

method bottomLeft {
    return @origin;
}

method bottomRight {
    return Point(@origin.x + @width, @origin.y);
}

method topLeft {
    return Point(@origin.x, @origin.y + @height);
}

method topRight {
    return Point(@origin.x + @width, @origin.y + @height);
}

method bottomLine {
    return Line(@bottomLeft!, @bottomRight!);
}

method topLine {
    return Line(@topLeft!, @topRight!);
}

method center {
    $x = @origin.x + @width  * 0.5;
    $y = @origin.y + @height * 0.5;
    return Point($x, $y);
}

method description {
    $ox = @origin.x;
    $oy = @origin.y;
    $c  = @center();
    $cx = $c.x;
    $cy = $c.y;
    return "Rect( Origin($ox, $oy); Center($cx, $cy); Width = @width; Height = @height )";
}
