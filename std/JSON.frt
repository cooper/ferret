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

    # if true, .stingify() will add an extra optional space before or after the
    # colon separating keys from values in JSON objects.
    want @spaceBefore: Bool = false
    want @spaceAfter:  Bool = false

    # if true, .stringify() will use a multiline format as output, putting every
    # array member or object/hash key-value pair into its own line, identifying
    # them properly.
    want @indent: Bool = false

    # require JSON::XS.
    _PO.require("JSON::XS") catch $err:
        fail Error(:NativeCodeError,
            "Unable to load JSON::XS",
            subError: $err
        )

    # create the underlying JSON::XS object.
    @xs = _PO("JSON::XS") catch $err:
        fail Error(:NativeCodeError,
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

method encode {
    need $data
    json -> @xs.encode($data) catch $err:
        fail Error(:JSONError, "JSON encode error", subError: $err)
}

method decode {
    need $json: Str
    data -> @xs.decode($json) catch $err:
        fail Error(:JSONError, "JSON decode error", subError: $err)
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
