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

.word {
    need $wordI: Num
    if $wordI < 0
        -> @split(/\s+/)[$wordI]
    -> @split(/\s+/, limit: $wordI + 2)[$wordI]
}

.fromWord {
    need $wordN: Num
    if $wordN < 0
        -> @split(/\s+/)[$wordN]
    -> @split(/\s+/, limit: $wordN + 1)[$wordN]
}

.empty? -> @length == 0
