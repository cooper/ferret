share $bot = IRC::Bot()
share $conn = IRC::Connection(addr: "k.notroll.net", nick: "booby",  user: "ferret");

on $bot.commands.info {
    need $channel
    $channel.privmsg("Ferret IRC bot https://github.com/cooper/ferret")
}

#=== FACTOIDS ===

$bot.factoids = [:]

on $bot.commands.add {
    need $msg, $channel
    $message = $msg.params[1]

    # check params
    $parts = $message.split(/\s+/)
    if $parts.length < 3
        fail Error(:ParameterError, "Not enough parameters")

    # check for existing command
    $command = $parts[1].lowercase
    if $bot.commands.[$command]
        fail Error(:ParameterError, "Command .$command exists")

    # store
    $response = $message.fromWord(2)
    %factoids[$command] = $response
    $bot.commands.[$command] = respondFactoid

    $channel.privmsg("OK, I will respond to .$command with '$response'")
}

on $bot.commands.del {
    need $msg, $channel
    $message = $msg.params[1]

    # check params
    $parts = $message.split(/\s+/)
    if $parts.length < 2 {
        fail Error(:ParameterError, "Not enough parameters")
    }

    # check that something existed
    $command = $parts[1].lowercase
    $existed = %factoids[$command]
    if !$existed
        fail Error(:ParameterError, "No such factoid .$command")

    # delete it
    delete %factoids[$command]
    delete $bot.commands.[$command]

    $channel.privmsg("OK, I will no longer respond to .$command with '$existed'")
}

func respondFactoid {
    need $msg, $channel
    $command  = $msg.params[1].word(0).trimPrefix(".")
    inspect($msg)
    inspect(%factoids[$command])
    $response = %factoids[$command].fill(
        nick: $msg.nick,
        user: $msg.user,
        host: $msg.host,
        chan: $channel.name
    )
    inspect($response)
    $channel.privmsg($response)
}

#=== COMPILER INTERFACE ===

on $bot.commands.e {
    need $msg, $channel
    handleEval($msg, $channel, false)
}

on $bot.commands.i {
    need $msg, $channel
    handleEval($msg, $channel, true)
}

func handleEval {
    need $msg, $channel, $detailed
    $res = COMPILER(getParameter($msg)).eval()
    if $res.error {
        $channel.privmsg($res.error)
        return
    }
    $string = inspect(
        value: $res.result, quiet: true, detailed: $detailed).string
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

func ircsay {
    need $message: Str::Any
    $chan = $conn.getChannel($conn.autojoin[0])
    $chan.privmsg($message)
}

on $conn.disconnected {
    say("Disconnected. Trying again.")
    delay(5) {
        $bot.connect()
    }
}

$conn.autojoin = ["\#k"]
$bot.addConnection($conn)
$bot.connect()
