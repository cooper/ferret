package IRC
class Bot

init {
    want @commands = (:)
    want @handlers = (:)
    @conns = []
}

method addConnection {
    need $connection: Connection
    @conns.push($connection)
    $connection.handlers.*addListener(@handlers, bot: *self)
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
