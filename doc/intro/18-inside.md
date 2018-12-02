# inside

Earlier I mentioned [property variables](../Variables.md#property-variables)
briefly. Ferret has an [`inside`](../Keywords.md#inside) construct which allows
the properties of an object to be accessed as variables. 

It's useful when accessing or altering several properties of the same object
at once.

    $x = 5

    inside $person {
        .age  = $x * 4 + 6
        .name = "Pam"
        say("Hello " + .firstName)
    }

    inspect($person) # (age: 26, name: "Pam")

This is similar to JavaScript's
[`with`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/with),
but it is safer and less ambiguous because the `.` sigil distinguishes
properties from lexical variables which use `$` (like `$x` in the above example).

[Next: if inside](19-if-inside.md)