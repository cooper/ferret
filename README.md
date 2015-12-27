# Ferret

Ferret is an evented, objective hobby programming language.

![Editor](http://i.imgur.com/ULCvNDM.png)

### Compiled

Ferret currently compiles exclusively to Perl, a high-level language. It might
therefore be classified as a very-high-level language (VHLL). In other words,
Ferret has many novel features, sometimes at the cost of considerable overhead.

```
say("Hello World!")
```

```perl
$scope->property_u('say')->call_u( [ str( $f, "Hello World!" ) ], $scope );
```

### Interpretable

While Ferret is a compiled language, its compiler and
runtime are both written in an interpreted language. On top of that, the
standard library provides a Ferret interface to its own compiler. This allows
Ferret to offers some features of interpreted languages such as compilation and
evaluation during runtime.

```
$code = "sqrt(4)"
$two = COMPILER($code).eval().result
```

### Concepts

Ferret was originally titled
[__EOPRJ__](https://github.com/cooper/evented-objective-perl-ruby-javascript),
an acronym in which each letter represents a core focus or idea.

See [Concepts](doc/Concepts.md) for a list of Ferret's fundamentals.

### Inheritance

Ferret features a unique ISA inheritance system in which all values are objects,
objects can inherit from any number of objects, and all objects' properties are
inheritable.

See [Inheritance](doc/Inheritance.md) to explore the ISA inheritance system.

### Runtime

Ferret features a transparent runtime based on an I/O framework. If
asynchronous operations are occurring at any given moment, a Ferret program
will continue processing until all operations are complete. It is not necessary
to create custom run loops, and Ferret will effortlessly make use of
system-specific polling methods.

```
delay(5) {
    say("it's been five seconds!")    
}

say("starting timer...")
```

### Compilation

Compilation is a multi-stage process. Put simply, the compiler converts
Ferret code into tokens, tokens into an objective document model
(hierarchical tree), and objects into Perl code.

That's the gist, but there's more to it. See [Compilation](doc/Compilation.md)
for a breakdown of the process.
