# Scopes

A scope describes the reach of a particular set of variables, functions, and
other name-mapped data.

In Ferret, each scope has an associated scope object, the properties of which
are [lexical variables](Variables.md#lexical-variables). Inheritance of lexical
variables from outer scopes is possible through the same
[ISA inheritance system](Inheritance.md) used for all objects.

## Scope

*Scope* is the base type of all scopes. The current scope object is always
accessible by the special variable [`*scope`](Variables.md#special-variables).

## Context

*Context* is a subtype of *Scope* which represents a namespace. The current
context is determined by a [`package`](Keywords.md#package) declaration. If no
package is declared, `package main` is inferred.

At document level, the scope is not the current context itself but rather a
private file scope which inherits from it. This makes it possible to confine
variables to the current file rather than exposing them globally. To share
variables between files and packages, a [`share`](Keywords.md#share) variable
declaration is needed.

For many document-level constructs, the data are assigned to a property of the
current context (and are therefore global) rather than the private file scope,
unless the construct name starts with an underscore (`_`), indicating that it is
private to the file scope. See [scopes of interest](#scope-of-interest) for more
information on private scopes.

## Class

*Class* is not technically a subtype of *Scope*. Within a
[`class`](Keywords.md#class) definition, the scope is actually a private class
scope which inherits from both the class itself and the outer
[context](#context).

This means that lexical variables defined at class level are only accessible
from within the class definition unless they are explicitly exported with a
[`share`](Keywords.md#share) variable declaration. In this case, they become
properties of the class.

Other constructs at class level such as functions, methods, and type definitions
are exported by default; see [scopes of interest](#scope-of-interest) for more
info on that.

## Scope of interest

Many constructs refer to a "scope of interest" (SOI), which determines the
external availability of the data associated with the construct.

At **document or package level**, the SOI is the current context (as determined
by a [`package`](Keywords.md#package) declaration), unless the construct name
starts with an underscore (`_`), in which case it is the private file scope. The
associated data (if public) will be accessible as a property of the context.

At **class level**, the SOI is the class itself, unless the construct name
starts with an underscore (`_`), in which case it is the private class scope.
The associated data (if public) will be accessible as a property of the class.

At **any other level**, the SOI is the current scope, and the underscore has no
special meaning.
