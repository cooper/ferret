package IRCBot
class Bot

share $handlers = [
    MODE:       _joinChannels,
    PING:       _pong,
    PRIVMSG:    _handleMessage
]

share $initialCommands = [
    hello:  _commandHello,
    hi:     _commandHello,
    add:    _commandAdd
]

init {
    need @addr: Str, @nick: Str
    want @port: Num = 6667
    want @user: Str = "ferret"
    want @real: Str = "Ferret IRC"

    @commands = $initialCommands.copy()
    @factoids = [:]

    # create a socket
    @sock = Socket::TCP(address: @addr, port: @port, readMode: :line)

    # connect event
    on @sock.connected, :sendRegistration {
        @send("USER @user * * :@real")
        @send("NICK @nick")
    }

    # print data
    on @sock.gotLine, :handleLine {
        need $data
        @handleLine($data)
    }

}

method addCommand {
    need $command: Str::LC, $callback
    if @commands[$command]:
        overwrote -> true
    @commands[$command] = $callback
    added -> true
}

method connect {
    @sock.connect()
}

method send {
    need $line
    say("send: $line")
    @sock.println($line)
}

method handleLine {
    need $line

    # find command
    $s = $line.split(" ")
    $command = $s[1]

    # ping is special
    if $s[0] == "PING":
        $command = $s[0]

    say("recv[$command]: $line")

    # handle command maybe
    $handlers[$command]?(
        _self:      *self,
        line:       $line,
        command:    $command,
        s:          $s
    )

}

method privmsg {
    need $channel: Str, $message: Str
    for $line in $message.split("\n") {
        if $line.length != 0:
            @send("PRIVMSG $channel :$line")
    }
}

func _joinChannels {

    # check if already joined.
    if @_joinedChannels:
        return

    if @autojoin {
        for $chan in @autojoin {
            @send("JOIN $chan")
        }
    }

    @_joinedChannels = true
}

# Default handlers and commands

func _pong {
    need $s
    @send("PONG " + $s[1])
}

func _handleMessage {
    need $line, $s

    # parse the message
    $msg = Message($line)
    msg -> $msg

    # found a command
    if $msg.command: @commands[ $msg.command.lowercase ]?(
        _self:  *self,
        line:   $line,
        s:      $s,
        msg:    $msg
    )

}

func _commandHello {
    need $msg
    $nickname = $msg.nickname
    @privmsg($msg.channel, "Hi $nickname!")
}

func _commandAdd {
    need $msg
    inspect($msg)

    # .add (0) trigger (1) response (2-)
    $trigger  = $msg.parts[1]
    $response = $msg.fromWord(2)

    # remember this factoid
    @factoids[$trigger] = $response
    @commands[$trigger] = _commandFactoid

    @privmsg($msg.channel, "alright, associating .$trigger with '$response'")
}

func _commandFactoid {
    need $msg
    $response = @factoids[ $msg.command ].fill(
        nick:   $msg.nickname,
        cmd:    $msg.command,
        chan:   $msg.channel,
        nl:     "\n"
    )
    @privmsg($msg.channel, $response)
}
