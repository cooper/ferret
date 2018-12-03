# Scopes and contexts

All Ferret code exists within a private [**scope**](../Scopes.md).

Execution of a Ferret program begins at the file level. There's
no `main` routine-- we just jump right into the first line.

    say("Hello, World!")

By default, variables are accessible only within the scope where
they're defined. So, `$who` below would not be accessible in another
file since it belongs to the private top level file scope.

    $who = "World"
    say("Hello, $who!")

However, all files belong to a public [context](../Scopes.md#context).
The context is specified by a [`package`](../Keywords.md#package)
declaration. When omitted, `package main` is presumed.

To expose `$who` to another file, we'll add both files to
`package Greeting` and [`share`](../Keywords.md#share) the variable.

vars.frt

    package Greeting

    share $who = "World"

main.frt

    package Greeting

    share $who
    say("Hello, $who!")

[Next: Imports and file loading](3-importing-loading.md)