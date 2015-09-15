class Bot2

init {
    need @address: Str, @nick: Str, @user: Str;
    want @port: Num = 6667, @real: Str = "Ferret IRC";

    # make the bot a socket
    Socket::TCP.init(*self)(addr: @address, port: @port);

    @send = @println;

    # connect event
    on @connected {
        @send("USER @user \* \* :@real");
        @send("NICK @nick");
    }

    # print data
    on @gotLine {
        need $data;
        say("recv: $data");
    }

    on @println {
        need $data;
        say("send: $data");
    }

}
