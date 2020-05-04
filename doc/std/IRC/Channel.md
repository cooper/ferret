# IRC::Channel

This is the IRC::Channel class.




## Initializer

```
$channel = Channel($conn: Connection, $name: Str)
```

Creates a new Channel class instance.


* __conn__: Connection  

* __name__: [Str](/doc/std/String.md)  

## Methods

### privmsg

```
$channel.privmsg($message: Str::Any)
```

Sends a message to the channel.


* __message__: Str::Any  





End of the IRC::Channel class.

This file was generated automatically by the Ferret compiler from
Channel.frt.