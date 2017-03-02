package CORE

#> Matches objects which can be converted to a hashable form.
type Hashable {
    can .hashValue
    transform .hashValue
}

#> Matches objects that implement element getters.
#| Used for `$obj[idx]`.
type IndexedRead {
    can .getValue(index: Any)
}

#> Matches objects that implement element setters.
#| Used for `$obj[idx] = $val`.
type IndexedWrite {
    can .setValue(value: Any, index: Any)
    can .deleteValue(index: Any)
    # optionally can .weakenValue(index: Hashable)
}

#> Matches objects that implement element getters and setters.
#| Used for `$obj[idx]` and `$obj[idx] = $val`.
type Indexed {
    isa IndexedRead
    isa IndexedWrite
}
