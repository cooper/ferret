package CORE

load Signal

load Extension::Number
load Extension::String

type Hashable {
    can .hashValue()
    transform .hashValue
}

type Indexed {
    can .getValue(index: Hashable)
    can .setValue(value: Obj, index: Hashable)
}
