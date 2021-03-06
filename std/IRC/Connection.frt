package IRC
class Connection

load Outgoing

init {
    need @addr: Str                     #< IRC server address
    want @port: Num = 6667              #< IRC server port
    need @nick: Str                     #< preferred nickname
    want @user: Str = "ferret"          #< username (ident)
    want @real: Str = "Ferret IRC"      #< real name
    want @autojoin: List                #< channels to join on connect

    # IRC command handlers. inherit from core handlers.
    @handlers = (:)
    @handlers.*addParent(Handlers.handlers)

    # default server, user, object pools
    @server   = Server(conn: *self, name: @addr)
    @me       = User(conn: *self, nick: @nick, user: @user)
    @users    = [:]
    @channels = [:]
    @servers  = [:]

    # create a line-stream socket
    @sock = Socket::TCP(address: @addr, port: @port, readMode: :line)

    # connect event
    on @sock.connected, :sendRegistration {
        @send("USER @user * * :@real")
        @send("NICK @nick")
        @connected()
    }

    # on read data
    on @sock.gotLine, :handleLine {
        need $data
        @_handleLine($data)
    }

    # on disconnect, call connection disconnect
    on @sock.disconnected, :callDisconnect
        @disconnected()
}

#=== Data ===

#> Initiates the connection
method connect {
    @sock.connect()
}

#> Sends a line of IRC data
.send {
    need $line: Str #< a string outgoing data
    say("send: $line")
    @sock.println($line)
}

#> Handles a raw line of IRC data
._handleLine {
    need $line: Str
    say("recv: $line")

    # create message
    $msg = IRC::Message($line, *self)

    # handle command maybe
    @handlers.[ $msg.command ]?(
        _this:  *self,   # call with the connection object as *this
        line:   $line,
        msg:    $msg
    )
}

#=== Objects ===

# TODO: rather than using .lowercase, use proper IRC casemapping.
# respect the CASEMAPPING token in RPL_ISUPPORT.

#> Fetches a channel or user object.
.getTarget {
    need $target: Str #< channel name or nickname
    # TODO: once we look at RPL_ISUPPORT, check that for channel prefixes
    if $target.hasPrefix("#")
        -> @getChannel($target)
    else
        -> @getUser($target)
}

#> Fetches a channel object from a channel name
.getChannel {
    need $name: Str #< channel name
    if $channel = @channels[$name.lowercase]
        -> $channel
    -> Channel(conn: *self, name: $name)
}

#> Fetches a user object from a nickname
.getUser {
    need $nick: Str #< nickname associated with the user
    if $user = @users[$nick.lowercase]
        -> $user
    -> User(conn: *self, nick: $nick)
}

#> Fetches a server object from a server name
.getServer {
    need $name: Str #< server name
    if $server = @servers[$name.lowercase]
        -> $server
    -> Server(conn: *self, name: $name)
}

#=== Hooks ===#

#> Called when a connection to the socket is established.
hook connected

#> Called on disconnect, whether it be user-initiated or due to error.
hook disconnected {
    # dispose of all the objects
    @users = [:]
    @servers = [:]
    @channels = [:]
    @_didAutojoin = false
}

#=== Miscellaneous ===

#> Creates a new IRC::Connection with the same options.
method copy {
    -> *class(
        addr:       @addr,
        port:       @port,
        nick:       @nick,
        user:       @user,
        real:       @real,
        autojoin:   @autojoin.copy()
    )
}

.description -> "IRC::Connection(@addr/@port)"
