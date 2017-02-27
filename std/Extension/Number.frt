class Number

type Even {
    isa *class
    satisfies .even
}

type Odd {
    isa *class
    satisfies .odd
}

type Integer {
    isa *class
    transform .floor
}

alias Int = Integer

prop sqrt {
    return Math.sqrt(*self)
}

prop cbrt {
    return @root(3)
}

prop square {
    return *self ^ 2
}

prop even {
    return *self % 2 == 0
}

prop odd {
    return *self % 2 != 0
}

method root {
    need $root: Num
    return Math.root($root, *self)
}

method factorial {
    $new = 1
    if *self < 2:
        return *self
    for $i in *self..2:
        $new *= $i
    return $new
}

method toFunction {
    return @factorial
}

share $inf = Num("inf")
share $nan = Num("nan")
