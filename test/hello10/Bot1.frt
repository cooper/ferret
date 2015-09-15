class Bot

init {
    need @addr: Str, @nick: Str, @user: Str;
    want @port: Num = 6667;

    # create a socket
    @sock = Socket::TCP(address: @addr, port: @port);

    # connect event
    on @sock.connected {
        @send("USER @user \* \* :@real");
        @send("NICK @nick");
    }

}

method connect {
    @sock.connect();
}

method send {
    need $line;
    @sock.println($line);
}
