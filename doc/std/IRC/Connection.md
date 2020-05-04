# IRC::Connection

This is the IRC::Connection class.




## Initializer

```
$connection = Connection($addr: Str, $nick: Str)
```

Creates a new Connection class instance.


* __addr__: [Str](/doc/std/String.md) - IRC server address.

* *optional* __port__: [Num](/doc/std/Number.md) - IRC server port.

* __nick__: [Str](/doc/std/String.md) - Preferred nickname.

* *optional* __user__: [Str](/doc/std/String.md) - Username (ident).

* *optional* __real__: [Str](/doc/std/String.md) - Real name.

* *optional* __autojoin__: List - Channels to join on connect.

## Methods

### connect

```
$connection.connect()
```

Initiates the connection.





### send

```
$connection.send($line: Str)
```

Sends a line of IRC data.


* __line__: [Str](/doc/std/String.md) - A string outgoing data.



### getTarget

```
$connection.getTarget($target: Str)
```

Fetches a channel or user object.


* __target__: [Str](/doc/std/String.md) - Channel name or nickname.



### getChannel

```
$connection.getChannel($name: Str)
```

Fetches a channel object from a channel name.


* __name__: [Str](/doc/std/String.md) - Channel name.



### getUser

```
$connection.getUser($nick: Str)
```

Fetches a user object from a nickname.


* __nick__: [Str](/doc/std/String.md) - Nickname associated with the user.



### getServer

```
$connection.getServer($name: Str)
```

Fetches a server object from a server name.


* __name__: [Str](/doc/std/String.md) - Server name.



### connected

```
$connection.connected()
```

Hook. Called when a connection to the socket is established.





### disconnected

```
$connection.disconnected()
```

Hook. Called on disconnect, whether it be user-initiated or due to error.





### copy

```
$connection.copy()
```

Creates a new IRC::Connection with the same options.





End of the IRC::Connection class.

This file was generated automatically by the Ferret compiler from
Connection.frt.