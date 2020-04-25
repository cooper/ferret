class List <T?>

#> Represents a list with an event number of elements, treated as pairs.
#| This is similar to a hash with ordered keys.
type Pairs {
    isa *class
    satisfies .length.even
}

#> True if the list is empty.
.empty -> @length == 0

#> Returns a copy of the list by mapping each element to another value based on
#| a transformation code.
.map {
    need $code: Code
    -> gather for $el in *self {
        take $code($el)
    }
}

#> Returns a copy of the list containing only the elements that satisfy a code.
.grep {
    need $code: Code
    -> gather for $el in *self {
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
    -> $new
}

#> Returns a reversed copy of the list.
method reverse {
    if @empty
        -> *self
    -> gather for $i in @lastIndex..0:
        take *self[$i]
}

#> Copies the list, ignoring all possible occurrences of a specified value.
method withoutAll {
    need $what
    -> @grep! { -> $what != $_ }
    # -> @grep(func { -> $what != $_ })
}

#> Copies the list, ignoring the first occurrence of a specified value.
method without {
    need $what
    var $found
    -> gather for ($i, $el) in *self {
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
    -> @any! { -> $what == $_ }
}

#> Finds the first element to satisfy a code.
method first {
    need $code: Code
    for $el in *self {
        if $code($el): -> $el
    }
    -> undefined
}

#> Returns the index of the first occurrence of the given value
method indexOf {
    need $what
    for ($i, $el) in *self {
        if $what == $el: -> $i
    }
    -> undefined
}

#> Returns true if at least one element satisfies a code.
method any {
    need $code: Code
    for $el in *self {
        if $code($el): -> true
    }
    -> false
}

#> Returns true if all elements satisfy a code.
method all {
    need $code: Code
    for $el in *self {
        if !$code($el): -> false
    }
    -> true
}

#> Returns the sum of all elements in the list or `undefined` if the list is
#| empty.
.sum {
    if @empty
        -> undefined
    $c = *self[0]
    for $i in 1 .. @lastIndex {
        $c = $c + *self[$i]
    }
    -> $c
}

#> Returns the sum of all elements in the list or `0` (zero) if the list is
#| empty. Useful for lists of numbers.
.sum0 {
    $c = 0
    for $el in *self {
        $c = $c + $el
    }
    -> $c
}

#> Returns the first element in the list.
.firstItem -> *self[0]

#> Returns the last element in the list.
.lastItem -> *self[@lastIndex]

#> If the list has length one, returns an empty string, otherwise `"s"`
.s {
    if @length == 1
        -> ""
    -> "s"
}

#> Returns an iterator for the list. This allows lists to be used in a for loop.
.iterator -> ListIterator(*self) : Iterator

#> Adding lists together results in an ordered consolidation of the lists.
op + {
    need $rhs: List
    $new = @copy()
    $new.push(items: $rhs)
    -> $new
}

#> Subtracting list B from list A results in a new list containing all elements
#| found in A but not found in B. Example: `[1,2,3,4,5] - [3,5]` -> `[1,2,4]`.
op - {
    need $rhs: List
    $new = @copy()
    for $remove in $rhs:
        $new.removeAll($remove)
    -> $new
}

#> Lists are equal if all the elements are equal and in the same order.
op == {
    need $ehs: List

    # first check if length is same
    if @length != $ehs.length
        -> false

    # check each item
    for ($i, $val) in *self {
        if $ehs[$i] != $val
            -> false
    }

    -> true
}

# Iterator methods

.iterator -> *self

method reset {
    @i = -1
}

.more -> @i < (@lastIndex || -1)

.nextElement {
    @i += 1
    -> *self[@i]
}

.nextElements {
    @i += 1
    -> [ @i, *self[@i] ]
}