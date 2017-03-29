# IRC

This is the IRC package.




## IRC::Channel

This is the IRC::Channel class.




### Initializer

```
$channel = Channel($connection: Connection, $name: Str)
```

Creates a new Channel class instance.


#### Arguments

* __connection__: Connection  

* __name__: [Str](/std/doc/String.md)  

### Methods

#### privmsg

```
$channel.privmsg($message: Str::Any)
```

Sends a message to the channel.


##### Arguments

* __message__: Str::Any  





End of the IRC::Channel class.





End of the IRC package.

This file was generated automatically by the Ferret compiler from
[Channel.frt](../Channel.frt).