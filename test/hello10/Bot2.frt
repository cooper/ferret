class Bot2

init {
    need @addr: Str, @nick: Str, @user: Str;
    want @port: Num = 6667;

    # make the bot a socket
    Socket::TCP.init(*self)(addr: @addr, port: @port);

    # connect event
    on @connected {
        @println("USER @user \* \* :@real");
        @println("NICK @nick");
    }

}
