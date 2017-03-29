# HTTP

This is the HTTP package.






## Functions

### get

```
HTTP.get($url: Str)
```

Convenience method for calling `.get()` on the default client.


#### Arguments

* __url__: [Str](/std/doc/String.md)  



### post

```
HTTP.post($url: Str)
```

Convenience method for calling `.post()` on the default client.


#### Arguments

* __url__: [Str](/std/doc/String.md)  


## Type interfaces

### HTTPMethod

HTTP methods.



#### Accepted values

In order to comply, the test object must be equal (according to the `==` [`OP_EQUAL`](/doc/Operators.md#equality-operator) operator) to any one of these values.

* `:GET` - HTTP GET method.
* `:POST` - HTTP POST method.

End of the HTTP package.

This file was generated automatically by the Ferret compiler from
[HTTP.frt](../HTTP.frt).