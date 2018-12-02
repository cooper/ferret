# Imports and file loading

vars.frt

    package Greeting

    share $who = "World"

main.frt

    package Greeting

    share $who
    say("Hello, $who!")

But how does Ferret know which files to load? It's usually really good at
guessing by Uppercase references. For instance, if your code mentions
`Math.pi`, the Math package will be loaded automatically.

In this case, however, since we are working with two files in the same
package, we'll have to [`load`](../Keywords.md#load) `vars.frt` manually:

main.frt

    package Greeting
    load vars

    share $who
    say("Hey $who, did you know the value of π is " + Math.pi + "?")

Notice how `load Math` was not needed since we referenced the Math package
in the code.

[Next: Objects](3.5-objects.md)