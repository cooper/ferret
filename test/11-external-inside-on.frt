$point = Math::Point(0, 0)

if $point {
    say("The point exists!")
    inspect($point)
}

inside $point {
    $x = 5
    $y = 10
}

say("Point: $point")

on say {
    need $twice, $message
    if $twice:
        say("$message again")
    didTwice -> $twice
}

# note how the signature still determines the first argument
$r = say("It was said", twice: true)

if $r.didTwice:
    say("Did the first one twice!")

say("this should ignore the second parameter", true)
