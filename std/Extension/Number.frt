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
    return Math.sqrt(*self): Num
}

prop cbrt {
    return @root(3): Num
}

prop square {
    return *self ^ 2: Num
}

prop? even {
    return *self % 2 == 0: Bool
}

prop? odd {
    return *self % 2 != 0: Bool
}

method root {
    need $root: Num
    return Math.root($root, *self): Num
}

share $inf = Num("inf")
share $nan = Num("nan")
