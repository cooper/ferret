package IRC
class Channel

init {
    need @conn: Connection
    need @name: Str
    weaken @conn
}

#> Sends a message to the channel
.privmsg {
    need $message: Str::Any
    @conn.sendPrivmsg(@name, $message)
}
