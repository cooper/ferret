package IRC
class Massage

init {

    #> a complete IRC message
    want $data: Str::NE
    @_rest = []

    if $data:
        @parse($data)
}

method parse {
    need $data: Str::NE
    $words = $data.split(/\s+/)

    # message parse state
    var $gotTags, $gotSource, $gotCommand, $word, $lastWord
    $params = []
    $wordI = 0
    $wordN = 0

    func updateWord {
        $wordI = $wordI + 1 #$wordI++ # FIXME
        $wordN = $wordN + 1 #$wordN++ # FIXME
        $lastWord = $word
    }

    for $word in $words {

        # first word could be message tags.
        if !$gotSource && !$gotTags && $wordI == 0 && $word.hasPrefix("@") {
            $word = $word.trimPrefix("@")
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
            updateWord()
            next # word
        }

        # could be the source if we haven't gotten it.
        if !$gotCommand && !$gotSource && $word.hasPrefix(":") {
            $word = $word.trimPrefix(":")
            $gotSource = true
            @source = $word

            $wordN = $wordN - 1 #$wordN-- # FIXME
            updateWord()
            next # word
        }

        # otherwise this is the command if we haven't determined it.
        if !$gotCommand {
            $gotCommand = true
            @command = $word

            $wordN = $wordN - 1 #$wordN-- # FIXME
            updateWord()
            next # word
        }

        # this is for :rest.
        if $wordN >= 0:
            @_rest[$wordN] = $data.split(/\s+/, limit: $wordI + 1)[$wordI].trimPrefix(":")

        # sentinel-prefixed final parameter.
        if $word.hasPrefix(":") {
            $params.push(@_rest[$wordN])
            last # word
        }

        # all other parameters.
        $params.push($word)

        updateWord()
    }

    @params = $params
}
