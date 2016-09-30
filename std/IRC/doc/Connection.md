# IRC::Connection

This is the IRC::Connection class.




## Initializer

```
$connection = Connection($addr: Str, $nick: Str)
```

Creates a new Connection class instance.


### Arguments

* __addr__: [String](/std/doc/String.md) - IRC server address.

* *optional* __port__: [Number](/std/doc/Number.md) - IRC server port.

* __nick__: [String](/std/doc/String.md) - Preferred nickname.

* *optional* __user__: [String](/std/doc/String.md) - Username (ident).

* *optional* __real__: [String](/std/doc/String.md) - Real name.

* *optional* __autojoin__: List - Channels to join on connect.

* *optional* __handlers__: Any  

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


#### Arguments

* __line__: [String](/std/doc/String.md) - A string outgoing data.



### getChannel

```
$connection.getChannel($name: Str)
```

Fetches a channel object from a channel name.


#### Arguments

* __name__: [String](/std/doc/String.md) - Channel name.



### getUser

```
$connection.getUser($nick: Str)
```

Fetches a user object from a nickname.


#### Arguments

* __nick__: [String](/std/doc/String.md) - Nickname associated with the user.



### getServer

```
$connection.getServer($name: Str)
```

Fetches a server object from a server name.


#### Arguments

* __name__: [String](/std/doc/String.md) - Server name.







End of IRC::Connection class.

This file was generated automatically by the Ferret compiler from
[Connection.frt](../Connection.frt).