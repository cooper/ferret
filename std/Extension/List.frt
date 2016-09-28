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
    $new = []
    for $el in *self:
        $new.push($code($el))
    return $new
}

#> Picks out elements that satisfy a code.
method grep {
    need $code
    $new = []
    for $el in *self {
        if $code($el): $new.push($el)
    }
    return $new
}

#> Finds the first element to satisfy a code.
method first {
    need $code
    for $el in *self {
        if $code($el): return $el
    }
    return undefined
}
