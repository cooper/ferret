# String

This is the String class version 1.0.

A string is basic datatype which stores an arbitrary sequence of bytes,
typically representing characters. String literals are delimited by
double quotes, like so: `"The quick brown fox jumps over the lazy dog"`.



## Methods

### length

```
$string.length
```

Computed property. The length of the string.



### uppercase

```
$string.uppercase
```

Computed property. A string based on the original with an uppercase transformation.



### lowercase

```
$string.lowercase
```

Computed property. A string based on the original with a lowercase transformation.



### split

```
$string.split()
```

Returns a list of substrings based on the division of the original
string by the provided separator.


#### Arguments

* *optional* __separator__: [String](/doc/std/String.md) | [Regex](/doc/std/Regex.md) - the substring separator. The default is the empty string, which results
in a list of individual characters.

* *optional* __limit__: [Number](/doc/std/Number.md) - the number of substrings to extract.
If specified, the returned list will have at most this number
of strings. The final string in that list may include occurrences
of the separator.



### fill

```
$string.fill()
```

Returns a string based on the original string with placeholders within
the delimiters `<<` and `>>` replaced with the provided values.

This method takes named arguments whose values should be strings or
objects capable of string conversion.

For example, `"Hi <<name>>!".fill(name: "Steve")` returns `"Hi Steve!"`.


#### Arguments

* *optional* __valueHash__: Hash - If provided, the keys and values in this hash will be used to
fill the placeholders rather than the named argument pairs.



### hasPrefix

```
$string.hasPrefix($prefix: Str)
```

Returns a boolean true value if the prefix exists.


#### Arguments

* __prefix__: [String](/doc/std/String.md) - the prefix to look for.



### trimPrefix

```
$string.trimPrefix($prefix: Str)
```

Returns a string with the provided substring removed from the
beginning of the original string. If the string does not
have that prefix, the original string is returned.


#### Arguments

* __prefix__: [String](/doc/std/String.md) - the prefix to remove.




## Type interfaces

### NonEmpty

An interface to which only non-empty strings comply.




### Uppercase

Performs an uppercase transformation.




### Lowercase

Performs a lowercase transformation.


End of String class.

This file was generated automatically by the Ferret compiler from
[String.frtdoc](../String.frtdoc).