package HTTP
class Request

#> HTTP request objects generally are not created directly. Instead, use the
#| methods provided by the [`Client`](Client.md) class.
init {

    #> an HTTP::Client, representing the user agent
    need $client: Client
    weaken @client = $client

    #> HTTP URL to request
    need @url: Str

    #> Request HTTP method.
    #| See [HTTPMethod](../HTTP.md#httpmethod) interface.
    need @httpMethod: HTTPMethod

}

#> Initializes the asynchronous HTTP connection.
#| Afterward, either the [`connected`](#connected) or [`error`](#connected)
#| event will be called.
method connect {
    NATIVE::HTTPClient.connect(@client, *self)
}

#> Called when the connection opens.
#| May be called multiple times if the request is redirected or retried.
hook connected

#> Called when the request was redirected by an HTTP location header.
hook redirect

#> Called when a connection error occurs.
hook error

#> Called when an HTTP response is constructed.
hook response
