class EventSet

init {
    want $code: Code
    if $code
        $code(_: *self)
}
