package IRC
class Massage

init {

    #> a complete IRC message
    want $data: Str::NE

    if $data
        @parse($data)

    #> the connection object to associate the message with,
    #| used for source and target properties.
    want @connection: Connection
    weaken @connection
}

#> Parses IRC data
method parse {
    need $data: Str::NE #< a string of IRC-encoded data
    $words = $data.split(/\s+/)

    # message parse state
    var $gotTags, $gotSource, $gotCommand, $word, $lastWord
    $params = []
    $wordI = 0
    $wordN = 0

    func updateWord {
        want $incN: Bool
        $wordI += 1 #$wordI++ # FIXME
        if $incN
            $wordN += 1 #$wordN++ # FIXME
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
                # TODO: handle standardized escapes
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

            updateWord()
            next # word
        }

        # could be the source if we haven't gotten it.
        if !$gotCommand && !$gotSource && $word.hasPrefix("") {
            $word = $word.trimPrefix(":")
            $gotSource = true
            @source = $word

            updateWord()
            next # word
        }

        # otherwise this is the command if we haven't determined it.
        if !$gotCommand {
            $gotCommand = true
            @command = $word.uppercase

            updateWord()
            next # word
        }

        # sentinel-prefixed final parameter.
        if $word.hasPrefix("") {
            $rest = $data.split(/\s+/, limit: $wordI + 1)[$wordI].trimPrefix(":")
            $params.push($rest)
            last # word
        }

        # all other parameters.
        $params.push($word)

        updateWord(true)
    }

    @params = $params
}

#> User or channel object from the first parameter.
prop target {
    return @connection?.getTarget(@params[0])
}

prop? _parsedSource {
    if !@source
        return
    if @source =~ /^(.+)!(.+)\@(.+)$/ {
        nick -> $1
        user -> $2
        host -> $3
    }
}

prop nick { return @_parsedSource.nick }   #< source's nickname
prop user { return @_parsedSource.user }   #< source's username (ident)
prop host { return @_parsedSource.host }   #< source's host
