# if inside

There's a shorthand syntax for the common scenario of using
`if` and `inside` together: [`if inside`](../Keywords.md#if-inside).

`if $x { inside $x { ... } }` can be written simply as `if inside $x { ... }`.

    func getNames {
        need $first: Str, $last: Str
        firstName -> $first
        lastName  -> $last
    }

    # this will work. it will say "Hello, Sam Smith!"
    if inside getNames("Sam", "Smith") {
        $name = .firstName + " " + .lastName
        say("Hello, $name!")
    }

    # this will do nothing because the second argument is wrong type,
    # causing the function to fail and the if conditional to be untrue
    if inside getNames("Sam", 0) {
        $name = .firstName + " " + .lastName
        say("Hello, $name!")
    }
    else {
        say("This will be reached")
    }

[Next: gather](20-gather.md)