# Argument types

Although you never have to specify accepted types, sometimes it's a good
idea to ensure the passed data is what you expect.

    func addTwoNums {
        need $x: Num, $y: Num
        -> $x + $y
    }

    addTwoNums(1, 2)        # Returns 3
    addTwoNums(Math.pi, 4)  # Returns 7.14159...
    addTwoNums(5, "Six")    # UnsatisfiedArguments error

(Yeah, that weird arrow is Ferret's
[return operator `->`](../Operators.md#return-operator)).

If you [`want`](../Keywords.md#want) an arg to be a certain type, but
the passed value does not comply, you can fall back to another value.

    func registerUser {
        want $who: Str = "anonymous"
        need $age

        sayHello("Here's your username: $who$age")
    }

    registerUser("Mitchell", 21)        # Here's your username: Mitchell21
    registerUser(21, 21)                # Here's your username: anonymous21
    
[Next: Multiple return values](7-multiple-returns.md)