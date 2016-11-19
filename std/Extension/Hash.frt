class Hash <K?, V?>

prop empty {
    return @length == 0
}

prop iterator {
    return HashIterator(*self): Iterator
}

class OrderedHash <K?, V?>

init {
    @orderedKeys = []

    # make the object a hash
    Hash<K, V>.init(*self)()
}

prop keys {
    return @orderedKeys
}

method pushPair {
    need $key: K, $value: V

    # remove the existing location
    if @orderedKeys.remove($key).removed:
        overwritten -> true

    *self[$key] = $value
    @orderedKeys.push($key)
}

prop iterator {
    $it = HashIterator(*self)
    $it.keysLeft = @orderedKeys.copy()
    return $it: Iterator
}
