type Char {
    transform _character(from: $_)
}

class _character

init {
    need $from: Num | Str
    want $isInit: Bool
    if $isInit:
        return $from

    # TODO: chr()
    if $from.*instanceOf(Num)
        fail Error(:UnimplementedError, "Not yet implemented")

    if $from.length != 1
        fail Error(:InvalidConversionError, "String of length != 1 cannot be Char")

    _character.init($from)(from: $from, isInit: true)
    return $from
}

prop ord {
    return NATIVE.ord(*self)
}
