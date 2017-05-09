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

#> Returns a flattened copy of the list.
method flatten {
    $new = []
    for $el in *self {
        if $el.*isa(List)
            $new.push(items: $el.flatten())
        else
            $new.push($el)
    }
    return $new
}

#> Returns a reversed copy of the list.
method reverse {
    $new = []
    return gather for $i in @lastIndex..0:
        take *self[$i]
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
        if $what != $el
            next
        @splice($i, 1)
        removed -> true
        last
    }
}

#> Removes all elements equal to a specified value.
method removeAll {
    need $what

    # find the indices at which the value occurs
    $indices = gather for ($i, $el) in *self {
        if $what != $el
            next
        take $i
    }

    # remove
    for $i in $indices.reverse!
        @splice($i, 1)

    removed -> $indices.length    #< number of removed elements
}

#> Returns true if the list contains at least one occurrence of the provided
#| value.
method contains {
    need $what
    return @any! { -> $what == $_ }
}

#> Finds the first element to satisfy a code.
method first {
    need $code: Code
    for $el in *self {
        if $code($el): return $el
    }
    return undefined
}

#> Returns the index of the first occurrence of the given value
method indexOf {
    need $what
    for ($i, $el) in *self {
        if $what == $el: return $i
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
    if @empty
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

#> Returns an iterator for the list. This allows lists to be used in a for loop.
prop iterator {
    return ListIterator(*self) : Iterator
}

#> Adding lists together results in an ordered consolidation of the lists.
method + {
    need $rhs: List
    $new = @copy()
    $new.push(items: $rhs)
    return $new
}

#> Subtracting list B from list A results in a new list containing all elements
#| found in A but not found in B. Example: `[1,2,3,4,5] - [3,5]` -> `[1,2,4]`.
method - {
    need $rhs: List
    $new = @copy()
    for $remove in $rhs:
        $new.removeAll($remove)
    return $new
}
