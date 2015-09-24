class Bot

init {
    need @addr: Str, @nick: Str;
    want
        @port: Num = 6667,
        @user: Str = "ferret",
        @real: Str = "Ferret IRC";

    @handlers = [
        MODE:       @joinChannels,
        PING:       @pong,
        PRIVMSG:    @handleMessage
    ];

    @commands = [
        hello:  @commandHello,
        hi:     @commandHello,
        add:    @commandAdd
    ];

    @factoids = [:];

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
        line:       $line,
        command:    $command,
        s:          $s
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

    # handle a command
    $msg = getMessage($line);

    if $msg.command: @commands[ $msg.command ]?(
        line:   $line,
        s:      $s,
        msg:    $msg
    );

}

method commandHello {
    need $msg;
    $nickname = $msg.nickname;
    @privmsg($msg.channel, "Hi $nickname!");
}

method commandAdd {
    need $msg;

    # .add trigger(1) response (2-)
    $trigger  = $msg.parts[1];
    $response = $msg.message.split(separator: " ", limit: 3)[2];

    # remember this factoid
    @factoids[$trigger] = $response;
    @commands[$trigger] = @commandFactoid;

    @privmsg($msg.channel, "alright, associating .$trigger with '$response'");
}

method commandFactoid {
    need $msg;
    $response = @factoids[$msg.command];
    @privmsg($msg.channel, $response);
}

# get the sentinel-prefixed final parameter for a PRIVMSG
func getMessage {
    need $line;
    $lineSplit = $line.split(separator: " ", limit: 4);

    # find nickname
    $nickname = $lineSplit[0].split(separator: "!", limit: 2)[0];
    $nickname.trimPrefix(":");

    # find message
    $message = $lineSplit[3];
    $message.trimPrefix(":");

    # split into parts
    $split = $message.split(" ");

    # find command
    if $split[0].hasPrefix("."):
        command -> $split[0].copy().trimPrefix(".");

    nickname -> $nickname;
    channel  -> $lineSplit[2];
    message  -> $message;
    parts    -> $split;
}
