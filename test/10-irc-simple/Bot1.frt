class Bot1

init {
    need @addr: Str, @nick: Str, @user: Str
    want @port: Num = 6667, @real: Str = "Ferret IRC"

    # create a socket
    @sock = Socket::TCP(address: @addr, port: @port, readMode: :line)

    # connect event
    on @sock.connected {
        @send("USER @user * * :@real")
        @send("NICK @nick")
    }

    # print data
    on @sock.gotLine {
        need $data
        say("recv: $data")
    }

}

method connect {
    @sock.connect()
}

.send {
    need $line
    say("send: $line")
    @sock.println($line)
}
