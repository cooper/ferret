# main

This is the main package.




## JSON

This is the JSON class version 1.0.

Provides JSON serializing and deserializing, done correctly and fast.
Based on [JSON::XS](http://search.cpan.org/perldoc?JSON%3A%3AXS).
Basic operations are accessible via [class functions](#class-functions).
Advanced options are available through the use of a JSON
[class instance](#initializer).


### Initializer

```
$json = JSON()
```

Creates a new JSON class instance.


#### Arguments

* *optional* __strict__: [Bool](/std/doc/Bool.md) - Enables strict decoding. This is default. If explicitly disabled,
shell-style (#) comments are allowed, and extra commas are
silently ignored. You may want to disable `strict` decoding for
human-created texts such as configuration files.

* *optional* __consistent__: [Bool](/std/doc/Bool.md) - If true, the same data structure will output the same JSON text each
time. This is not the default behavior. Without `consistent`, the pairs
in JSON objects will be spit out in a random order. Encoding is
considerably slower when `consistent` is enabled because all object
keys have to be sorted.

* *optional* __charset__: Charset - Specifies the character set used for both encoding and decoding. See
this class's [`Charset`](#charset) type for available options.

* *optional* __strictRoot__: [Bool](/std/doc/Bool.md) - If enabled, the root level of any JSON text (encoded or decoded) must be
an array or object. The default is to allow any root level value, which
is an extension to RFC4627.

* *optional* __pretty__: [Bool](/std/doc/Bool.md) - If true, [`.encode()`](#encode) output will span multiple lines and be
properly indented with extra whitespace. This is equivalent to providing
all of `indent`, `spaceBefore`, and `spaceAfter`.

* *optional* __spaceBefore__: [Bool](/std/doc/Bool.md) - If true, [`.encode()`](#encode) will add an extra optional space before
the colon separating keys from values in JSON objects.

* *optional* __spaceAfter__: [Bool](/std/doc/Bool.md) - If true, [`.encode()`](#encode) will add an extra optional space after
the colon separating keys from values in JSON objects.

* *optional* __indent__: [Bool](/std/doc/Bool.md) - If true, [`.encode()`](#encode) will use a multiline format as output,
putting every array member or object/hash key-value pair into its own
line, identifying them properly.

### Methods

#### encode

```
$json.encode($data)
```

Encodes some data as JSON text.
The output of this method is dependent on the various options provided at
initialization.


##### Arguments

* __data__: Any - An object to convert to JSON text.



#### decode

```
$json.decode($json: Str)
```

Decodes a JSON text.
The success or failure of this method is dependent on the various options
provided at initialization.


##### Arguments

* __json__: [Str](/std/doc/String.md) - A JSON text to parse and convert to a Ferret object.



#### decoderAdd

```
$json.decoderAdd($fragment: Str)
```

Adds a JSON text fragment to the decoder buffer.

The methods [`.decoderAdd()`](#decoderadd) and
[`.decoderDone()`](#decoderdone) are for parsing fragments
of JSON data. This is useful when a very large JSON text is read from a
network or file stream.

Each call to [`.decoderAdd()`](#decoderadd) will append a fragment of JSON
text to the decoder buffer. Once the buffer has enough JSON data to create a
value, it will do so, and it will add the value to its return buffer.

At the end of a JSON stream, the user should use the
[`.decoderDone()`](#decoderdone) method
to extract the JSON value(s) from the return buffer. If the JSON decoder
found multiple values back-to-back, such as `[1,2][3,4]`, it will return a
list of those values, such as `[ [1,2], [3,4] ]`. If the decoder found a
single value, only that value is returned.

Because [`.decoderDone()`](#decoderdone) returns a single value as-is,
different inputs can have the same output. Consider the following

* A JSON list: `.decoderAdd('[1,2]')`
* Two back-to-back values: `.decoderAdd('1 2')`

`.decoderDone().data` following either of these would yield the same result,
a list `[1, 2]`.


##### Arguments

* __fragment__: [Str](/std/doc/String.md) - A fragment of JSON text to add to the decoder buffer.



#### decoderDone

```
$json.decoderDone()
```

Handles the decoder buffer.
See [`.decoderAdd()`](#decoderadd) for an explanation of decoder buffers.





#### decoderReset

```
$json.decoderReset()
```

Resets the decoder buffer.
See [`.decoderAdd()`](#decoderadd) for an explanation of decoder buffers.

### Class functions

#### encode

```
JSON.encode($data)
```

Convenient class function to encode data to a UTF-8 JSON text.
See the [`.encode()`](#encode) method for more options.


##### Arguments

* __data__: Any - An object to convert to JSON text.



#### decode

```
JSON.decode($json: Str)
```

Convenient class function to decode UTF-8 JSON data.
See the [`.decode()`](#decode) method for more options.


##### Arguments

* __json__: [Str](/std/doc/String.md) - A JSON text to parse and convert to a Ferret object.


### Type interfaces

#### Charset

Defines the various character sets available for JSON encoding and decoding.
Used for the `.charset` property. See the [initializer](#initializer).



##### Accepted values

In order to comply, the test object must be equal (according to the `==` [`OP_EQUAL`](/doc/Operators.md#equality-operator) operator) to any one of these values.

* `:ascii` - RFC4627,      range 0..127, ignores otherwise.
* `:latin1` - ISO-8859-1,   range 0..255, ignores otherwise.
* `:utf8` - Expects utf8-encoded input and outputs utf8.


End of the JSON class.






End of the main package.

This file was generated automatically by the Ferret compiler from
[JSON.frt](../JSON.frt).