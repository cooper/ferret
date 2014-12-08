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
