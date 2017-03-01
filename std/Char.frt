class Char

init {
    need $from: Num | Str
    want $isInit: Bool
    if $isInit:
        return $from

    # TODO: chr()
    if $from.*instanceOf(Num)
        throw Error(:Unimplemented, "not yet implemented")

    if $from.length != 1
        throw Error(:InvalidConversion, "String of length != cannot be Char")

    Char.init($from)(from: $from, isInit: true)
    return $from
}
