package IRC::Handlers

share $handlers = (
    PING:   ping,
    376:    endOfMOTD,      # end of motd
    422:    endOfMOTD       # no motd found
)

func ping {
    need $msg: Massage
    @send("PONG :" + $msg.params[-1])
}

func endOfMOTD {
    if !@autojoin:
        return
    @join(channelNames: @autojoin)
}
