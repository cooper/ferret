package IRC
class Bot

init {
    want @commands = (:)
    
    # create a new handlers object which inherits from the bot handlers.
    # this is so that the handlers added to this bot are specific to it.
    @handlers = (:)
    @handlers.*addParent(BotHandlers.handlers)
    
    # connection list
    @conns = []
}

#> adds a connection to this bot
method addConnection {
    need $conn: Connection
    
    # add to connection list
    @conns.push($conn)
    
    # make conn inherit bot handlers.
    # add the bot itself as an argument passed to all
    # events listened upon
    $conn.handlers.*addListener(@handlers, bot: *self)
}

#> removes a connection from this bot
.removeConnection {
    need $conn: Connection
    @conns.remove($conn)
    $conn.handlers.*removeListener(@handlers)
}

#> initializes all connections
method connect {
    for $conn in @conns
        $conn.connect()
}

method description {
    return "IRC::Bot(@conns.length connection@conns.s)"
}
