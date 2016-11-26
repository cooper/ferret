package IRC
class Bot

init {
    want @commands = (:)
    @handlers = (:)
    @handlers.*addParent(BotHandlers.handlers)
    @conns = []
}

method addConnection {
    need $connection: Connection
    @conns.push($connection)
    $connection.handlers.*addParent(@handlers)
    $connection.handlers.*addListener(@handlers, bot: *self)
}

method removeConnection {
    need $connection: Connection
    @conns.remove($connection)
    $connection.handlers.*removeParent(@handlers)
    @connection.handlers.*removeListener(@handlers)
}

method connect {
    for $c in @conns
        $c.connect()
}

method description {
    $s = ""
    if @conns.length != 1: $s = "s"
    return "IRC::Bot(@conns.length connection$s)"
}
