# Lexical variables

So far the only type of variables we've worked with is lexical.
Recall what you learned about file scopes earlier. Similar rules
apply to functions, `if` statements, `for` loops, and all sorts
of constructs.


Take a look at this. This is fine.

    $something = "I'm giving up on you"

    func saySomething {
        say($something)
    }

But this is not. It produces a compile-time UndeclaredVariableReference error.

    func saySomething {
        say($something)
    }

    $something = "I'm giving up on you"

[Next: Lexical variables continued](8.5-lexical-variables-2.md)