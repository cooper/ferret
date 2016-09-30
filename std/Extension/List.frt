class List

#> Represents a list with an event number of elements, treated as pairs.
#| This is similar to a hash with ordered keys.
type Pairs {
    isa *class
    satisfies .length.even
}

#> Maps each element to another value based on a transformation code.
method map {
    need $code
    return gather for $el in *self {
        take $code($el)
    }
}

#> Picks out elements that satisfy a code.
method grep {
    need $code
    return gather for $el in *self {
        if $code($el): take $el
    }
}

#> Finds the first element to satisfy a code.
method first {
    need $code
    for $el in *self {
        if $code($el): return $el
    }
    return undefined
}

#> Returns true if at least one element satisfies a code.
method any {
    need $code
    for $el in *self {
        if $code($el): return true
    }
    return false
}

#> Returns true if all elements satisfy a code.
method all {
    need $code
    for $el in *self {
        if !$code($el): return false
    }
    return true
}
