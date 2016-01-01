share $bot = IRC::Bot(addr: "k.notroll.net", nick: "bottie", user: "ferret")

$bot.autojoin = ["#k"]

$bot.addCommand("info") {
    need $msg
    $bot.privmsg($msg.channel, "Ferret IRC bot")
}

$bot.addCommand("t") {
    need $msg
    if !$msg.commandHasParameters:
        return
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.tokenize(pretty: true)
    if $res.error {
        $bot.privmsg($msg.channel, $res.error)
        return
    }
    $bot.privmsg($msg.channel, $res.pretty)
}

$bot.addCommand("c") {
    need $msg
    if !$msg.commandHasParameters:
        return
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.construct(pretty: true)
    if $res.error {
        $bot.privmsg($msg.channel, $res.error)
        return
    }
    $bot.privmsg($msg.channel, $res.pretty)
}

$bot.addCommand("e") {
    need $msg
    if !$msg.commandHasParameters:
        return
    $res = COMPILER(convertNewlines($msg.fromWord(1))).eval()
    if $res.error {
        $bot.privmsg($msg.channel, $res.error)
        return
    }
    $string = inspect(value: $res.result, quiet: true).string
    $bot.privmsg($msg.channel, $string)
}

$bot.addCommand("pe") {
    need $msg
    if !$msg.commandHasParameters:
        return
    $res = COMPILER(convertNewlines($msg.fromWord(1))).perlEval()
    if $res.error {
        $bot.privmsg($msg.channel, $res.error)
        return
    }
    $string = inspect(value: $res.result, quiet: true).string
    $bot.privmsg($msg.channel, $string)
}

$bot.addCommand("p", handlePerl)
$bot.addCommand("pp", handlePerl)

func handlePerl {
    need $msg
    if !$msg.commandHasParameters:
        return
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.compile($msg.command == "p")
    if $res.error {
        $bot.privmsg($msg.channel, $res.error)
        return
    }
    $bot.privmsg($msg.channel, $res.perl)
}

func convertNewlines {
    need $string: Str
    return $string.split("_NL_").join("\n")
}

$bot.connect()
