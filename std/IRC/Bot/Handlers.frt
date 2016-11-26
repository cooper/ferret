package IRC::Bot::Handlers

share $handlers = (
    PRIVMSG: privmsg
)

func privmsg {
    need $bot, $msg

    # commands only work in channels right now
    if !$msg.target.*instanceOf(Channel)
        return

    # find the command
    $trim = detail $msg.params[1].word(0).trimPrefix(".")
    if !$trim.trimmed
        return
    $command = $trim.result

    # call the command
    $bot.commands.[$command.lowercase]?(
        _this:      $bot,
        msg:        $msg,
        channel:    $msg.target
    ) catch $e: $msg.target.privmsg($e.msg)
}
