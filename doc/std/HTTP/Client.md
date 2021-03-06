# HTTP::Client

This is the HTTP::Client class version 1.0.

Represents an HTTP user agent.


## Initializer

```
$client = Client()
```

Creates a new Client class instance.


* *optional* __userAgent__: [Str](/doc/std/String.md) - HTTP user agent. Default is `"ferret-http/<version>"`.

* *optional* __timeout__: [Num](/doc/std/Number.md) - Request timeout. Set to undefined for no timeout.

* *optional* __maxContentLength__: [Num](/doc/std/Number.md) - Maximum length of content.
If reached, the connection will be closed
and the response will be truncated to this length.
By default, there is no limit.

* *optional* __readLength__: [Num](/doc/std/Number.md) - Read length in bytes. Default is 64 KB.

* *optional* __writeLength__: [Num](/doc/std/Number.md) - Write length in bytes. Default is 64 KB.

## Methods

### get

```
$client.get($url: Str)
```

Convenient method for a GET request.
See the [`request`](#request) method.


* __url__: [Str](/doc/std/String.md) - HTTP URL to request.



### post

```
$client.post($url: Str)
```

Convenient method for a POST request.
See the [`request`](#request) method.


* __url__: [Str](/doc/std/String.md) - HTTP URL to request.



### request

```
$client.request($httpMethod: Method, $url: Str)
```

Creates an [`HTTP::Request`](Request.md).


* __httpMethod__: Method - Request HTTP method.

* __url__: [Str](/doc/std/String.md) - HTTP URL to request.





End of the HTTP::Client class.

This file was generated automatically by the Ferret compiler from
Client.frt.