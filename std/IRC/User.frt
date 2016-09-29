package IRC
class User

init {
    need @connection: Connection, @nick: Str
    want @user: Str,  @host: Str, @real: Str
}
