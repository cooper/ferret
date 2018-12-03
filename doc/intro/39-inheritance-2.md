# Inheritance continued

Sorry I keep fibbing to you. I just want to explain things in a way that
is maybe familiar, only to then confuse you on the pages following.

> Er, it's not really class inheritance... Rather than classes
> inheriting from or extending each other, you just have the object
> assume the roles of multiple classes.

The truth is that there's nothing special about an object inheriting from
a class. Objects in Ferret can inherit from any other objects, and classes
are no more than a syntactical convenience for Ferret's underlying
[ISA object inheritance system](../Inheritance.md).

When you create a class and define properties and methods on it, they're
added to its `proto` property. It's just a regular object which the
instances of the class inherit from directly.

Recall what the normal way looks like.

    class Person

    method haveBirthday {
        oldAge -> @age
        newAge -> @age += 1
    }

Then take a look at this demonstration of a method definition without
using any class specific syntax. But never do this. It's hideous.

    Person.proto.haveBirthday = func {
        oldAge -> *self.age
        newAge -> *self.age += 1
    }

[Next: Inheritance continued](40-inheritance-3.md)