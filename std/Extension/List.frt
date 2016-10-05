class List <T?>

#> Represents a list with an event number of elements, treated as pairs.
#| This is similar to a hash with ordered keys.
type Pairs {
    isa *class
    satisfies .length.even
}

#> Maps each element to another value based on a transformation code.
method map {
    need $code: Code
    return gather for $el in *self {
        take $code($el)
    }
}

#> Picks out elements that satisfy a code.
method grep {
    need $code: Code
    return gather for $el in *self {
        if $code($el): take $el
    }
}

#> Finds the first element to satisfy a code.
method first {
    need $code: Code
    for $el in *self {
        if $code($el): return $el
    }
    return undefined
}

#> Returns true if at least one element satisfies a code.
method any {
    need $code: Code
    for $el in *self {
        if $code($el): return true
    }
    return false
}

#> Returns true if all elements satisfy a code.
method all {
    need $code: Code
    for $el in *self {
        if !$code($el): return false
    }
    return true
}

#> Returns the sum of all elements in the list or `undefined` if the list is
#| empty.
prop sum {
    if @length == 0 :
        return undefined
    $c = *self[0]
    for $i in 1 .. @lastIndex {
        $c = $c + *self[$i]
    }
    return $c
}

#> Returns the sum of all elements in the list or `0` (zero) if the list is
#| empty. Useful for lists of numbers.
prop sum0 {
    $c = 0
    for $el in *self {
        $c = $c + $el
    }
    return $c
}
