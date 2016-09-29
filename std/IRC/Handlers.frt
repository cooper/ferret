package IRC::Handlers

share $handlers = (
    PING:   ping
)

func ping {
    need $msg: Massage
    @send("PONG :" + $msg.params[-1])
}
