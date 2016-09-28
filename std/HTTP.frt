package HTTP 1.0

#> HTTP methods.
type HTTPMethod {
    :GET        #< HTTP GET method
    :POST       #< HTTP POST method
}

# default HTTP client
$client ?= HTTP::Client()

#> Convenience method for calling `.get()` on the default client.
func get {
    need $url: Str
    return $client.get(url: $url)
}

#> Convenience method for calling `.post()` on the default client.
func post {
    need $url: Str
    return $client.post(url: $url)
}
