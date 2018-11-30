package HTTP
class Client 1.0
#< Represents an HTTP user agent.

$defaultUA = "ferret-http/*class.version"
$defaultLength = 64 * 1024

init {

    #> HTTP user agent. Default is `"ferret-http/<version>"`.
    want @userAgent: Str = $defaultUA

    #> Request timeout. Set to undefined for no timeout.
    want @timeout: Num = 10

    #> Maximum length of content.
    #| If reached, the connection will be closed
    #| and the response will be truncated to this length.
    #| By default, there is no limit.
    want @maxContentLength: Num

    #> Read length in bytes. Default is 64 KB.
    want @readLength:  Num = $defaultLength

    #> Write length in bytes. Default is 64 KB.
    want @writeLength: Num = $defaultLength

    NATIVE::HTTPClient.initialize(*self)
}

#> Convenient method for a GET request.
#| See the [`request`](#request) method.
.get {
    need $url: Str  #< HTTP URL to request
    -> @request(
        httpMethod: :GET,
        url:        $url
    )
}

#> Convenient method for a POST request.
#| See the [`request`](#request) method.
.post {
    need $url: Str  #< HTTP URL to request
    -> @request(
        httpMethod: :POST,
        url:        $url
    )
}

#> Creates an [`HTTP::Request`](Request.md).
.request {

    #> Request HTTP method.
    need $httpMethod: Method

    #> HTTP URL to request
    need $url: Str

    -> HTTP::Request(
        client:     *self,
        httpMethod: $httpMethod,
        url:        $url
    )
}
