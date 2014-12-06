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
