package IRC
class Message

init {

    #> a complete IRC message
    want $data: Str::NonEmpty
    if $data:
        @parse($data)


}

method parse {
    need $data: Str::NonEmpty
    #$words = $data.split(/\s+/)
}
