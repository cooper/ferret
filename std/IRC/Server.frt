package IRC
class Server

init {
    need @conn: Connection
    need @name: Str
    weaken @conn
}
