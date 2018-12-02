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

Usually, if a lexical variable exists and you assign to it,
the value is overwritten:

    $something = "I'm giving up on you"

    func saySomething {
        $something = "Another message"
        say($something)
    }

    # Right now, $something is still "I'm giving up on you"

    saySomething()
    # But now it's "Another message." Even out here.

However, if you explicitly re-initialize the variable with
[`var`](../Keywords.md#var), it becomes local to the
innermost scope.

    $something = "I'm giving up on you"

    func saySomething {
        var $something = "Another message"
        say($something)    
    }

    saySomething()  # Spits out "Another message"
    say($something) # Spits out "I'm giving up on you"

`var` is only ever required in these cases. Any other time,
the first assignment of a new lexical variable has the same effect
as declaring it explicitly with `var`.

[Next: Other types of variables](9-other-variables.md)