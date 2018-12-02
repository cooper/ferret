# Function arguments

To make things look neater, function arguments are written
inside the body rather than the function declaration header.

Here, we [`want`](../Keywords.md#want) a name to be passed so
we know who we're saying hello to, but if not, we're not going
to make a fuss. We just fall back to the default "someone."

    func sayHello {
        want $who = "someone"
        say("Hello, $who!")
    }

    sayHello("Jen")     # Hello, Jen!
    sayHello()          # Hello, someone!

Sometimes though, we [`need`](../Keywords.md#need) certain info
to proceed...

    func registerUser {
        want $who = "anonymous"
        need $age

        sayHello("Here's your username: $who$age")
    }

    registerUser("Mitchell", 21)        # Here's your username: Mitchell21
    registerUser("Aubrey")              # UnsatisfiedArguments error
    registerUser(age: 49)               # Here's your username: anonymous49

[Next: Argument types](6-argument-types.md)