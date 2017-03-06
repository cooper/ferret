# Ferret

Ferret is an [evented](https://github.com/cooper/evented-object), objective
hobby programming language.

![Editor](http://i.imgur.com/0Ebp32e.png)

* [Introduction](#introduction)
* [Getting started](#getting-started)
* [Documentation](#documentation)

## Introduction

### Compiled

Ferret currently compiles exclusively to Perl, a high-level language. It might
therefore be classified as a very-high-level language (VHLL). In other words,
Ferret has many novel features, sometimes at the cost of considerable overhead.

```
say("Hello World!")
```

### Interpretable

While Ferret is a compiled language, its compiler and
runtime are both written in an interpreted language. On top of that, the
standard library provides a Ferret interface to its own compiler. This allows
Ferret to offers some features of interpreted languages such as compilation and
evaluation during runtime.

```
$code = "4.sqrt"
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

## Getting started

1. [Install](https://atom.io) Atom.
2. [Install](https://github.com/cooper/language-ferret) the `language-ferret` package.
3. [Clone](#) this repository.
4. [Install](#installation) Ferret.
5. [Browse](test) the `test` directory for code snippet examples.
6. [Explore](#documentation) the documentation.
7. [Write](#writing) in Ferret. But only as a hobby.

### Installation

After cloning the repository, Ferret requires a configuration. It's truly as
simple as specifying where on your system the repository exists.

**Using a systemwide configuration**

Copy [`ferret.conf.example`](ferret.conf.example) to `/etc/ferret.conf` and
change the top line to the full path of wherever you cloned this repository.

```sh
sudo cp ferret.conf.example /etc/ferret.conf
```

Make sure that all users have read permission.

```sh
sudo chmod 755 /etc/ferret.conf
```

After that, try running the compiler from the repository root directory to
compile the standard library.

```sh
./ferret -pdn
```

**Configuration elsewhere**

If you cannot write to `/etc/ferret.conf`, you can store your configuration
elsewhere. Just set the environment variable `$FERRET_CONFIG` to the absolute
path of your configuration file. To set it semi-permanently, add it to your
`~/.bash_profile` or the like.

```sh
export FERRET_CONFIG="/path/to/my/ferret.conf"
```

### Writing

Once you have the compiler working, you're ready to write some code. The easiest
way is to make a `sandbox` directory within this repository tree. Name your
files with `.frt`. Then [compile](#compiling).

### Compiling

Compile with the `ferret` executable, passing file paths as arguments. If no
file paths are provided, it searches the current directory and all
subdirectories for `.frt` and `.frtdoc` files. Unchanged files are ignored.
See `./ferret -h` for all flags. The entire standard library is compiled like
so:

```sh
./ferret -pd
```

After updating the repository, the compiler may have changed. You might want to
run `ferret` with the `-n` flag to force all source files to recompile.

```sh
./ferret -pdn
```

### Running

Run files with the `-r` flag:

```sh
./ferret -r test/1-hello-world.frt
```

You can also run Ferret files directly if they are executable and include the
hashbang `#!/usr/bin/env ferret -r` (assuming the ferret bin is in your `PATH`):

```sh
cd test/35-irc-new
./bot
```

### Troubleshooting

There are bugs. There is much work to be done. Some problematic scenarios are
not handled properly or do not provide helpful error messages. But there are
things you can try.

If you encounter an error while compiling, see
[troubleshooting](doc/Compilation.md#troubleshooting) in Compilation.

Otherwise, head to **#k** on **irc.notroll.net** and start complaining.

## Documentation

* [Concepts](doc/Concepts.md) - Ferret fundamental ideas
* [Compilation](doc/Compilation.md) - Breakdown of how code is compiled
* [Inheritance](doc/Inheritance.md) - Explanation of ISA inheritance system
* [Keywords](doc/Keywords.md) - Detailed account of every Ferret keyword
* [Operators](doc/Operators.md) - Detailed account of Ferret operators
* [Variables](doc/Variables.md) - Explanation of Ferret variable types

Standard library

* [String](std/doc/String.md) - UTF-8 strings
* [Number](std/doc/Number.md) - Real numbers
* [Complex](std/doc/Complex.md) - Complex numbers
* [JSON](std/doc/JSON.md) - JSON encoding/decoding
* [Math](std/doc/Math.md) - Math functions and constants
* [Math::Point](std/Math/doc/Point.md) - 2D points
* [Math::Line](std/Math/doc/Line.md) - Line segments
* [Math::Rect](std/Math/doc/Rect.md) - Rectangles
* [Math::Vector](std/Math/doc/Vector.md) - Vectors of any dimension
* [Math::Matrix](std/Math/doc/Matrix.md) - Matrices of any dimensions
* [HTTP](std/HTTP/doc) - HTTP suite
* [HTTP::Client](std/HTTP/doc/Client.md) - Represents an HTTP user agent
* [HTTP::Request](std/HTTP/doc/Request.md) - Represents an HTTP request
* [Test](std/doc/Test.md) - Basic test suite
