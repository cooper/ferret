class OrderedHash <K?, V?>

init {
    @orderedKeys = []

    # make the object a hash
    Hash<K, V>.init(*self)()
}

.keys -> @orderedKeys

.setValue {
    need $value: V, $index: K
    @orderedKeys.removeAll($index)
    @orderedKeys.push($index)
    -> Hash.proto.setValue(_self: *self, $value, $index)
}

.deleteValue {
    need $index: K
    @orderedKeys.removeAll($index)
    -> Hash.proto.deleteValue(_self: *self, $index)
}

.pushPair {
    need $key: K, $value: V

    # remove the existing location
    if @orderedKeys.remove($key).removed
        overwritten -> true

    *self[$key] = $value
    @orderedKeys.push($key)
}