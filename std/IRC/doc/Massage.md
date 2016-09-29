# IRC::Massage

This is the IRC::Massage class; it is not versioned.




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

* __data__: Str::NE  



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
[Massage.frtdoc](../Massage.frtdoc).