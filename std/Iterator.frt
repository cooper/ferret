type Iterator {
    can .more           # returns true if there are more elements
    can .nextElement    # returns the next element
    can .iterator       # returns itself such that it fits Iterable
}

type MultiIterator {
    isa Iterator
    can .nextElements   # returns a list of the next elements
}

#> Matches objects which can be iterated over.
type Iterable {
    can .iterator -> Iterator
}

#> An iterator implementation for lists.
class ListIterator

init {
    need $list: List
    @list = $list.copy()
    @i = -1
}

prop more {
    return @i != (@list.lastIndex || -1)
}

prop nextElement {
    @i += 1
    return @list[@i]
}

prop nextElements {
    @i += 1
    return [ @i, @list[@i] ]
}

prop iterator {
    return *self : Iterator
}

#> An iterator implementation for hashes.
class HashIterator

init {
    need $hash: Hash
    @hash = $hash.copy()
    @keysLeft = $hash.keys
}

prop more {
    return !@keysLeft.empty
}

prop nextElement {
    $key = @keysLeft.pop()
    return @hash[$key]
}

prop nextElements {
    $key = @keysLeft.pop()
    return [ $key, @hash[$key] ]
}

prop iterator {
    return *self : Iterator
}
