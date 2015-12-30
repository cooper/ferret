class String

type NonEmpty {
    isa String
    satisfies .length != 0
}

type UC {
    isa String
    transform .uppercase
}

type LC {
    isa String
    transform .lowercase
}
