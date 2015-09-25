$bot = IRC::Bot(addr: "k.notroll.net", nick: "bottie", user: "ferret");

$bot.addCommand("info", func {
    need $msg;
    $bot.privmsg($msg.channel, "Ferret IRC bot");
});

$bot.addCommand("t", func {
    need $msg;
    $res = COMPILER($msg.fromWord(1)).tokenize();
    if $res.error {
        $bot.privmsg($msg.channel, $res.error);
        return;
    }
    $bot.privmsg($msg.channel, "success");
});

$bot.addCommand("compile", func {
    need $msg;
    $c = COMPILER($msg.fromWord(1));
    $res = $c.compile();
    dump($c);
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
    $bot.privmsg($msg.channel, $res.stringResult);
});

$bot.connect();
