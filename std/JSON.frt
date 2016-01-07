class JSON 1.0

alias _PO = NATIVE::PerlObject

# JSON object with default settings
$default ?= *class()

type Charset {
    :ascii      # RFC4627,      range 0..127, ignores otherwise
    :latin1     # iso-8859-1,   range 0..255, ignores otherwise
    :utf8       # expects utf8-encoded input and outputs utf8
}

init {

    # enable strict decoding. this is default.
    # if disabled, shell-style (#) comments are allowed, and extra commas are
    # silently ignored. you may want to disable strict decoding for
    # human-created texts such as configuration files.
    want @strict: Bool = true

    # if true, the same data structure will output the same JSON text each time.
    # this is not the default behavior. without @consistent, the pairs in
    # JSON objects will be spit out in a random order. it is considerably slower
    # when @consistent is enabled because all object keys have to be sorted.
    want @consistent: Bool = false

    # the character set for both encoding and decoding
    want @charset: Charset = :utf8

    # if enabled, the root level of any JSON text (encoded or decoded) must be
    # an array or object. the default is to allow any root level value, which
    # is an extension to RFC4627.
    want @strictRoot: Bool = false

    # if true, .stringify() output will span multiple lines and be properly
    # indented with extra whitespace. this is equivalent to providing all of
    # @indent, @spaceBefore, and @spaceAfter.
    want @pretty: Bool = false

    # if true, .stringify() will add an extra optional space before or after the
    # colon separating keys from values in JSON objects.
    want @spaceBefore: Bool = false
    want @spaceAfter:  Bool = false

    # if true, .stringify() will use a multiline format as output, putting every
    # array member or object/hash key-value pair into its own line, identifying
    # them properly.
    want @indent: Bool = false

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

# encode some data.
method encode {
    need $data
    json -> @xs.encode($data) catch $err:
        fail Error(:JSONError, "JSON encode error", subError: $err)
}

# decode a JSON text.
method decode {
    need $json: Str
    data -> @xs.decode($json) catch $err:
        fail Error(:JSONError, "JSON decode error", subError: $err)
}

# Fragment parsing
# ================
#
# The methods .decoderAdd() and .decoderDone() are for parsing fragments
# of JSON data. This is useful when a very large JSON text is read from a
# network or file stream.
#
# Each call to .decoderAdd() will append a fragment of JSON text to the decoder
# buffer. Once the buffer has enough JSON data to create a value, it will do
# so, and it will add the value to its return buffer.
#
# At the end of a JSON stream, the user should use the .decoderDone() method to
# extract the JSON value(s) from the return buffer. If the JSON decoder found
# multiple values back-to-back, such as '[1,2][3,4]', it will return a list of
# those values, such as [ [1,2], [3,4] ]. If the decoder found a single value,
# only that value is returned.
#
# Because .decoderDone() returns a single value as-is, consider the following:
#
# .decoderAdd('[1,2]')  # this is a JSON list
# .decoderAdd('1 2')    # these are two back-to-back JSON values
#
# .decoderDone().data following either of these would yield the same result,
# a list [1, 2].
#

# add a JSON text fragment to the decoder buffer.
method decoderAdd {
    need $fragment: Str

    # call ->incr_parse in void context.
    # this is to just add text to the buffer.
    @xs.perlCall("incr_parse", $fragment, CONTEXT: "void") catch $err:
        fail Error(:JSONError, "JSON incr_parse() error", subError: $err)

    added -> true
}

# handle the decoder buffer
method decoderDone {

    # call ->incr_parse in list context.
    # this will extract as many objects as possible.
    $objects = @xs.perlCall("incr_parse", CONTEXT: "list") catch $err:
        fail Error(:JSONError, "JSON incr_parse() error", subError: $err)

    if $objects.*instanceOf(List):
        found -> $objects.length

    data -> $objects
}

# reset the decoder buffer
method decoderReset {
    @xs.incr_reset()
}

# method alias stringify = encode
# method alias parse = decode

#######################
### Class functions ###
#######################

func encode {
    need $data
    return $default.encode($data)
}

func decode {
    need $json: Str
    return $default.decode($json)
}

alias stringify = encode
alias parse = decode
