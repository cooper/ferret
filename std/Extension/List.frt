class List <T?>

#> Represents a list with an event number of elements, treated as pairs.
#| This is similar to a hash with ordered keys.
type Pairs {
    isa *class
    satisfies .length.even
}

#> True if the list is empty.
prop empty {
    return @length == 0
}

#> Returns a copy of the list by mapping each element to another value based on
#| a transformation code.
method map {
    need $code: Code
    return gather for $el in *self {
        take $code($el)
    }
}

#> Returns a copy of the list containing only the elements that satisfy a code.
method grep {
    need $code: Code
    return gather for $el in *self {
        if $code($el): take $el
    }
}

#> Copies the list, ignoring all possible occurrences of a specified value.
method withoutAll {
    need $what
    return @grep! { -> $what != $_ }
    #return @grep(func { -> $what != $_ })
}

#> Copies the list, ignoring the first occurrence of a specified value.
method without {
    need $what
    var $found
    return gather for ($i, $el) in *self {
        if !$found && $what == $el {
            $found = true
            next
        }
        take $el
    }
}

#> Removes the first element equal to a specified value.
method remove {
    need $what
    removed -> false
    for ($i, $el) in *self {
        if $what != $el:
            next
        # FIXME: delete *self[$i]
        found   -> $el
        removed -> true
        last
    }
}

#> Removes all elements equal to a specified value.
method removeAll {
    need $what
    $found = gather for ($i, $el) in *self {
        if $what != $el:
            next
        # FIXME: delete *self[$i]
        take $el
    }
    found   -> $found           #< list of removed elements
    removed -> $found.length    #< number of removed elements
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
    if @empty:
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
