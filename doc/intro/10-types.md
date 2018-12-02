# Types

Ferret's most basic data types are

* [Object](../std/Object.md) - All Ferret values are objects - `(a: "b", c: "d")`
* [String](../std/String.md) (abbr. Str) - `"Ferret is fun"`
* [Number](../std/Number.md) (abbr. Num) - Real numbers - `3.14`
* [Complex](../std/Complex.md) - Complex numbers - `3+5i`
* [Regex](../std/Regex.md) (abbr. Rgx) - Regular expressions - `/(.*)/`
* [List](../std/List.md) - Ordered lists - `[1, 2, "three"]`
* [Hash](../std/Hash.md) - Key-value maps - `[a: "b", c: "d"]`
* [Boolean](../std/Boolean.md) (abbr. Bool) - `true` and `false`
* [Symbol](../std/Symbol.md) (abbr. Sym) - `:symbol`

Although not really a type, it seems like a good time to mention that
`undefined` is the object representing the absence of a value.

[Next: for loops](11-for-loops.md)