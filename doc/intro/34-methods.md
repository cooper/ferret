# Methods

[Methods](../Functions.md#method) are like functions, but they can be
called on instances of a class to perform some relevant operations.

    class Person
    
    init {
        need @name: Str, @age: Num
    }

    method haveBirthday {
        oldAge -> @age
        newAge -> @age += 1
    }

Call the method like so.

    $p = Person("Mitchell", 21)
    $p.haveBirthday()   # Returns (oldAge: 21, newAge: 22)
    $p.age              # Now 22

[Next: Computed properties](35-computed-properties.md)