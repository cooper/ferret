package IRC
class Bot

init {
    want @commands = (:)
    @conns = []
}

method addConnection {
    need $connection: Connection
    @conns.push($connection)

    $bot = *self
    weaken $bot

    # TODO: need better way to do this
    on $connection.handlers.PRIVMSG, :handleCommand {
        need $msg

        # commands only work in channels right now
        if !$msg.target.*instanceOf(Channel):
            return

        # find the command
        $trim = detail $msg.params[1].word(0).trimPrefix(".")
        if !$trim.trimmed:
            return
        $command = $trim.default

        # call the command
        $bot?.commands.[$command.lowercase]?(
            msg:        $msg,
            channel:    $msg.target
        )
    }
}

method connect {
    for $c in @conns:
        $c.connect()
}
