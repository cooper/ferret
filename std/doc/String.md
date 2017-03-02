# String

This is the String class.

A string is basic datatype which stores an arbitrary sequence of bytes,
typically representing characters. String literals are delimited by
double quotes, like so: `.



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

* *optional* __separator__: [String](/std/doc/String.md) | [Regex](/std/doc/Regex.md) - The substring separator. The default is the empty string, which results
in a list of individual characters.

* *optional* __limit__: [Number](/std/doc/Number.md) - The number of substrings to extract.
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

For example, `.


#### Arguments

* *optional* __valueHash__: Hash - If provided, the keys and values in this hash will be used to
fill the placeholders rather than the named argument pairs.



### hasPrefix

```
$string.hasPrefix($prefix: Str)
```

Returns a boolean true value if the prefix exists.


#### Arguments

* __prefix__: [String](/std/doc/String.md) - The prefix to look for.



### trimPrefix

```
$string.trimPrefix($prefix: Str)
```

Returns a string with the provided substring removed from the
beginning (left side) of the original string. If the string does not
have that prefix, a copy of the original string is returned.


#### Arguments

* __prefix__: [String](/std/doc/String.md) - The prefix to remove.



### hasSuffix

```
$string.hasSuffix($suffix: Str)
```

Returns a boolean true value if the suffix exists.


#### Arguments

* __suffix__: [String](/std/doc/String.md) - The suffix to look for.



### trimSuffix

```
$string.trimSuffix($suffix: Str)
```

Returns a string with the provided substring removed from the
end (right side) of the original string. If the string does not
have that suffix, a copy of the original string is returned.


#### Arguments

* __suffix__: [String](/std/doc/String.md) - The suffix to remove.





## Type interfaces

### NonEmpty

An interface to which only non-empty strings comply.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [String](/std/doc/String.md).
2. __satisfies__: The string length is not zero (`.length != 0`).


### Uppercase

Performs an uppercase transformation.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [String](/std/doc/String.md).
2. __transform__: The string transforms to an uppercase version (`.uppercase`).


### Lowercase

Performs a lowercase transformation.


#### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __isa__: Must be an instance of [String](/std/doc/String.md).
2. __transform__: The string transforms to an lowercase version (`.lowercase`).


End of String class.

This file was generated automatically by the Ferret compiler from
[String.frtdoc](../String.frtdoc).