# defer

[`defer`](../Keywords.md#defer) defers the execution of a
statement until the surrounding function returns.

    func ok {
        defer: say("goodbye")
        say("hello")
    }

    ok()    # says "hello" then "goodbye"

If multiple instances of `defer` occur in a routine, they are executed in the
order that the keyword was reached with normal control flow in consideration.

[Next: detail](23-detail.md)