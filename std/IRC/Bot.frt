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
        if !$msg.target.*instanceOf(Channel)
            return
inspect($msg.params)
        # find the command
        $trim = detail $msg.params[1].word(0).trimPrefix(".")
        if !$trim.trimmed
            return
        $command = $trim.result

        # call the command
        $bot?.commands.[$command.lowercase]?(
            _this:      $bot?,
            msg:        $msg,
            channel:    $msg.target
        ) catch $e: $msg.target.privmsg($e.msg)
    }
}

method connect {
    for $c in @conns
        $c.connect()
}
