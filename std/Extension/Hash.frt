class Hash <K?, V?>

.empty -> @length == 0
.iterator -> HashIterator(*self) : Iterator

class OrderedHash <K?, V?>

init {
    @orderedKeys = []

    # make the object a hash
    Hash<K, V>.init(*self)()
}

.keys -> @orderedKeys

.pushPair {
    need $key: K, $value: V

    # remove the existing location
    if @orderedKeys.remove($key).removed
        overwritten -> true

    *self[$key] = $value
    @orderedKeys.push($key)
}

.iterator {
    $it = HashIterator(*self)
    $it.keysLeft = @orderedKeys.copy()
    -> $it : Iterator
}
