package IRC
class Message

init {

    #> a complete IRC message
    want $data: Str::NonEmpty
    if $data:
        @parse($data)

    @_rest = []
}

method parse {
    need $data: Str::NonEmpty
    $words = $data.split(/\s+/)

    # FIXME: allow commas
    var $got_tags
    var $got_source
    var $got_command
    var $word
    var $last_word

    $params = []
    $word_i = 0
    $word_n = 0

    for $word in $words {

        # first word could be message tags.
        if !$got_source && !$got_tags && $word_i == 0 && $word.hasPrefix("@") {
            $word.trimPrefix("@")
            $tags = [:]

            # separate tags by semicolon.
            for $tag in $word.split(";") {

                # does the tag have a value?
                $tagParts = $tag.split("=", limit: 2)
                if $tagParts.length > 1 {
                    $tags[ $tagParts[0] ] = $tagParts[1]
                    next #tag
                }

                # no value; it's a boolean
                $tags[ $tag ] = true

            }

            # store tags
            $got_tags = true
            @tags = $tags

            #$word_n-- FIXME
            next # word
        }

        # could be the source if we haven't gotten it.
        if !$got_command && !$got_source && $word.hasPrefix(":") {
            $word.trimPrefix(":")
            $got_source = true
            @source = $word

            #$word_n-- # FIXME
            next #word
        }

        # this is for :rest.
        #@_rest[$word_n] FIXME

        # sentinel-prefixed final parameter.
        if $word.hasPrefix(":") {
            $params.push(@_rest[$word_n])
            last # word
        }

        # all other parameters.
        @params.push($word)

    }

    # FIXME
    # continue {
    #     $word_i++
    #     $word_n++
    #     $last_word = $word
    # }

    @params = $params
}
