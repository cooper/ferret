$point = Math::Point(0, 0);

if $point {
    say("It exists!");
}

inside $point {
    $x = 5;
    $y = 10;
}

say("Point: " + $point.pretty!);