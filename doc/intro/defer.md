# defer

[`defer`](../Keywords.md#defer) defers the execution of
some code until the surrounding function returns.

It can be written with a block as `defer {}` or using
the colon for a one-liner as shown below.

    func ok {
        defer: say("goodbye")
        say("hello")
    }

    ok()    # says "hello" then "goodbye"

If multiple instances of `defer` occur in a routine, they are executed in the
order that the keyword was reached with normal control flow in consideration.