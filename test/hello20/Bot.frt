class Bot

init {
    need @addr: Str, @nick: Str;
    want
        @port: Num = 6667,
        @user: Str = "ferret",
        @real: Str = "Ferret IRC";

    @handlers = [
        MODE:    @joinChannels,
        PING:    @pong,
        PRIVMSG: @handleMessage
    ];

    @commands = [
        hello:  @commandHello,
        hi:     @commandHello
    ];

    # create a socket
    @sock = Socket::TCP(address: @addr, port: @port);

    # connect event
    on @sock.connected {
        @send("USER @user \* \* :@real");
        @send("NICK @nick");
    }

    # print data
    on @sock.gotLine {
        need $data;
        @handleLine($data);
    }

}

method connect {
    @sock.connect();
}

method send {
    need $line;
    say("send: $line");
    @sock.println($line);
}

method handleLine {
    need $line;

    # find command
    $s = $line.split(" ");
    $command = $s[1];

    # ping is special
    if $s[0] == "PING":
        $command = $s[0];

    say("recv[$command]: $line");

    # handle command maybe
    @handlers[$command]?(
        line: $line,
        command: $command,
        s: $s
    );

}

method privmsg {
    need $channel, $message;
    @send("PRIVMSG $channel :$message");
}

method joinChannels {

    # check if already joined.
    if @joinedChannels:
        return;
    @joinedChannels = true;

    @send("JOIN #k");
}

method pong {
    need $s;
    @send("PONG " + $s[1]);
}

method handleMessage {
    need $line, $s;

    $nickname = $s[0].split(separator: "!", limit: 2)[0];
    $nickname.trimPrefix(":");

    # handle a command
    $msg = getMessage($line);

    if $msg.command: @commands[ $msg.command ]?(
        nickname: $nickname,
        channel: $s[2]
    );

}

method commandHello {
    need $channel, $nickname;
    @privmsg($channel, "Hi $nickname!");
}

# get the sentinel-prefixed final parameter for a PRIVMSG
func getMessage {
    need $line;

    # find message
    $message = $line.split(separator: " ", limit: 4)[3];
    $message.trimPrefix(":");

    # split into parts
    $split = $message.split(" ");

    message -> $message;
    parts   -> $split;

    # command
    if $split[0].hasPrefix("."):
        command -> $split[0].copy().trimPrefix(".");

}
