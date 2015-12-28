package HTTP
class Client 1.0

$defaultUA = "ferret-http/*class.version"
$defaultLength = 64 * 1024

init {

    # HTTP user agent
    want @userAgent: Str = $defaultUA

    # request timeout. set to undefined for no timeout.
    want @timeout: Num = 10

    # maximum length of content.
    # if reached, the connection will be closed
    # and the response will be truncated to this length.
    # default is no limit
    want @maxContentLength: Num

    # read/write lengths. default 64 KB.
    want @readLength:  Num = $defaultLength
    want @writeLength: Num = $defaultLength

    NATIVE::HTTPClient.initialize(*self)
}

method get {
    need $url: Str
    return @request(
        httpMethod: :GET,
        url:        $url
    )
}

method post {
    need $url: Str
    return @request(
        httpMethod: :POST,
        url:        $url
    )
}

method request {
    need $httpMethod: HTTPMethod, $url: Str
    return HTTP::Request(
        client:     *self,
        httpMethod: $httpMethod,
        url:        $url
    )
}
