share $bot = IRC::Bot()

on $bot.commands.info {
    need $channel
    $channel.privmsg("Ferret IRC bot")
}

on $bot.commands.e {
    need $msg, $channel
    $res = COMPILER(getParameter($msg)).eval()
    if $res.error {
        $channel.privmsg(Str($res.error))
        return
    }
    $string = inspect(value: $res.result, quiet: true).string
    $channel.privmsg($string)
}

func getParameter {
    need $msg: IRC::Massage
    $string = $msg.params[1].fromWord(1) || ""
    return $string.split("_NL_").join("\n")
}

share $conn = IRC::Connection(addr: "k.notroll.net", nick: "booby",  user: "ferret");
$conn.autojoin = ["\#k"]
$bot.addConnection(IRC::Connection($conn))
$bot.connect()
