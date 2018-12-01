package IRC
class Connection

#> Joins a channel
.sendJoin {
    need $channelNames: Str...
    for $name in $channelNames:
        @send("JOIN $name")
}

#> Sends a message
.sendPrivmsg {
    need $target: Str, $message: Str::Any
    for $line in $message.split("\n") {
        if $line.empty; next
        @send("PRIVMSG $target :$line")
    }
}

#> Request a new nickname
# note that we don't set @me.nick until it is acknowledged
.sendNick {
    need $nick: Str
    @send("NICK $nick")
}
