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

.more -> @i < (@list.lastIndex || -1)

.nextElement {
    @i += 1
    -> @list[@i]
}

.nextElements {
    @i += 1
    -> [ @i, @list[@i] ]
}

.iterator -> *self : Iterator

#> An iterator implementation for hashes.
class HashIterator

init {
    need $hash: Hash
    @hash = $hash.copy()
    @keysLeft = $hash.keys
}

.more -> !@keysLeft.empty

.nextElement {
    $key = @keysLeft.pop()
    -> @hash[$key]
}

.nextElements {
    $key = @keysLeft.pop()
    -> [ $key, @hash[$key] ]
}

.iterator -> *self : Iterator
