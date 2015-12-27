# Variables

Variables are identifiers prefix and/or suffixed with sigils.

## Lexical variables

Lexical variables are identified by the `$` sigil.

Lexical variables are specific to the
scope in which they are declared. Scopes which inherit from that scope can
access them, but exterior scopes cannot.

Lexical variables are actually implemented as properties of the current scope
object. Inheritance of variables from external scopes is possible through the
same ISA inheritance system used for all objects. For this reason, `$var` is
functionally equivalent to `*scope.var`.

Tokenized as `VAR_LEX`.

## Instance variables

Instance variables are identified by the `@` sigil.

Instance variables are only valid within class functions and methods. They refer
to properties of the current class instance. For this reason, `@var` is
functionally equivalent to `*self.var`.

Tokenized as `VAR_THIS`.

## Special variables

Special variables are identified by the `*` sigil.

Special variables refer to properties of the current scope's special object. All
scopes, as well as other select objects, possess a special object. However, such
objects cannot be accessed directly; their properties can only be retrieved
using this type of variable.

* __*scope__ - refers to the current scope object
* __*return__ - within a function, refers to the return object
* __*class__ - within a class, refers to the class itself
* __*self__ - within a class, refers to the current instance
* __*this__ - within event callback functions, refers to the object on which the
event was called
* __*argv__ - refers to the list of arguments passed to the program

Tokenized as `VAR_SPEC`.

## Set type variables

Set type variables are identified by the `<` and `>` delimiters.

Set type variables represent a class for a set type. They are useful for set
argument declarations, e.g. `need $nums: <Num>`, and for explicitly specifying
the type to which elements in a set must conform, e.g. `<Num>(1, 2, 3)` (as
opposed to simply `(1, 2, 3)`, where the runtime will choose a set type in a
best-guess effort).

`<Type>` is functionally equivalent to `Type.Set`. If the type specified does
not exist, the set type variable will possess the `undefined` value.

Tokenized as `VAR_SET`.

## Symbols

Symbols are identified by the `:` sigil.

Symbols are global objects associated with their identifiers. Therefore,
`:sym` is always referentially equivalent to to `:sym` anywhere else. In other
words, two symbols of the same identifier are memory-address-equivalent,
so `:sym === :sym`. Always.

Tokenized as `VAR_SYM`.

## Property variables.

Property variables are defined by the `.` sigil.

They are tokenized separately from the normal `PROPERTY`. The difference is
that normal properties can never have whitespace between the object and period.

Property variables are only valid within body of an
[`inside`](Keywords.md#inside). They provide a shorthand syntax for
`$obj.property`, allowing it to instead be written as just `.property`.

Tokenized as `VAR_PROP`.
