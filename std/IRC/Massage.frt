package IRC
class Massage

init {

    #> a complete IRC message
    want $data: Str::NE
    if $data:
        @parse($data)

    @_rest = []
}

method parse {
    need $data: Str::NE
    $words = $data.split(/\s+/)

    # message parse state
    var $gotTags, $gotSource, $gotCommand, $word, $lastWord
    $params = []
    $wordI = 0
    $wordN = 0

    for $word in $words {

        # first word could be message tags.
        if !$gotSource && !$gotTags && $wordI == 0 && $word.hasPrefix("@") {
            $word.trimPrefix("@")
            $tags = [:]

            # separate tags by semicolon.
            for $tag in $word.split(";") {

                # does the tag have a value?
                $tagParts = $tag.split("=", limit: 2)
                if $tagParts.length > 1 {
                    $tags[ $tagParts[0] ] = $tagParts[1]
                    next # tag
                }

                # no value; it's a boolean
                $tags[ $tag ] = true

            }

            # store tags
            $gotTags = true
            @tags = $tags

            $wordN = $wordN - 1 #$wordN-- FIXME
            next # word
        }

        # could be the source if we haven't gotten it.
        if !$gotCommand && !$gotSource && $word.hasPrefix(":") {
            $word.trimPrefix(":")
            $gotSource = true
            @source = $word

            $wordN = $wordN - 1 #$wordN-- # FIXME
            next # word
        }

        # this is for :rest.
        #@_rest[$wordN] FIXME

        # sentinel-prefixed final parameter.
        if $word.hasPrefix(":") {
            $params.push(@_rest[$wordN])
            last # word
        }

        # all other parameters.
        @params.push($word)

    }

    # FIXME
    continue {
         $wordI = $wordI + 1 #$wordI++ # FIXME
         $wordN = $wordN + 1 #$wordN++ # FIXME
         $lastWord = $word
     }

    @params = $params
}
