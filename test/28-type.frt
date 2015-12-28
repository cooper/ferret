type Gender {
    :male
    :female
}

func announce {
    need $name: Str, $gender: Gender
    $what = Str($gender).trimPrefix(":")
    say("$name is $what")
}

announce("Robert", :male)
announce("Kris", :female)
announce("Kylie", :female)
announce("Caitlyn", :other) # ignored
