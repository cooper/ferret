# HTTP::Request

This is the HTTP::Request class; it is not versioned.




## Initializer

```
$request = Request($client: Client, $url: Str, $httpMethod: HTTPMethod)
```

HTTP request objects generally are not created directly. Instead, use the
methods provided by the [`Client`](Client.md) class.


### Arguments

* __client__: Client - an HTTP::Client, representing the user agent.

* __url__: [String](/std/doc/String.md) - HTTP URL to request.

* __httpMethod__: HTTPMethod - Request HTTP method.
See [HTTPMethod](../HTTP.md#httpmethod) interface.

## Methods

### connect

```
$request.connect()
```

Initializes the asynchronous HTTP connection.
Afterward, either the [`connected`](#connected) or [`error`](#connected)
event will be called.





### connected

```
$request.connected()
```

Hook. Called when the connection opens.
May be called multiple times if the request is redirected or retried.





### redirect

```
$request.redirect()
```

Hook. Called when the request was redirected by an HTTP location header.





### error

```
$request.error()
```

Hook. Called when a connection error occurs.





### response

```
$request.response()
```

Hook. Called when an HTTP response is constructed.







End of HTTP::Request class.

This file was generated automatically by the Ferret compiler from
[Request.frtdoc](../Request.frtdoc).