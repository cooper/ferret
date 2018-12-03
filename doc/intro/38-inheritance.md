# Inheritance

In Ferret, an object can belong to any number of classes.
While it might not sound particularly useful when worded that way,
this is how class inheritance works in Ferret.

Er, it's not really class inheritance... Rather than classes
inheriting from or extending each other, you just have the object
assume the roles of multiple classes.

Let's take another look at our Person class.

    class Person
    
    init {
        need @name: Str, @age: Num
    }

    method haveBirthday {
        oldAge -> @age
        newAge -> @age += 1
    }

We can create an Adult class which sorta inherits from Person.
In addition to name and age, adults have credit card numbers and
purchasing powers.

    class Adult
    
    init {

        # Note these are requested as lexial arguments here,
        # since the Person initializer called below will assign
        # them to instance properties

        need $name: Str, $age: Num

        # This one is an instance variable argument since it's new

        need @creditCardNumber

        # Here we initialize the Adult we just created (*self)
        # as a Person as well. The built-in init class function
        # actually returns an initializer function for the passed
        # object, which is why we end up with this double-call

        Person.init(*self)($name, $age)
    }

    .buySomething {
        need $what: Str, $cvv: Num
        say("Buying a $what with CC# @creditCardNumber and CVV $cvv")
    }

Now we can create an Adult and access the properties and methods of
both classes.

    $a = Adult("Mitchell", 21, "1234 5678 91011 1213")
    $a.haveBirthday()                           # works
    $a.buySomething("birthday candles", 308)    # also works

Kinda weird, yeah, but that's how we do it!

[Next: Inheritance continued](39-inheritance-2.md)