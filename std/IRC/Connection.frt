package IRC
class Connection

init {
    need @addr: Str, @nick: Str
    want @port: Num = 6667
    want @user: Str = "ferret"
    want @real: Str = "Ferret IRC"

    # IRC command handlers. inherit from core handlers.
    want @handlers = (:)
    @handlers.*addParent(IRC::Handlers.handlers)

    # create a socket
    @sock = Socket::TCP(address: @addr, port: @port, readMode: :line)

    # connect event
    on @sock.connected, :sendRegistration {
        @send("USER @user * * :@real")
        @send("NICK @nick")
    }

    # on read data
    on @sock.gotLine, :handleLine {
        need $data
        @_handleLine($data)
    }

}

method connect {
    @sock.connect()
}

method send {
    need $line: Str
    say("send: $line")
    @sock.println($line)
}

method _handleLine {
    need $line: Str
    say("recv: $line")

    # create message

    # handle command maybe
    #@handlers[$command]?(...)

}
