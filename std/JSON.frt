class JSON 1.0

#< Provides JSON serialising/deserialising, done correctly and fast.
#| Based on [JSON::XS](http://search.cpan.org/perldoc?JSON%3A%3AXS).
#| Basic operations are accessible via class functions. Advanced options are
#| available through the use a JSON class instance.

alias _PO = NATIVE::PerlObject

# JSON object with default settings
$default ?= *class()

#> Defines the various character sets available for JSON encoding and decoding.
type Charset {
    :ascii      #<  RFC4627,      range 0..127, ignores otherwise
    :latin1     #<  iso-8859-1,   range 0..255, ignores otherwise
    :utf8       #<  expects utf8-encoded input and outputs utf8
}

init {

    want @strict: Bool = true
    #<  Enables strict decoding. This is default.
    #|  If disabled, shell-style (#) comments are allowed, and extra commas are
    #|  silently ignored. You may want to disable strict decoding for
    #|  human-created texts such as configuration files.

    want @consistent: Bool = false
    #<  If true, the same data structure will output the same JSON text each
    #|  time. This is not the default behavior. without `@consistent`, the pairs
    #|  in JSON objects will be spit out in a random order. Encoding is
    #|  considerably slower when `@consistent` is enabled because all object
    #|  keys have to be sorted.

    want @charset: Charset = :utf8
    #<  The character set used for both encoding and decoding

    want @strictRoot: Bool = false
    #<  If enabled, the root level of any JSON text (encoded or decoded) must be
    #|  an array or object. The default is to allow any root level value, which
    #|  is an extension to RFC4627.

    want @pretty: Bool = false
    #<  If true, `.encode()` output will span multiple lines and be properly
    #|  indented with extra whitespace. This is equivalent to providing all of
    #|  `@indent`, `@spaceBefore`, and `@spaceAfter`.

    want @spaceBefore: Bool = false
    #<  If true, `.encode()` will add an extra optional space before the
    #|  colon separating keys from values in JSON objects.

    want @spaceAfter:  Bool = false
    #<  If true, `.encode()` will add an extra optional space after
    #|  the colon separating keys from values in JSON objects.

    want @indent: Bool = false
    #<  If true, `.encode()` will use a multiline format as output, putting
    #|  every array member or object/hash key-value pair into its own line,
    #|  identifying them properly.

    # require JSON::XS.
    _PO.require("JSON::XS") catch $err:
        fail Error(:PerlRequireFailed,
            "Unable to load JSON::XS",
            subError: $err
        )

    # create the underlying JSON::XS object.
    @xs = _PO("JSON::XS") catch $err:
        fail Error(:PerlConstructorFailed,
            "Could not create JSON::XS object",
            subError: $err
        )

    # set properties.
    @xs.[@charset]!                                     # charset
    if @pretty:         @xs.pretty!                     # pretty output
    if @spaceBefore:    @xs.spaceBefore!                # space before colon
    if @spaceAfter:     @xs.spaceAfter!                 # space after colon
    if @indent:         @xs.indent!                     # indented output
    if !@strict:        @xs.relaxed!                    # strict parsing
    if @consistent:     @xs.canonical!                  # sort keys
    if !@strictRoot:    @xs.allow_nonref!               # reference only root

    # TODO: allow_unknown, allow_blessed, convert_blessed.

}

#>  Encodes some data as JSON text.
method encode {
    need $data
    json -> @xs.encode($data) catch $err:
        fail Error(:JSONError, "JSON encode error", subError: $err)
}

#>  Decodes a JSON text.
method decode {
    need $json: Str
    data -> @xs.decode($json) catch $err:
        fail Error(:JSONError, "JSON decode error", subError: $err)
}

#>  Adds a JSON text fragment to the decoder buffer.
#|
#|  The methods `.decoderAdd()` and `.decoderDone()` are for parsing fragments
#|  of JSON data. This is useful when a very large JSON text is read from a
#|  network or file stream.
#|
#|  Each call to `.decoderAdd()` will append a fragment of JSON text to the
#|  decoder buffer. Once the buffer has enough JSON data to create a value, it
#|  will do so, and it will add the value to its return buffer.
#|
#|  At the end of a JSON stream, the user should use the .decoderDone() method
#|  to extract the JSON value(s) from the return buffer. If the JSON decoder
#|  found multiple values back-to-back, such as `[1,2][3,4]`, it will return a
#|  list of those values, such as `[ [1,2], [3,4] ]`. If the decoder found a
#|  single value, only that value is returned.
#|
#|  Because .`decoderDone()` returns a single value as-is, consider the
#|  following:
#|
#|  * A JSON list: `.decoderAdd('[1,2]')`
#|  * Two back-to-back values: `.decoderAdd('1 2')`
#|
#|  `.decoderDone().data` following either of these would yield the same result,
#|  a list `[1, 2]`.
#|
method decoderAdd {
    need $fragment: Str

    # call ->incr_parse in void context.
    # this is to just add text to the buffer.
    @xs.perlCall("incr_parse", $fragment, CONTEXT: "void") catch $err:
        fail Error(:JSONError, "JSON incr_parse() error", subError: $err)

    added -> true
}


#>  Handles the decoder buffer.
#|
#|  See `.decoderAdd()` for an explanation of decoder buffers.
#|
method decoderDone {

    # call ->incr_parse in list context.
    # this will extract as many objects as possible.
    $objects = @xs.perlCall("incr_parse", CONTEXT: "list") catch $err:
        fail Error(:JSONError, "JSON incr_parse() error", subError: $err)

    if $objects.*instanceOf(List):
        found -> $objects.length

    data -> $objects
}

#>  Resets the decoder buffer.
#|
#|  See `.decoderAdd()` for an explanation of decoder buffers.
#|
method decoderReset {
    @xs.incr_reset()
}

# method alias stringify = encode
# method alias parse = decode

#######################
### Class functions ###
#######################

#>  Convenient class function to encode JSON data. See the `.encode()` method.
func encode {
    need $data
    return $default.encode($data)
}

#>  Convenient class function to decode JSON data. See the `.decode()` method.
func decode {
    need $json: Str
    return $default.decode($json)
}

alias stringify = encode
alias parse = decode
