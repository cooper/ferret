# Inheritance continued

So, when you "call" a class to create a new instance like this...

    $p = Person("Mitchell", 21)

What it's really doing is this.

    $p = (:)    # Creates a normal object. Ain't nothin fancy bout it.
    Person.init($p)("Mitchell", 21)     # Initializes the object as a Person

Wanna see something super weird and useless? I'm gonna make a standard object
then turn it into both a string and a number with completely different values.

    # I created an object
    $o = (random: "property")

    # I initialized that object as a string
    Str.init($o)("Magic")

    # $o is literally a string now with value "Magic"
    say($o)         # "Magic"
    say($o.random)  # "property" Still there from when I created the object

    # Now I'm gonna initialize my object as a Number too.
    Num.init($o)(4)

    # The object now has tons of conflicts for things like operator
    # implementations. The most recently added parent always wins.

    say($o * 5)         # "20"      Because Num's implemention of * wins
    say($o.uppercase)   # "MAGIC"   Because only Str has an uppercase property

I'm not sure if it was worth telling you all that. Just thought you might
find it interesting to know what's happening behind the scenes. And
hopefully the Adult example from earlier makes more sense now???

[Next: Class extensions](41-class-extensions.md)