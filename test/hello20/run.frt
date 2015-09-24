$bot = IRC::Bot(addr: "k.notroll.net", nick: "bottie", user: "ferret");

$bot.addCommand("info", func {
    need $msg;
    $bot.privmsg($msg.channel, "Ferret IRC bot");
});

$bot.connect();
