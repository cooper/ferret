# Function and method shorthand

If a method body contains at least one
[`want`](../Keywords.md#want) or [`need`](../Keywords.md#need),
you can ditch the [`method`](../Keywords.md#method) keyword and
use the same dot-syntax used by computed properties.

    class Person

    init {
        need @name: Str, @age: Num
    }

    # This is a method in shorthand form
    .isOldEnough {
        need $testAge: Num
        -> @age >= $testAge
    }

    # This is interpreted as a computed property since it has no
    # want/need arguments
    .approxBirthYear {
        -> Time.now().year - @age
    }

Another convenient shorthand is the one-liner method or computed property.
It allows you to drop the braces when the body contains only a single return statement.

    .approxBirthYear -> Time.now().year - @age
    method noArgumentMethod -> "I am a pointless method spitting out the same thing no matter what"

This works for functions outside of classes, too. Sorry that I'm only just now mentioning it.

    func doNothing -> "I am a pointless function also"

[Next: Class functions and variables](37-class-functions-variables.md)