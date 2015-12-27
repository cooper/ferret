package HTTP
class Request

init {

    # hold a weak reference to the client.
    need $client: Client
    @client = $client
    weaken @client

    need @url: Str
    need @httpMethod: Sym
}

#
method connect {
    NATIVE::HTTPClient.connect(@client, *self)
}

# called when the connection opens
# may be called multiple times if redirected or retried
method connected

# called when redirected
method redirect

# called when a connection error occurs
method error

# called when a response comes in
method response
