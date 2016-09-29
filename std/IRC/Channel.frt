package IRC
class Channel

init {
    need @connection: Connection
    need @name: Str
    weaken @connection
}

method privmsg {
    need $message: Str
    @connection.privmsg(@name, $message)
}
