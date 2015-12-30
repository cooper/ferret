class String

type NonEmpty {
    isa *class
    satisfies .length != 0
}

type UC {
    isa *class
    transform .uppercase
}

type LC {
    isa *class
    transform .lowercase
}
