type Char {
    transform _character(from: $_)
}

class _character

init {
    need $from: Num | Str

    # TODO: chr()
    if $from.*isa(Num)
        fail Error(:UnimplementedError, "Not yet implemented")

    if $from.length != 1
        fail Error(:InvalidConversionError, "String of length != 1 cannot be Char")

    _character.init($from)(isInit: true) catch $e:
        throw $e

    -> $from
}

init {
    need $isInit = true
}

.ord -> NATIVE.ord(*self)
