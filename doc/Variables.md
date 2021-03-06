# Variables

Variables are identifiers prefix and/or suffixed with sigils.

## Lexical variables

Lexical variables are identified by the `$` sigil.

Lexical variables are specific to the [scope](Scopes.md) in which they are
declared. Scopes which inherit from that scope can access them, but exterior
scopes cannot.

Lexical variables are implemented as properties of the current scope object.
Inheritance of variables from external scopes is possible through the
same [ISA inheritance system](Inheritance.md) used for all objects. For this
reason, `$var` is functionally equivalent to `*scope.var`.

Tokenized as `VAR_LEX`.

## Instance variables

Instance variables are identified by the `@` sigil.

Instance variables are only valid within class methods. They refer
to properties of the current class instance. For this reason, `@var` is
functionally equivalent to `*self.var`.

Tokenized as `VAR_SELF`.

## This variables

Maybe don't use this. I [can't decide](https://github.com/cooper/ferret/issues/65)
its fate.

This variables are identified by the `%` sigil.

This variables are valid within any function or method. They refer
to properties of the object on which the event was fired. For this reason,
`%var` is functionally equivalent to `*this.var`.

Often times, `*self` and `*this` refer to the same object. However, this is not
always the case. Within an `on` block, you should always use `*this` and `%`
variables to reference the object on which the event is fired, because `*self`
will refer to the same `*self` as the containing scope.

Tokenized as `VAR_THIS`.

## Special variables

Special variables are identified by the `*` sigil.

Special variables refer to properties of the current scope's special object. All
scopes, as well as other select objects, possess a special object. However, such
objects cannot be accessed directly; their properties can only be retrieved
using this type of variable.

* __*scope__ - refers to the current [scope](Scopes.md) object
* __*return__ - within a function, refers to the return object
* __*class__ - within a class, refers to the class itself
* __*self__ - within a class, refers to the current instance
* __*this__ - within event callback functions, refers to the object on which the
event was called
* __*argv__ - refers to the list of arguments passed to the program
* __*file__ - replaced at compile time with the name of the source file
* __*line__ - replaced at compile time with the current line in the source file

Tokenized as `VAR_SPEC`.

## Symbols

Symbols are identified by the `:` sigil.

Symbols are global objects associated with their identifiers. Therefore,
`:sym` is always referentially equivalent to to `:sym` anywhere else. In other
words, two symbols of the same identifier are memory-address-equivalent,
so `:sym === :sym`. Always.

Tokenized as `VAR_SYM`.

## Property variables

Property variables are defined by the `.` sigil.

They are tokenized separately from the normal `PROPERTY`. The difference is
that normal properties can never have whitespace between the object and period.

Property variables are only valid within body of an
[`inside`](Keywords.md#inside), [`type`](Keywords.md#type), or zero-argument
[`function`](Keywords.md#func). They provide a
shorthand syntax for `$obj.property`, allowing it to instead be written as just
`.property`.

Tokenized as `VAR_PROP`.
