package IRC
class Connection

#> Joins a channel
method join {
    need $channelNames: Str...
    for $name in $channelNames:
        @send("JOIN $name")
}

#> Sends a message
method privmsg {
    need $target: Str, $message: Str
    @send("PRIVMSG $target :$message")
}
