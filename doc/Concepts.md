# Concepts

Ferret was originally titled
[__EOPRJ__](https://github.com/cooper/evented-objective-perl-ruby-javascript),
an acronym in which each letter represents a fundamental idea.

## Evented

Ferret makes extensive use of
[Evented::Object](https://github.com/cooper/evented-object).
All functions and methods in Ferret are implemented as events.

```
class Person

init {
    need @name: Str, @age: Num
}

# all methods are implemented as events
method haveBirthday {
    $old = @age
    @age = $old + 1
    oldAge -> $old
    newAge -> @age
}

```

Example use of event

```
# create a person
$person = Person(name: "Jake", age: 22)

# add an event callback for haveBirthday
on $person.haveBirthday {
    say("Happy Birthday Jake!")
}
```

It is also possible to respond to events regardless of object.

```
on Person.proto.haveBirthday {
    say("Happy Birthday *this.name!")
}
```

## Objective

All Ferret data types are objects. Yeah, that sounds pretty cliché nowadays,
but Ferret's inheritance system makes it unique (see "Inheritance").

```
"hello".length                          # 5
1.odd                                   # true
(test: "hello").test                    # "hello"
Math::Rect(10, 10, 10, 10).center       # Point(10, 10)
```

## Perl

If Ferret resembles one language more than all others, that
language is probably Perl. Just look at all its sigils, brackets, and
parentheses. And although Perl's basic datatypes are value types,
its extensive use of references influenced the fact that all Ferret values
are referential. And Perl happens to be the language to which Ferret
compiles, as well as the one in which its compiler and runtime are written.

```
(hello: "world")
```

```perl
FF::create_object($f, { hello => str($f, "world") })
```

## Ruby

The original EOPRJ syntax looked a lot like Ruby, without many curly
brackets or parentheses, but it has since evolved into a more C/Perlish look.
However, Ferret still shares with Ruby the "everything is an object" concept, a
similar type of class definition, and a symbol datatype (`:symbol`).

## JavaScript

Ferret's properties are similar to those of JavaScript.
Any object may or may not have a value for a string key, and properties are
not considered at compile time. Ferret also has JavaScript-style prototypes.
