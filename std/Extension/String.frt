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
