$parts = "s p a m".split(" ");

for ($i, $part) in $parts {
    on Timer($i).once().expire {
        say("($i) $part");
    }
}

for $part in [1, 2, 3] {
    say($part);
}
