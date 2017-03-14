# Ferret

Ferret is an [evented](https://github.com/cooper/evented-object), objective
hobby programming language.

![Editor](http://i.imgur.com/0Ebp32e.png)

* [Concepts](#concepts)
  * [Events](#events)
  * [Inheritance](#inheritance)
  * [Runtime](#runtime)
  * [Compiled](#compiled)
  * [Interpretable](#interpretable)
* [Getting started](#getting-started)
  * [Installation](#installation)
  * [Writing](#writing)
  * [Compiling](#compiling)
  * [Running](#running)
  * [Troubleshooting](#troubleshooting)
* [Documentation](#documentation)
  * [Language](#language)
  * [Standard library](#standard-library)
  * [Technical](#technical)

## Concepts

### Events

All functions and methods in Ferret are implemented as
[events](doc/Functions.md).

This means that for every named function or method, any number of callbacks may
be hidden behind it, each of which accepts its own arguments and spits out its
own return values. This makes it really easy to extend existing code without
breaking things.

### Inheritance

Ferret features a [unique inheritance system](doc/Inheritance.md) in which all
values are objects, each of which can inherit from any number of other objects.

### Runtime

Ferret's transparent runtime makes it easy to manage I/O, timers, asynchronous
operations, and more – all without implementing your own event loop.

If asynchronous operations are occurring at any given moment, a Ferret program
continues processing until those operations are complete. Ferret also
effortlessly makes use of system-optimized polling methods for I/O.

```
delay(5) {
    say("it's been five seconds!")    
}

say("starting timer...")
```

### Compiled

Ferret currently [compiles](doc/Compilation.md) exclusively to Perl, a
high-level language. It might therefore be classified as a very-high-level
language (VHLL). In other words, Ferret has many novel features, often at the
cost of considerable overhead.

```
say("Hello World!")
```

### Interpretable

While Ferret is a compiled language, its compiler and
runtime are both written in an interpreted language. On top of that, the
standard library provides an interface to the compiler. This allows Ferret to
offer some features of interpreted languages such as compilation and
evaluation during runtime.

```
$code = "4.sqrt"
$two = COMPILER($code).eval().result
```

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
./ferret -n
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
./ferret
```

After updating the repository, the compiler may have changed. You might want to
run `ferret` with the `-n` flag to force all source files to recompile.

```sh
./ferret -n
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

Otherwise, head to `#k` on `irc.notroll.net` and start complaining.

## Documentation

### Language

* [Keywords](doc/Keywords.md) - Detailed account of Ferret keywords
* [Operators](doc/Operators.md) - Detailed account of Ferret operators
* [Variables](doc/Variables.md) - Explanation of Ferret variable types
* [Functions](doc/Functions.md) - Explanation of Ferret functions and events
* [Scopes](doc/Scopes.md) - Explanation of Ferret contexts and lexical scoping
<!-- * [Classes](doc/Classes.md) -->
<!-- * [Runtime](doc/Runtime.md) -->

### Standard library

Basic datatypes

* [String](std/doc/String.md) - UTF-8 strings
* [Number](std/doc/Number.md) - Real numbers
* [Complex](std/doc/Complex.md) - Complex numbers

Math

* [Math](std/doc/Math.md) - Math functions and constants
    * [Point](std/Math/doc/Point.md) - 2D points
    * [Line](std/Math/doc/Line.md) - Line segments
    * [Rect](std/Math/doc/Rect.md) - Rectangles
    * [Vector](std/Math/doc/Vector.md) - Vectors of any dimension
    * [Matrix](std/Math/doc/Matrix.md) - Matrices of any dimensions

Date and time

* [Time](std/doc/Time.md) - Represents a moment in time
    * [Duration](std/doc/Time/Duration.md) - Represents a duration of time

Networking

* [HTTP](std/HTTP/doc) - HTTP suite
    * [Client](std/HTTP/doc/Client.md) - Represents an HTTP user agent
    * [Request](std/HTTP/doc/Request.md) - Represents an HTTP request
* [IRC](std/doc/IRC.md) - IRC suite <!-- nonexistent -->
    * [Connection](std/IRC/doc/Connection.md) - IRC client
    * [Massage](std/IRC/doc/Massage.md) - Represents an IRC message
    * [Server](std/IRC/doc/Server.md) - Represents an IRC server
    * [User](std/IRC/doc/User.md) - Represents an IRC user
    * [Channel](std/IRC/doc/Channel.md) - Represents an IRC channel

Development

* [Test](std/doc/Test.md) - Basic test suite

### Technical

* [Compilation](doc/Compilation.md) - Breakdown of how code is compiled
* [Tokenizer](doc/Tokenizer/Tokenizer.md) - Tokenizes Ferret source code <!-- empty -->
    * [Tokens](doc/Tokenizer/Tokens.md) - List of tokens <!-- empty -->
* [Constructor](doc/Constructor/Constructor.md) - Generates document model from tokens <!-- empty -->
    * [Elements](doc/Constructor/Elements.md) - List of element types
    * [Element](doc/Constructor/Element.md) - The base of all elements
    * [Node](doc/Constructor/Node.md) - The base of all nodes
    * [Rules](doc/Constructor/Rules.md) - Token and element rules <!-- incomplete -->
* [Inheritance](doc/Inheritance.md) - Explanation of ISA inheritance system
