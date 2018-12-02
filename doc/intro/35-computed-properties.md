# Computed properties

Computed properties are like methods which accept no arguments
and usually return a single value which is evaluated at the time
the property is accessed.

    class Person
    
    init {
        need @name: Str, @age: Num
    }

    .approxBirthYear {
        -> Time.now().year - @age
    }

They're accessed just the same as any property.

    $p = Person("Mitchell", 21)
    $p.approxBirthYear      # 1997

Suffixing the property name with a question mark `?` indicates
that, once evaluated the first time, we should store it semi-permanently.
This is called a once-computed property.

    .approxBirthYear? {
        -> Time.now().year - @age
    }

If we accessed that `approxBirthYear` property, changed the Person's `age`,
and accessed `approxBirthYear` again, it would then be incorrect. That's
because the value will only be evaluated once when `?` is present.

[Next: Method shorthand](36-method-shorthand.md)