package CORE

load Error
load Signal

load Extension::Number
load Extension::String
load Extension::List
load Extension::Hash

load Iterator
load EventSet

#> Matches any object
type Any { }

alias Obj = Any
alias Object = Any

# FIXME: this is a bad way to match events and functions
#> Matches events and functions
type Code {
    satisfies .name
    satisfies .signature
}

#> Matches strings of length one
type Char {
    isa Str
    satisfies .length == 1
}

#> Matches objects which can be converted to a hashable form.
type Hashable {
    can .hashValue
    transform .hashValue
}

#> Matches objects that implement element getters and setters.
#| Used for `$obj[idx]` and `$obj[idx] = $val`.
type Indexed {
    can .getValue(index: Hashable)
    can .setValue(value: Obj, index: Hashable)
    can .deleteValue(index: Hashable)
    # optionally can .weakenValue(index: Hashable)
}
