package CORE

#> Matches any object
type Any { }

# FIXME: this is a bad way to match events and functions
#> Matches events and functions
type Code {
    satisfies .name
    satisfies .signature
}

load Signal
load Complex
load Char

load Extension::NATIVE
load Extension::Number
load Extension::String
load Extension::List
load Extension::Hash

load Iterator
load EventSet
load Indexed
