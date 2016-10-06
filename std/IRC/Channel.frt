package IRC
class Channel

init {
    need @connection: Connection
    need @name: Str
    weaken @connection
}

#> Sends a message to the channel
method privmsg {
    need $message: Str::Any
    @connection.sendPrivmsg(@name, $message)
}
