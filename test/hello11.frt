$point = Math::Point(0, 0);

if $point {
    say("It exists!");
}

inside $point {
    $x = 5;
    $y = 10;
}

say("Point: " + $point.pretty!);
dump(say);

on say {
    need $twice, $message;
    say("$message again");
}

say(message: "test", twice: 1);
say("this should ignore the second parameter", 1);