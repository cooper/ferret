package IRC
class User

init {
    need @conn: Connection, @nick: Str
    want @user: Str,  @host: Str, @real: Str
    weaken @conn
}
