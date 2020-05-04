# IRC::Message

This is the IRC::Message class.




## Initializer

```
$message = Message()
```

Creates a new Message class instance.


* *optional* __data__: [Str::NE](/doc/std/String.md) - A complete IRC message.

* *optional* __conn__: Connection - Connection object to associate the message with,
used for source and target properties.

## Methods

### parse

```
$message.parse($data: Str::NE)
```

Parses IRC data.


* __data__: [Str::NE](/doc/std/String.md) - A string of IRC-encoded data.



### target

```
$message.target
```

Computed property. User or channel object from the first parameter.



### nick

```
$message.nick
```

Computed property. Source's nickname.



### user

```
$message.user
```

Computed property. Source's username (ident).



### host

```
$message.host
```

Computed property. Source's host.





End of the IRC::Message class.

This file was generated automatically by the Ferret compiler from
Message.frt.