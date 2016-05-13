package CORE

load Error
load Signal

load Extension::Number
load Extension::String
load Extension::List

type Any { }

alias Obj = Any
alias Object = Any

type Hashable {
    can .hashValue()
    transform .hashValue
}

type Indexed {
    can .getValue(index: Hashable)
    can .setValue(value: Obj, index: Hashable)
}
