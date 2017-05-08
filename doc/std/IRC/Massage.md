# IRC::Massage

This is the IRC::Massage class.




## Initializer

```
$massage = Massage()
```

Creates a new Massage class instance.


### Arguments

* *optional* __data__: [Str::NE](/std/doc/String.md) - A complete IRC message.

* *optional* __connection__: Connection - The connection object to associate the message with,
used for source and target properties.

## Methods

### parse

```
$massage.parse($data: Str::NE)
```

Parses IRC data.


#### Arguments

* __data__: [Str::NE](/std/doc/String.md) - A string of IRC-encoded data.



### target

```
$massage.target
```

Computed property. User or channel object from the first parameter.



### nick

```
$massage.nick
```

Computed property. Source's nickname.



### user

```
$massage.user
```

Computed property. Source's username (ident).



### host

```
$massage.host
```

Computed property. Source's host.





End of the IRC::Massage class.

This file was generated automatically by the Ferret compiler from
Massage.frt.