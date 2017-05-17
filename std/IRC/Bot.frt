package IRC
class Bot

init {
    want @commands = (:)
    @handlers = (:)
    @handlers.*addParent(BotHandlers.handlers)
    @conns = []
}

method addConnection {
    need $conn: Connection
    
    # add to connection list
    @conns.push($conn)
    
    # make conn inherit bot handlers
    $conn.handlers.*addListener(@handlers, bot: *self)
}

method removeConnection {
    need $conn: Connection
    @conns.remove($conn)
    $conn.handlers.*removeListener(@handlers)
}

method connect {
    for $conn in @conns
        $conn.connect()
}

method description {
    return "IRC::Bot(@conns.length connection@conns.s)"
}
