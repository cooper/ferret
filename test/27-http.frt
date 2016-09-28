inside HTTP.get("http://google.com") {

    on .connected {
        say("Connected!")
    }

    on .redirect {
        need $location: Str
        say("Redirected to $location")
    }

    on .response {
        #need $response: HTTP::Response
        need $content: Str
        say("Got content! Length $content.length")
        #inspect($response)
    }

    on .error {
        # need $err: Error
        say("Got error!")
    }

    .connect()
}
