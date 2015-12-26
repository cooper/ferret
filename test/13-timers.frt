say("hello")

on Timer(5).once!.expire {
    say("five seconds up")
}

$t2 = Timer(2)
on $t2.once!.expire {
    say("this shouldn't be said")
}

$t2.cancel!
