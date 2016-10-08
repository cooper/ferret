type Iterator {
    can .more           # returns true if there are more elements
    can .nextElement    # returns the next element
  # can .nextElements   # optional, return a list for the same iteration
    can .iterator       # returns itself such that it fits Iterable
}

#> Matches objects which can be iterated over.
type Iterable {
    can .iterator # -> Iterator
}

#> An iterator implementation for lists.
class ListIterator

init {
    need $list: List
    @list = $list.copy()
    @i = -1
}

prop more {
    return @i != @list.lastIndex
}

prop nextElement {
    @i += 1
    return @list[@i]
}

prop iterator {
    return *self
}
