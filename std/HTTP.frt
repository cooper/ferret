package HTTP 1.0
#< This namespace contains the implementation of the
#| [Hypertext Transfer Protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).
#| The HTTP package itself provides a few very basic convenience methods which
#| may be used in simple applications, but more advanced programs may need
#| to use a custom [HTTP client](../HTTP/doc/Client.md) object.

#> HTTP methods.
type Method {
    :GET        #< HTTP GET method
    :POST       #< HTTP POST method
}

# default HTTP client
$client ?= Client()

#> Convenience method for calling `.get()` on the default
#| [client](../HTTP/doc/Client.md).
func get {
    need $url: Str
    return $client.get(url: $url)
}

#> Convenience method for calling `.post()` on the default
#| [client](../HTTP/doc/Client.md).
func post {
    need $url: Str
    return $client.post(url: $url)
}
