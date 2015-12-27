# Ferret

Ferret is an evented, objective hobby programming language.

![Editor](http://i.imgur.com/ULCvNDM.png)

```
say("Hello World!")
```

## Getting started

1. Install [Atom](https://atom.io).
2. Install the [`language-ferret`](https://github.com/cooper/language-ferret) package.
3. Clone this repository.
4. [Install Ferret](#installation).
5. Browse the [`test`](test) directory for code snippet examples.
6. Explore the [documentation](#documentation).
7. [Start writing in Ferret](#writing). But only as a hobby.

### Installation

After cloning the repository, Ferret requires a systemwide configuration.
Currently, it must be stored at `/etc/ferret.conf`. Make sure the whole system
has read access. Later, alternative methods will be available which do not
require root access.

Copy `ferret.conf.example` to `/etc/ferret.conf` and change the top line to
the full path of wherever you cloned this repository.

After that, try running `./ferret -pdn` from the repository root directory
(recompile the standard library) to verify that all is working.

### Writing

Once you have the compiler working,

### Compiling

Compile with the `ferret` executable. It searches the current directory and all
subdirectories for `.frt` files. See `./ferret -h` for all flags. The entire
standard library is compiled like so:

```sh
./ferret -pd
```

After updating the repository, the compiler may have changed. You may want to
run with the `-n` flag to force all files to recompile.

```sh
./ferret -pdn
```

### Running

The Ferret compiler will soon be capable of automatically generating executables,
but for the time being, simply run the output Perl files with `perl`. If the
code depends on other packages, make sure you run it from the correct directory.
For example, the IRC bot example in `test/20-irc-complex` should be run like so:

```sh
cd test/20-irc-complex
perl build/run.frt.pm
```

Do NOT run Ferret code directly from the `build` directory.

### Troubleshooting

There are bugs. There is much work to be done. Some problematic scenarios are
not handled properly or do not provide helpful error messages. But there are
things you can try.

If you encounter an error while compiling, see
[troubleshooting](doc/Compilation.md#troubleshooting) in Compilation.

Otherwise, head to **#k** on **irc.notroll.net** and start complaining.

## What is Ferret?

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

## Documentation

* Concepts
* Compilation
* Inheritance
* Keywords
* Operators
* Variables
