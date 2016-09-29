package IRC::Handlers

share $handlers = (
    PING:   ping,
    001:    myInfo,
    376:    endOfMOTD,      # end of motd
    422:    endOfMOTD       # no motd found
)

func ping {
    need $msg
    @send("PONG :" + $msg.params[-1])
}

func myInfo {
    need $msg
    @registered = true          # remember that we've finished registration
    @me.nick = $msg.params[0]   # assume the target is our actual nickname

    # we can't actually depend on this always being the case, but a
    # lot of IRC servers have nick!ident@host as the final word here.
    # if not, we will get that info the first time we recv a message from @me.
    if $msg.params[-1] =~ /^(.+)!(.+)\@(.+)$/ {
        @me.nick = $1
        @me.user = $2
        @me.host = $3
    }
}

func endOfMOTD {
    if !@autojoin:
        return
    @join(channelNames: @autojoin)
}
