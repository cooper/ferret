package CORE

load Error
load Signal

load Extension::Number
load Extension::String
load Extension::List
load Extension::Hash

type Any { }

alias Obj = Any
alias Object = Any

# FIXME: this is a bad way to match events and functions
type Code {
    satisfies .name
    satisfies .signature
}

type Hashable {
    can .hashValue()
    transform .hashValue
}

type Indexed {
    can .getValue(index: Hashable)
    can .setValue(value: Obj, index: Hashable)
}
