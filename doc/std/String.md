# String

This is the String class.

A string is basic datatype which stores an arbitrary sequence of bytes,
typically representing characters. String literals are delimited by
double quotes, like so: `"The quick brown fox jumps over the lazy dog"`.



## Methods

### length

```
$string.length
```

Property. Character length of the string.



### uppercase

```
$string.uppercase
```

Property. A string based on the original with an uppercase transformation.



### lowercase

```
$string.lowercase
```

Property. A string based on the original with a lowercase transformation.



### split

```
$string.split()
```

Returns a list of substrings based on the division of the original
string by the provided separator.


* *optional* __separator__: [Str](/doc/std/String.md) | [Rgx](/doc/std/Regex.md) - Substring separator. The default is the empty string, which results
in a list of individual characters.

* *optional* __limit__: [Num](/doc/std/Number.md) - Number of substrings to extract.
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

`.fill()` will also respect indentation. If the provided values are
multi-line, they will be indented at the same depth as the placeholder.

For example, `"Hi <<name>>!".fill(name: "Steve")` returns `"Hi Steve!"`.


* *optional* __valueHash__: Hash - If provided, the keys and values in this hash will be used to
fill the placeholders rather than the named argument pairs.



### hasPrefix

```
$string.hasPrefix($prefix: Str)
```

Returns a boolean true value if the prefix exists.


* __prefix__: [Str](/doc/std/String.md) - Prefix to look for.



### trimPrefix

```
$string.trimPrefix($prefix: Str)
```

Returns a string with the provided substring removed from the
beginning (left side) of the original string. If the string does not
have that prefix, a copy of the original string is returned.


* __prefix__: [Str](/doc/std/String.md) - Prefix to remove.



### hasSuffix

```
$string.hasSuffix($suffix: Str)
```

Returns a boolean true value if the suffix exists.


* __suffix__: [Str](/doc/std/String.md) - Suffix to look for.



### trimSuffix

```
$string.trimSuffix($suffix: Str)
```

Returns a string with the provided substring removed from the
end (right side) of the original string. If the string does not
have that suffix, a copy of the original string is returned.


* __suffix__: [Str](/doc/std/String.md) - Suffix to remove.



## Type interfaces

### NonEmpty

An interface to which only non-empty strings comply.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Str](/doc/std/String.md).
2. __satisfies__: The string length is not zero (`.length != 0`).


### Uppercase

Performs an uppercase transformation.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Str](/doc/std/String.md).
2. __transform__: The string transforms to an uppercase version (`.uppercase`).


### Lowercase

Performs a lowercase transformation.

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Str](/doc/std/String.md).
2. __transform__: The string transforms to an lowercase version (`.lowercase`).


End of the String class.

This file was generated automatically by the Ferret compiler from
String.frtdoc.