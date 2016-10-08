class Hash <K?, V?>

prop empty {
    return @length == 0
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
