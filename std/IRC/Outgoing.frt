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

#> Request a new nickname
# note that we don't set @me.nick until it is acknowledged
method requestNick {
    need $nick: Str
    @send("NICK $nick")
}
