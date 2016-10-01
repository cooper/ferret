# IRC::Massage

This is the IRC::Massage class.




## Initializer

```
$massage = Massage()
```

Creates a new Massage class instance.


### Arguments

* *optional* __data__: Str::NE - A complete IRC message.

## Methods

### parse

```
$massage.parse($data: Str::NE)
```

Parses IRC data.


#### Arguments

* __data__: Str::NE - A string of IRC-encoded data.



### nick

```
$massage.nick
```

Computed property. Source's nickname.



### ident

```
$massage.ident
```

Computed property. Source's username (ident).



### host

```
$massage.host
```

Computed property. Source's host.







End of IRC::Massage class.

This file was generated automatically by the Ferret compiler from
[Massage.frt](../Massage.frt).