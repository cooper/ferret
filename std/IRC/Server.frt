package IRC
class Server

init {
    need @connection: Connection
    need @name: Str
    weaken @connection
}
