# Initializers

Most commonly, in order to create a class instance, you probably
require certain information or at least need to define some default
property values.

[`init`](../Keywords.md#init) is a special method which allows
you to do so.

    class Person

    init {
        need $name: Str, $age: Num
        @name = $name
        @age  = $age
    }

Those variables prefixed with the `@` sigil are
[instance variables](../Variables.md#instance-variable), which I
mentioned very briefly a little while ago.

In this example, the initializer requires a string name and numeric
age; then it copies the passed values to properties of the newly
created object.

Note how `init` automatically returns said object.

Now that we have this basic class definition, we can create a
Person and access its properties like so.

    $p = Person("Mitchell", 21)

    $p.name # Mitchell
    $p.age  # 21

[Next: Instance variable arguments](32-instance-variable-arguments.md)