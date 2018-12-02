# Instance variable arguments

Within a class initializer or method, you can use
[`want`](../Keywords.md#want) and [`need`](../Keywords.md#need)
with instance variables.

Thus, we can simplify this.

    class Person

    init {
        need $name: Str, $age: Num
        @name = $name
        @age  = $age
    }

To this.

    class Person

    init {
        need @name: Str, @age: Num
    }

[Next: Multiple initializers](33-multiple-initializers.md)