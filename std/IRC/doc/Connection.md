# IRC::Connection

This is the IRC::Connection class; it is not versioned.




## Initializer

```
$connection = Connection($addr: Str, $nick: Str)
```

Creates a new Connection class instance.


### Arguments

* __addr__: [String](/std/doc/String.md)  

* __nick__: [String](/std/doc/String.md)  

* *optional* __port__: [Number](/std/doc/Number.md)  

* *optional* __user__: [String](/std/doc/String.md)  

* *optional* __real__: [String](/std/doc/String.md)  

* *optional* __autojoin__: List  

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

* __line__: [String](/std/doc/String.md)  



### getChannel

```
$connection.getChannel($name: Str)
```

Fetches a channel object from a channel name.


#### Arguments

* __name__: [String](/std/doc/String.md)  



### getUser

```
$connection.getUser($nick: Str)
```

Fetches a user object from a nickname.


#### Arguments

* __nick__: [String](/std/doc/String.md)  



### getServer

```
$connection.getServer($name: Str)
```

Fetches a server object from a server name.


#### Arguments

* __name__: [String](/std/doc/String.md)  







End of IRC::Connection class.

This file was generated automatically by the Ferret compiler from
[Connection.frtdoc](../Connection.frtdoc).