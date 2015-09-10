$point = Math::Point(0, 0);

if $point {
    say("It exists!");
}

inside $point {
    $x = 5;
    $y = 10;
}

say("Point: " + $point.pretty!);

on say {
    need $twice, $message;
    if $twice: say("$message again");
}

say(message: "test", twice: true);
say("this should ignore the second parameter", true);