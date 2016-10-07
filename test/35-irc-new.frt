share $bot = IRC::Bot()

on $bot.commands.info {
    need $channel
    $channel.privmsg("Ferret IRC bot")
}

#=== FACTOIDS ===

$bot.factoids = [:]

on $bot.commands.add {
    need $msg, $channel
    $message = $msg.params[1]

    # check params
    $parts = $message.split(/\s+/)
    if $parts.length < 3 {
        fail Error(:ParameterError, "Not enough parameters")
    }

    # store
    $command  = $parts[1]
    $response = $message.fromWord(2)
    %factoids[$command] = $response
    $bot.commands.[$command] = respondFactoid

    $channel.privmsg("OK, I will respond to .$command with '$response'")
}

func respondFactoid {
    need $msg, $channel
    $command = $msg.params[1].word(0).trimPrefix(".")
    $channel.privmsg(%factoids[$command])
}

#=== COMPILER INTERFACE ===

on $bot.commands.e {
    need $msg, $channel
    $res = COMPILER(getParameter($msg)).eval()
    if $res.error {
        $channel.privmsg($res.error)
        return
    }
    $string = inspect(value: $res.result, quiet: true).string
    $channel.privmsg($string)
}

on $bot.commands.t {
    need $msg, $channel
    $res = COMPILER(getParameter($msg)).tokenize(pretty: true)
    if $res.error {
        $channel.privmsg($res.error)
        return
    }
    $channel.privmsg($res.pretty)
}

on $bot.commands.c {
    need $msg, $channel
    $res = COMPILER(getParameter($msg)).construct(pretty: true)
    if $res.error {
        $channel.privmsg($res.error)
        return
    }
    $channel.privmsg($res.pretty)
}

on $bot.commands.p {
    need $msg, $channel
    handlePerl($msg, $channel, true)
}

on $bot.commands.pp {
    need $msg, $channel
    handlePerl($msg, $channel, false)
}

func handlePerl {
    need $msg, $channel, $mini
    $res = COMPILER(getParameter($msg)).compile(mini: $mini)
    if $res.error {
        $channel.privmsg($res.error)
        return
    }
    $channel.privmsg($res.perl)
}

func getParameter {
    need $msg: IRC::Massage
    $string = $msg.params[1].fromWord(1) || ""
    return $string.split("_NL_").join("\n")
}

share $conn = IRC::Connection(addr: "k.notroll.net", nick: "booby",  user: "ferret");
$conn.autojoin = ["\#k"]
$bot.addConnection($conn)
$bot.connect()
