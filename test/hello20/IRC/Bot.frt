package IRC
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

method addCommand {
    need $command: Str, $callback;
    if @commands[$command]:
        overwrote -> true;
    @commands[$command] = $callback;
    added -> true;
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
        _self:      *self,
        line:       $line,
        command:    $command,
        s:          $s
    );

}

method privmsg {
    need $channel: Str, $message: Str;
    for $line in $message.split("\n") {
        @send("PRIVMSG $channel :$line");
    }
}

method joinChannels {

    # check if already joined.
    if @_joinedChannels:
        return;
    @_joinedChannels = true;

    if @autojoin {
        for $chan in @autojoin {
            @send("JOIN $chan");
        }
    }
}

method pong {
    need $s;
    @send("PONG " + $s[1]);
}

method handleMessage {
    need $line, $s;

    # parse the message
    $msg = IRC::Message($line);
    msg -> $msg;

    # found a command
    if $msg.command(): @commands[ $msg.command() ]?(
        _self:  *self,
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
    inspect($msg);

    # .add (0) trigger (1) response (2-)
    $trigger  = $msg.parts[1];
    $response = $msg.fromWord(2);

    # remember this factoid
    @factoids[$trigger] = $response;
    @commands[$trigger] = @commandFactoid;

    @privmsg($msg.channel, "alright, associating .$trigger with '$response'");
}

method commandFactoid {
    need $msg;
    $response = @factoids[ $msg.command() ];
    @privmsg($msg.channel, $response);
}
