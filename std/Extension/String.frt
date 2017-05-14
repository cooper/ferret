class String

type NonEmpty {
    isa *class
    satisfies .length != 0
}

alias NE = NonEmpty

type Uppercase {
    isa *class
    transform .uppercase
}

alias UC = Uppercase

type Lowercase {
    isa *class
    transform .lowercase
}

alias LC = Lowercase

type Any {
    transform Str($_)
}

method word {
    need $wordI: Num
    if $wordI < 0
        return @split(/\s+/)[$wordI]
    return @split(/\s+/, limit: $wordI + 2)[$wordI]
}

method fromWord {
    need $wordN: Num
    if $wordN < 0
        return @split(/\s+/)[$wordN]
    return @split(/\s+/, limit: $wordN + 1)[$wordN]
}

prop lastWord {
    return @word(-1)
}

prop? empty {
    return @length == 0
}
