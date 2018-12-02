# Multiple initializers

A class can have any number of initializers. They can refer to
one another or operate independently.

Behold this example which allows you to create a person given
separate first and last names and a birth year.

    class Person

    init {
        need @name: Str, @age: Num
    }

    init {
        need $firstName: Str, $lastName: Str
        need $birthYear: Num

        $approxAge = Time.now().year - $birthYear
        -> Person("$firstName $lastName", $approxAge)
    }

I could easily implement that second initializer without
referencing the first one, too.

    init {
        need $firstName: Str, $lastName: Str
        need $birthYear: Num

        @name = "$firstName $lastName"
        @age = Time.now().year - $birthYear
    }

Note that the first initializer always dictates the Class's signature.
That means for all others, you MUST specify argument names.

    # This is fine, uses default initializer
    $p = Person("Mitchell", 21)

    # The argument names MUST be specified for all other initializers
    $p = Person(firstName: "Mitchell", lastName: "Cooper", birthYear: 1997)

[Next: Methods](34-methods.md)