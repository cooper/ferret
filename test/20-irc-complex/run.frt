share $bot = IRCBot::Bot(addr: "k.notroll.net", nick: "bootie", user: "ferret")
$bot.autojoin = ["#k"]

$bot.addCommand("info") {
    need $msg
    $bot.privmsg($msg.channel, "Ferret IRC bot")
}

$bot.addCommand("t") {
    need $msg
    if !$msg.commandHasParameters
        ->
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.tokenize(pretty: true)
    if $res.error {
        $bot.privmsg($msg.channel, Str($res.error))
        ->
    }
    $bot.privmsg($msg.channel, $res.pretty)
}

$bot.addCommand("c") {
    need $msg
    if !$msg.commandHasParameters
        ->
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.construct(pretty: true)
    if $res.error {
        $bot.privmsg($msg.channel, Str($res.error))
        ->
    }
    $bot.privmsg($msg.channel, $res.pretty)
}

$bot.addCommand("e") {
    need $msg
    if !$msg.commandHasParameters
        ->
    $res = COMPILER(convertNewlines($msg.fromWord(1))).eval()
    if $res.error {
        $bot.privmsg($msg.channel, Str($res.error))
        ->
    }
    $string = inspect(value: $res.result, quiet: true).string
    $bot.privmsg($msg.channel, $string)
}

$bot.addCommand("pe") {
    need $msg
    if !$msg.commandHasParameters
        ->
    $res = COMPILER(convertNewlines($msg.fromWord(1))).perlEval()
    if $res.error {
        $bot.privmsg($msg.channel, Str($res.error))
        ->
    }
    $string = inspect(value: $res.result, quiet: true).string
    $bot.privmsg($msg.channel, $string)
}

$bot.addCommand("p", handlePerl)
$bot.addCommand("pp", handlePerl)

func handlePerl {
    need $msg
    if !$msg.commandHasParameters
        ->
    $c = COMPILER(convertNewlines($msg.fromWord(1)))
    $res = $c.compile($msg.command == "p")
    if $res.error {
        $bot.privmsg($msg.channel, Str($res.error))
        ->
    }
    $bot.privmsg($msg.channel, $res.perl)
}

func convertNewlines {
    need $string: Str
    -> $string.split("_NL_").join("\n")
}

func ircsay {
    need $str: Str
    $bot.privmsg($bot.autojoin[0], $str)
}

$bot.connect()
