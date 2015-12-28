package HTTP 1.0

type HTTPMethod {
    :GET
    :POST
}

# default HTTP client
$client ?= HTTP::Client()

func get {
    need $url: Str
    return $client.get(url: $url)
}

func post {
    need $url: Str
    return $client.post(url: $url)
}
