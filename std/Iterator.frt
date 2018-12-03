#> Objects which conform to this interface are iterators. For an object to be
#> iterated over, it does not have to conform to this interface but Iterable
#> instead. The Iterable object must have a property to return an iterator.
#> They may or may not be the same object.

type Iterator {
    # can .reset        #< optional, called when we start iterating
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