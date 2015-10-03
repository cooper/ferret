$bot = IRC::Bot(addr: "k.notroll.net", nick: "bottie", user: "ferret");
$bot.autojoin = ["#k"];

$bot.addCommand("info", func {
    need $msg;
    $bot.privmsg($msg.channel, "Ferret IRC bot");
});

$bot.addCommand("t", func {
    need $msg;
    $c = COMPILER($msg.fromWord(1));
    $res = $c.tokenize(pretty: true);
    if $res.error {
        $bot.privmsg($msg.channel, $res.error);
        return;
    }
    $bot.privmsg($msg.channel, $res.pretty);
});

$bot.addCommand("c", func {
    need $msg;
    $c = COMPILER($msg.fromWord(1));
    $res = $c.construct(pretty: true);
    if $res.error {
        $bot.privmsg($msg.channel, $res.error);
        return;
    }
    $bot.privmsg($msg.channel, $res.pretty);
});

$bot.addCommand("p", func {
    need $msg;
    $c = COMPILER($msg.fromWord(1));
    $res = $c.compile();
    if $res.error {
        $bot.privmsg($msg.channel, $res.error);
        return;
    }
    $bot.privmsg($msg.channel, $res.perl);
});

$bot.addCommand("e", func {
    need $msg;
    $res = COMPILER($msg.fromWord(1)).eval();
    if $res.error {
        $bot.privmsg($msg.channel, $res.error);
        return;
    }
    $string = inspect(value: $res.result, quiet: true).string;
    $bot.privmsg($msg.channel, $string);
});

$bot.connect();
