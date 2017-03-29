# HTTP

This is the HTTP package.




## HTTP::Client

This is the HTTP::Client class version 1.0.

Represents an HTTP user agent.


### Initializer

```
$client = Client()
```

Creates a new Client class instance.


#### Arguments

* *optional* __userAgent__: [Str](/std/doc/String.md) - HTTP user agent. Default is `"ferret-http/<version>"`.

* *optional* __timeout__: [Num](/std/doc/Number.md) - Request timeout. Set to undefined for no timeout.

* *optional* __maxContentLength__: [Num](/std/doc/Number.md) - Maximum length of content.
If reached, the connection will be closed
and the response will be truncated to this length.
By default, there is no limit.

* *optional* __readLength__: [Num](/std/doc/Number.md) - Read length in bytes. Default is 64 KB.

* *optional* __writeLength__: [Num](/std/doc/Number.md) - Write length in bytes. Default is 64 KB.

### Methods

#### get

```
$client.get($url: Str)
```

Convenient method for a GET request.
See the [`request`](#request) method.


##### Arguments

* __url__: [Str](/std/doc/String.md) - HTTP URL to request.



#### post

```
$client.post($url: Str)
```

Convenient method for a POST request.
See the [`request`](#request) method.


##### Arguments

* __url__: [Str](/std/doc/String.md) - HTTP URL to request.



#### request

```
$client.request($httpMethod: HTTPMethod, $url: Str)
```

Creates an [`HTTP::Request`](Request.md).


##### Arguments

* __httpMethod__: HTTPMethod - Request HTTP method.
See [HTTPMethod](../HTTP.md#httpmethod) interface.

* __url__: [Str](/std/doc/String.md) - HTTP URL to request.





End of the HTTP::Client class.






End of the HTTP package.

This file was generated automatically by the Ferret compiler from
[Client.frt](../Client.frt).