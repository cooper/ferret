# HTTP

This is the HTTP package.

This namespace contains the implementation of the
[Hypertext Transfer Protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).
The HTTP package itself provides a few very basic convenience methods which
may be used in simple applications, but more advanced programs may need
to use a custom [HTTP client](../HTTP/doc/Client.md) object.




## Functions

### get

```
HTTP.get($url: Str)
```

Convenience method for calling `.get()` on the default
[client](../HTTP/doc/Client.md).


#### Arguments

* __url__: [Str](/doc/std/String.md)  



### post

```
HTTP.post($url: Str)
```

Convenience method for calling `.post()` on the default
[client](../HTTP/doc/Client.md).


#### Arguments

* __url__: [Str](/doc/std/String.md)  


## Type interfaces

### Method

HTTP methods.



#### Accepted values

In order to comply, the object must be [equal](/doc/Operators.md#equality-operator) to one of these values.

* `:GET` - HTTP GET method.
* `:POST` - HTTP POST method.

End of the HTTP package.

This file was generated automatically by the Ferret compiler from
HTTP.frt.