# Keywords

This documentation explains the uses of each compile-time keyword. All of these
keywords are reserved for these purposes only and may not be used for the names
of variables, functions, classes, or any other types of symbols.

## Document-level

### package

```
package <name> [<version>]
```

Declares the document's package name. Package names determine the current
context object, which is essentially a namespace. All contexts are global, and
their names are always root-level.

At this time, only one package declaration per document is supported. Although
it generally appears on the first line, its location within the file is
insignificant. It does not require termination.

```
package Hello 1.0
```

See [Contexts](Scopes.md#context) for general information on namespaces.

### class

```
class <name> [<version>]
```

Declares a class. Many class declarations can exist within a single document.
Terminated with the `end` keyword or another `class` declaration.

```
class Person 1.0
```

See [Classes](Classes.md) for general information on classes.

### end

```
end
```

Terminates a `class`. It is required for that purpose, except when multiple
classes in a row are declared, in which case the `class` keyword alone
terminates the previous class. When multiple package declarations per document
become possible, this keyword will also terminate a `package`.

### load

```
load <package_name>
```

Explicitly indicates that a package should be loaded. Packages are loaded
automatically simply by referencing their names, so `load` is **almost never
required**. Its occasional use case is when a package should be loaded but is
not actually referenced within the current file.

`load` provides no true function beyond a human-readable statement with a clear
intent. It is functionally equivalent to simply stating a package name alone in
void context. In fact, it does not affect the compiled code in any way.

Additionally, `load` cannot enforce that a package actually be loaded. If such
a file is not found or has errors, the statement will be quietly ignored, and
the runtime will attempt to continue normal execution.

```
load My::Package
```

## Constants

### true

```
true
```

Represents the boolean true value, a global object.

```
1.odd   # true
1.even  # false
```

### false

```
false
```

Represents the boolean false value, a global object.

```
1.odd   # true
1.even  # false
```

### undefined

```
undefined
```

Represents the undefined value, a global object.

```
$x = 1
delete $x
# $x is now undefined
```

## Variable declarations

Simple variable declarations require no keyword. Simply assign to a previously
unused variable, and the compiler will detect that it is a first occurrence.

### share

```
share $<name> [= <value>]
```

Shared variable declaration. It is named such to reflect its behavior, which is
to share a variable from an external scope. If such a variable does not exist,
it is created within the scope containing this keyword.

```
package Hello
share $x        # perhaps $x already exists in another file
$x              # no reference error since shared
```

### local

```
local $<name> [= <value>]
```

Local variable declaration. When a variable is declared with this keyword, the
operations involving the variable will not affect a variable of the same name in
any outer scope. `local` is only to be used when the variable already exists
outside of the declaration's scope.

```
$x = 1

func wontChangeX {
    local $x = 2
    return $x
}

wontChangeX()   # returns 2

# out here, $x is still 1
```

### want

```
want ($ | @)<name>[: <type>] [= <fallback_value>][, more...]
```

Function optional argument declaration. Typically used at the start of a
function body to indicate the name and type of an optional argument. Multiple
comma-separated declarations can exist with a single `want` keyword.

If the bareword `type` is provided, the value of the variable will be undefined
if the passed argument is not of that type. If `fallback_value` is provided,
the variable will be set to that value when the argument is not provided or is
of an incorrect type.

Within a class method, `want` may contain instance variables. This is especially
useful for providing initial property values within `init` methods.

```
func sayHello {
    want $name: Str = "Guest"
    say("Hello $name!")
}

sayHello("Steve")   # "Hello Steve!"
sayHello()          # "Hello Guest!"
sayHello(7)         # "Hello Guest!"
```

### need

```
need ($ | @)<name>[: <type>] [= <required_value>][, more...]
```

Function required argument declaration. Typically used at the start of a
function body to indicate the name and type of a required argument. Multiple
comma-separated declarations can exist with a single `need` keyword.

If the bareword `type` is provided, the function will not be executed if the
passed argument is not of that type. If `required_value` is provided, the
function will not be executed if the passed argument is not equal to that value
(with the behavior of the `==` operator). This is useful for multi-function
events where certain callbacks are only applicable to specific argument values.

Within a class method, `need` may contain instance variables. This is especially
useful for providing initial property values within `init` methods.

```
func sayHello {
    want $name: Str = "Guest"
    say("Hello $name!")
}

on sayHello, :askWeather {
    need $sunny: Bool = true
    say("Nice weather we're having, huh?")
}

sayHello(name: "Steve")                 # "Hello Steve!" other callback ignored
sayHello(name: "Steve", sunny: true)    # "Hello Steve!" "Nice weather..."
sayHello(name: "Steve", sunny: false)   # "Hello Steve!" other callback ignored

# the last one is not executed because,
# although false is Bool, it does not == true
```

## Property modifiers

These modifiers can be used on mutable properties and variables.

### delete

```
delete ( ($ | @)<name> ) | ( <object>.<property> )
```

Deletes the reference to the value of the property or variable. It will then
adopt the `undefined` value. If the value object is not referred to elsewhere,
it will be disposed of by garbage collection immediately following the `delete`
statement.

```
delete $noLongerNeeded
delete $message.temporaryValue
```

### weaken

```
weaken ( ($ | @)<name> ) | ( <object>.<property> )
```

Weakens the reference to the value of the property or variable. In other words,
it decreases the object's reference count by one. This is useful in the
prevention of cyclical references lost in space. If the object is not referred
to elsewhere, it will be disposed of by garbage collection immediately following
the `weaken` statement, and the property will adopt the `undefined` value.

```
weaken $cyclical
weaken $person.parent
```

## Functions and events

### func

```
func [<name>] [ { [<statements>...] } ]
```

Declares an event. It is spelled `func` because all functions are implemented as
events.

If `name` is provided, the event will be assigned to that property of the
[scope of interest](Scopes.md#scope-of-interest) and will be available only
within that scope. Without a name, `func` acts as an inline expression
representing an anonymous event.

The curly bracket delimiters `{` and `}` may be omitted if the function has no
body. This is useful for declaring an event with no default callback.

```
func spam {
    want $start: Num = 1, $end: Num = 100
    for $i in $start..$end {
        say("$i of $end")
    }
}

spam(stop: 30)
```

```
# Anonymous event

$anon = func {
    need $x: Num, $y: Num
    return $x + $y
}

doSomethingWithAnon($anon, $other_args)
```

### on

```
on <event>[ <priority_hints>...][, :<callback_name>] { [<statements>...] }
```

Attaches an event callback function. The `event` may be a bareword, variable, or
property only. Other expressions, such as the return value of a function call,
will raise a compile-time error.

If no value at the `event` variable or property exists, `on` will create the
event. If a non-event value exists, a runtime error will be thrown. If an event
value exists, the callback will be attached to the existing event.

Callbacks are specific to the object on which they are attached. If you want a
callback to apply to any object, attach it to a class prototype object.

The use of a symbol `callback_name` is optional but strongly recommended. The
order of callback execution depends on the use of priority hints. See the below
example and [`before`](#before) and [`after`](#after) keywords for information
on `priority_hints`.

```
# assuming class Person exists and has a method haveBirthday
# which increments the person's age

$jake = Person(name: "Jake", sex: :male, age: 22)

# the below callback has a 'before' hint,
# so that *this.age will not yet be updated

on $jake.haveBirthday before :default, :sayHappy {

    # note the use of special variable *this below.
    # it refers to the object on which the callback is attached.
    # *self and instance (@) variables refer to outer
    # scope's class instance, if applicable.

    say("Happy Birthday *this.name. Say goodbye to *this.age!")
}

# example of a callback with no priority hints or callback name.
# it will be executed after :default, and *this.age will be updated.
#
# also, it is attached to the prototype,
# so it applies to all Persons, not just Jake.

on Person.proto.haveBirthday {
    say("You're *this.age")
}
```

### before

```
before :<callback_name>
```

Indicates a priority hint for an event callback function (`on` block). When
hints are supplied, the runtime will attempt to resolve them into numerical
callback priorities at a best-effort basis. Many space-searated priority hints
may be utilized for a single callback.

```
on $obj.someEvent before :lateCallback after :earlyCallback { }
```

### after

```
after :<callback_name>
```

Indicates a priority hint for an event callback function (`on` block). When
hints are supplied, the runtime will attempt to resolve them into numerical
callback priorities at a best-effort basis. Many space-searated priority hints
may be utilized for a single callback.

```
on $obj.someEvent before :lateCallback after :earlyCallback { }
```

### stop

```
stop
```

Cancels all remaining callbacks for this event call. This does not affect any
future calls, only the current one. Also note that it does not emulate a
function return; any statements below it will still execute unless it is
followed by an explicit `return` statement. `stop` cannot fail, as if there are
no pending callbacks, it has no effect and raises no error or warning.

```
# on INT, ask "are you sure?"
# then kill on the second INT

$asked = false

on Signal.INT.trap before :default {
    if !$asked {
        say("Are you sure?")
        $asked = true
        stop    # cancel further callbacks
        return  # note that stop does not affect the remainder of the callback
    }
    say("Got second INT. Terminating!")
}
```

## Classes

These keywords are to be used within classes only.

### method

```
method <name> [ { [<statements>...] } ]
```

Declares a class instance method. All methods are implemented as events. The
event will be assigned to the property `name` of the class's prototype object.

The curly bracket delimiters (`{` and `}`) may be omitted if the method has no
body. This is useful for declaring an event with no default callback.

```
class Person

method haveBirthday {
    @age++
}
```

### init

```
init { [<statements>...] }
```

Declares a class instance initializer.

```
class Person

init {
    need @fullName: Str, @age: Num, @gender: Sym
}
```

### prop

```
prop[?] <name> { [<statements>...] }
```

Declares a computed property (instance variable).

If the keyword is spelled `prop?` with a question mark
([`OP_MAYBE`](Operators.md#inline-if-operator)) suffixing it, its value will
only be computed once. After the first evaluation, the returned value will be
stored as the semi-permanent property value. This works similarly to lazy
assignment with the `?=` operator
([`OP_LASSIGN`](Operators.md#lazy-assignment-operator)).

```
class Line

prop midpoint {
    return (@pt1, @pt2).midpoint()
}
```

```
$line.midpoint  # returns a Point, created on the spot
```

## Control flow

### if

```
( if <condition> { [<statements>...] } ) | ( if <condition>: <instruction> )
```

Conditional statement. The code within the block will be executed only if
`condition` represents a true value. All values are true other than `false`,
`undefined`, and the empty return object.

If the condition is followed by a colon (`:`) rather than an opening curly
bracket (`{`), the if statement must consume only a one-line instruction. This
is similar to `if (condition) statement` without the use of curly brackets in
languages such as C.

```
# this will be executed
if 1.odd {
    doSomething()
    doSomethingElse()
}

# this will not be executed
if 1.even {
    doStuff()
    doOtherStuff()
}
```
```
# one-line example
if "hi".length == 2:
    doOneThingOnly()
```

### else

```
else { [<statements>...] }
```

Compliment to `if`. Specifies an alternate set of operations in the case of
a false condition.

```
if false {
    say("Nothing here will happen")
}

else {
    say("This will be said")
}
```

### return

```
return [<value>]
```

Terminates the current function or method, returning `value`. If the return
value is omitted or no `return` statement is ever reached, the function yields
the return object ([special variable](Variables.md#special-variables)
`*return`).

When used within an event callback, it is possible that the provided value will
not ultimately be returned by the event call. If multiple callbacks have an
explicit `return` statement, the value of the lattermost statement will be used.

```
func simple {
    return "t"
}

func complex {
    want $x: Num
    if $x {
        gotX  -> true
        value -> $x
        return
    }
    return "reached bottom"
}

simple()    # returns "t"
complex(5)  # returns (gotX: true, value: 5)
complex()   # returns "reached bottom"
```

See also the return operator [`OP_RETURN`](Operators.md#return-operator) (`->`).

### for

```
for ( <value_var> | <key_value_set> ) in <collection> { [<statements>...] }
```
```
key_value_set = '('<key_var>, <value_var>')'
```

Performs an iteration over a collection. Collection types include List, Hash,
and Set. Right of the keyword must be a lexical variable representing the
current value. If the `collection` has a key or index, you may optionally
specify two lexical variables in the form of `($key, $val)`. The variable(s) are
defined only within the body of the `for` statement.

```
$list = [ 1, 2, 3 ]
for $x in $list {
    say("Found $x")
}
```
```
$hash = [ hi: "there", how: "are you" ]
for ($firstWord, $others) in $hash {
    say("$firstWord $others")
}
```

### in

Compliment to the [`for`](#for) keyword.

### \_\_END\_\_

```
__END__
```

Terminates the document. This keyword is never required, as reaching the actual
EOF has the same effect. However, it is useful if there is data such as
documentation below the code intended to be compiled. If present, `__END__`
should always occur on a line by itself.

```
$x = 1
doStuff()

__END__

non-code down here
```

### defer

```
defer { [<statements>...] }
```

Postpones the execution of code until the current routine reaches its end.
This is useful to guarantee that something be done after a routine executes,
regardless of whether it terminated early by `return` or other means.

`defer` can only exist within functions, methods, and callbacks.
If multiple instances of `defer` occur in a routine, they are executed in the
order that the keyword was reached, with normal control flow in consideration.

```
func ok {
    defer: say("goodbye")
    say("hello")
}

ok()    # says "hello" then "goodbye"
```

## Type interfaces

### type

```
type <name> { [(<conditions>|<transforms>|<expresions>)...] }
```

Defines a type interface for dynamic type checking. This is especially useful
for functions or methods utilizing [`want`](#want) or [`need`](#need).

Types are generally declared at document or class level, but they are valid
within almost any scope.

In order for an object to conform to a type, it must meet **all** of the
provided conditions. A few keywords can be used in a type declaration:

* [`isa`](#isa) - specifies another type to which the object must conform.
* [`satisfies`](#satisfies) - specifies a condition which the object must
  meet.
* [`can`](#can) - specifies a method which the object must implement.
* [`transform`](#transform) - specifies an object transformation.

Conditions are checked in the order that they are specified. Transforms are also
executed in the provided order. See the documentation for each of the above
keywords for additional information on their usage.

A `type` construct can also contain standalone expressions. They must occur
below any possible conditions or transforms. If expression(s) are provided, an
object will conform to the type only if it is equal
(according to the `==` [`OP_EQUAL`](Operators.md#equality-operator) operator)
to at least **one** of them. Although this feature is most
often used with [symbols](Variables.md#symbols), any expressions are valid.

Anywhere within the `type` construct, the test object is the object of
interest for [property variables](Variables.md#property-variables). Therefore,
the test object's properties can be easily accessed using the `.property`
syntax.

Behind the scenes, `type` creates a function which tests an object's
conformance. If an object matches, `TypeName($obj)` will output that object
or another object returned by a [`transform`](#transform). If it fails,
`undefined` is returned.

The finished type function will be available only within the
[scope of interest](Scopes.md#scope-of-interest).

Below is an example with only expressions provided. For examples with various
conditions or transforms, see the respective keywords.

```
type Gender {
    :male
    :female
}

func announce {
    need $name: Str, $gender: Gender
    $what = Str($gender).trimPrefix(":")
    say("$name is $what")
}

announce("Robert", :male)
announce("Kris", :female)
announce("Kylie", :female)
announce("Caitlyn", :other) # ignored
```

### isa

Used within a [`type`](#type) construct to specify another type to which the
test object must conform.

```
type EvenNumber {
    isa Num
    satisfies .even
}
```

Note that the type in the example exists in the standard library as
`Number::Even`.


### satisfies

Used within a [`type`](#type) construct to specify a condition which must be
true.

If the provided expression does not evaluate to boolean true, the test object
will not conform to the type.

```
type NonEmptyString {
    isa String
    satisfies .length != 0
}
```

Note that the type in the example exists in the standard library as
`String::NonEmpty`.

### can

```
can .<methodName>"("<arguments>...")"
```

Used within a [`type`](#type) construct to specify a method requirement.

If the test object lacks a responder for the provided method, with any possibly
provided arguments, the object will not conform to the type.

### transform

```
transform (<function>|<expression>)
```

Used within a [`type`](#type) construct to perform a transformation on a test
object.

If the provided value is a function or event, it will be called, and the return
value will overwrite the current test object. Otherwise, the provided value
itself will overwrite the object.

If the provided value or returned value is undefined, the test object will not
conform to the type. Otherwise, it will conform, and the test will yield
whatever object was returned by the transformation.

```
type UCString {
    isa String
    transform .uppercase
}

func sayUC {
    need $str: UCString
    say($str)
}

sayUC("Hello World!")   # HELLO WORLD!
```

Note that the type in the example exists in the standard library as
`String::UC`.

## Miscellaneous

### alias

```
alias (<type_name>|<func_name>) = (<other_type_name>|<other_func_name>)
```

Declares that a function, method, or type is an alias for another.

For functions, this is similar to `func <func_name> { <other_func_name>() }`,
without considering arguments. For types, this is functionally equivalent to
`type <type_name> { isa <other_type_name> }`.

The finished type or function will be available only within the
[scope of interest](Scopes.md#scope-of-interest).

```
alias println = say
alias Str = String
```

### inside

```
inside <object> { [<statements>...] }
```

Temporarily sets a focal object for a shorthand syntax using
[property variables](Variables.md#property-variables). Rather than writing
`$obj.x`, simply `.x` works within the block. This is useful when accessing or
altering several properties at once.

```
$x = 5

inside $person {
    .age  = $x * 4 + 6
    .name = "Pam"
    say("Hello " + .firstName)
}

inspect($person) # (age: 26, name: "Pam")
```
