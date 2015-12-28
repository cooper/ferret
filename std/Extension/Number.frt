class Number

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
