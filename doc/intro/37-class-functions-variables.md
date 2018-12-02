# Class functions and variables

If you're inside a `class`, you can still define functions and
variables just like you might at file scope.

    class MyClass

    $privateVar = "All variables are private unless shared"
    share $publicVar = "This one is Person.publicVar"

    # All functions are public unless they start with underscore
    # This one is accessible as Person.publicFunc()
    func publicFunc {
    }

    # This one is accessible only within this class declaration
    # in this particular file as _privateFunc()
    func _privateFunc {
    }

As demonstrated above, variables are always private unless
[`share`d](../Keywords.md#share), while functions are always publicly
exposed unless they start with an underscore.

[Next: Inheritance](38-inheritance.md)