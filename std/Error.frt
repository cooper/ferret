class Error 1.0

$hintsAvailable = [
    lastName:       "Name",
    object:         "Object",
    file:           "File",
    line:           "Line"
]

init {
    need @type: Sym
    need @msg: Str

    want $hints
    if $hints:
        @hints = _handleHints($hints)
    else:
        @hints = [:]

    want @subError: Error

    NATIVE.bless(*self, "Ferret::Error")
}

method description {
    inspect(@hints) # FIXME
    if @subError:
        return @msg + ": " + @subError.description!
    return @msg
}

func _handleHints {
    need $hints
    # TODO
    return $hints
}
