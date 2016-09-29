package IRC::Handlers

share $handlers = (
    PING:   ping
)

func ping {
    say("handling ping")
    @send("PONG")
}
