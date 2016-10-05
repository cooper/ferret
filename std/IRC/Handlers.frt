package IRC::Handlers

share $handlers = (
    PING:       ping,
    "001":      welcome,
    "004":      myInfo,
    "376":      endOfMOTD,      # end of motd
    "396":      hiddenHost,     # is now your hidden host
    "422":      endOfMOTD,      # no motd found
    "433":      nickInUse       # nickname already in use
)

func ping {
    need $msg
    @send("PONG :" + $msg.params[-1])
}

func welcome {
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
        @me.realHost = $3
    }
}

func myInfo {
    need $msg
    @server.name    = $msg.params[1]
    @server.version = $msg.params[2]
}

func endOfMOTD {
    if !@autojoin || @_didAutojoin:
        return
    @join(channelNames: @autojoin)
    @_didAutojoin = true
}

# recv: :k.notroll.net 396 booby 73.88.xkw.t :is now your hidden host
func hiddenHost {
    need $msg
    @me.host = $msg.params[1]
}

# during registration, add underscores to nickname as necessary
func nickInUse {
    if @registered:
        return
    @me.nick = @me.nick + "_"
    @requestNick(@me.nick)
}
