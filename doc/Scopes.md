# Scopes

Scopes are areas in which named data are accessible. In general, data can be
reached within the scope that it was declared and any scopes inheriting from
that scope.

## Scope

*Scope* is the base class for all scopes. It is used internally only, as the
class itself is not user-accessible and does not provide any useful methods.

## Context

*Context* is a subclass of *Scope* which represents a namespace. The current
context is generally determined by a [`package`](Keywords.md#package)
declaration. However, there is always a current context, even if the package is
not declared. With no declaration, the context is assumed to be `main`.

At document level, the current scope is not the context itself, but rather a
private scope which inherits from the context. This makes it possible to confine
data within the current file rather than exposing them globally, which is the
default behavior.

This means that within a document, a lexical variable points to a property of
the private scope first, and if no such property exists, it falls back to a
property of the current context.

For many document-level constructs, the data are assigned to a property of the
current context (and are therefore global) rather than the private file scope,
unless the construct name starts with an underscore (`_`), indicating that it is
private to the file scope. See [scopes of interest](#scope-of-interest) for more
information on private scopes.

## Class

*Class* is not a subclass of *Scope*. Classes are not actually scopes at all.
Within a class, however, the current scope is a private scope specific to the
current `class` construct within the current file. This scope inherits from
both the surrounding [context](#context) and the class itself.

This means that within a class, a lexical variable points to a property of
the private scope first, and if no such property exists, it falls back to a
property of the current class. Furthermore, if no such class property exists,
it falls back to a property of the surrounding context.

For many class-level constructs, the data are assigned to a property of the
class itself (and are therefore global) rather than the private scope,
unless the construct name starts with an underscore (`_`), indicating that it is
private and should be a property of the `class` construct's private scope.
See [scopes of interest](#scope-of-interest) for more information on private
scopes.

## Scope of interest

Many constructs refer to a "scope of interest" (SOI), which determines the
availability of whatever data the construct produces. The finished product will
be accessible only within the SOI and the scopes which inherit from it. The SOI
is determined by the hierarchical level of the construct within the document.

At **document level**, the SOI is the current package context, unless the
construct name starts with an underscore (`_`), in which case it is a private
scope inheriting from the current package context. In other words, private
document-level data will only be accessible in the current file.

At **class level**, the SOI is the class itself, unless the construct name
starts with an underscore (`_`), in which case it is a private scope inheriting
from both the class and the current package context. This means that many data
at class level become class properties, but private data at class level are
only accessible within the current `class` construct within the current file.

At **any other level**, the SOI is the current scope, and the underscore (`_`)
serves no purpose.
