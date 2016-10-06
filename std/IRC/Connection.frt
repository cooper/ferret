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

    @_resetState()

    # IRC command handlers. inherit from core handlers.
    want @handlers = (:)
    @handlers.*addParent(Handlers.handlers)

    # create a line-stream socket
    @sock = Socket::TCP(address: @addr, port: @port, readMode: :line)

    # connect event
    on @sock.connected, :sendRegistration {
        @send("USER @user * * :@real")
        @send("NICK @nick")
    }

    # on read data
    on @sock.gotLine, :handleLine {
        need $data
        @_handleLine($data)
    }

    # on disconnect, clear object pool
    on @sock.disconnected, :resetState:
        @_resetState()

}

#=== Data ===

#> Initiates the connection
method connect {
    @sock.connect()
}

#> Sends a line of IRC data
method send {
    need $line: Str #< a string outgoing data
    say("send: $line")
    @sock.println($line)
}

#> Handles a raw line of IRC data
method _handleLine {
    need $line: Str
    say("recv: $line")

    # create message
    $msg = IRC::Massage($line)

    # handle command maybe
    @handlers.[ $msg.command ]?(
        _self:  *self,   # call with the connection object as self
        line:   $line,
        msg:    $msg
    )
}

#=== Objects ===

# TODO: rather than using .lowercase, use proper IRC casemapping.
# respect the CASEMAPPING token in RPL_ISUPPORT.

#> Fetches a channel or user object.
method getTarget {
    need $target: Str #< channel name or nickname
    # TODO: once we look at RPL_ISUPPORT, check that for channel prefixes
    if $target.hasPrefix("\#"):
        return @getChannel($target)
    else:
        return @getUser($target)
}

#> Fetches a channel object from a channel name
method getChannel {
    need $name: Str #< channel name
    if $channel = @channels[$name.lowercase]:
        return $channel
    return Channel(connection: *self, name: $name)
}

#> Fetches a user object from a nickname
method getUser {
    need $nick: Str #< nickname associated with the user
    if $user = @users[$nick.lowercase]:
        return $user
    return User(connection: *self, nick: $nick)
}

#> Fetches a server object from a server name
method getServer {
    need $name: Str #< server name
    if $server = @servers[$name.lowercase]:
        return $server
    return Server(connection: *self, name: $name)
}

#=== Hooks ===#

method privmsg

#=== Miscellaneous ===

method _resetState {
    delete @registered
    delete @_didAutojoin
    @server   = Server(connection: *self, name: @addr)
    @me       = User(connection: *self, nick: @nick, user: @user)
    @users    = [:]
    @channels = [:]
    @servers  = [:]
}
