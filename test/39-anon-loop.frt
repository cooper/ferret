$scopes = [];

func F {
    $outer = *scope
    for $i in 1..10 {
    }
}

inspect(activeObjectCount!)

for $i in 1..100 {
    F()
}

inspect(activeObjectCount!)
