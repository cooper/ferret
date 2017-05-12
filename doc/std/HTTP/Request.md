# HTTP::Request

This is the HTTP::Request class.




## Initializer

```
$req = Request($client: Client, $url: Str, $httpMethod: Method)
```

HTTP request objects generally are not created directly. Instead, use the
methods provided by the [`Client`](Client.md) class.


### Arguments

* __client__: Client - An HTTP::Client, representing the user agent.

* __url__: [Str](/doc/std/String.md) - HTTP URL to request.

* __httpMethod__: Method - Request HTTP method.

## Methods

### connect

```
$req.connect()
```

Initializes the asynchronous HTTP connection.
Afterward, either the [`connected`](#connected) or [`error`](#connected)
event will be called.





### connected

```
$req.connected()
```

Hook. Called when the connection opens.
May be called multiple times if the request is redirected or retried.





### redirect

```
$req.redirect()
```

Hook. Called when the request was redirected by an HTTP location header.





### error

```
$req.error()
```

Hook. Called when a connection error occurs.





### response

```
$req.response()
```

Hook. Called when an HTTP response is constructed.





End of the HTTP::Request class.

This file was generated automatically by the Ferret compiler from
Request.frt.