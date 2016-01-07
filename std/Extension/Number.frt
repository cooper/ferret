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
    transform .round
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

prop? even {
    return *self % 2 == 0
}

prop? odd {
    return *self % 2 != 0
}

method root {
    need $root: Num
    return Math.root($root, *self)
}

share $inf = Num("inf")
share $nan = Num("nan")
