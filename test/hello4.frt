func makePoint {
    need $x, $y;
    $point = [
        x: $x,
        y: $y
    ];
    point -> $point;
}

$pt = makePoint(5, 3).point;
say("Point(" + $pt.x + "," + $pt.y + ")");

$numbers = [ 1, 2, 3, 4, 4 + 1 ];
