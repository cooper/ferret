#> Objects which conform to this interface are iterators. For an object to be
#> iterated over, it does not have to conform to this interface but Iterable
#> instead. The Iterable object must have a property to return an iterator.
#> They may or may not be the same object.
type Iterator {
    can .more           #< returns true if there are more elements
    can .nextElement    #< returns the next element
    can .iterator       #< returns itself such that it fits Iterable
}

#> Objects can additionally conform to this interface, which allows
#> for ($a, $b, ...) in $collection
type MultiIterator {
    isa Iterator
    can .nextElements   # returns a list of the next elements
}

#> Matches objects which can be iterated over. This means that they have
#> an iterator property which returns an Iterator.
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
    return @i < (@list.lastIndex || -1)
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
