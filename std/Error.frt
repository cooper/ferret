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

    want $hints: Hash
    if $hints:
        @hints = _handleHints($hints)
    else:
        @hints = [:]

    want @subError: Error

    NATIVE.bless(*self, "Ferret::Error")
}

method description {
    if @subError:
        return @msg + ": " + @subError.description!
    return @msg
}

func _handleHints {
    need $hints: Hash

}
