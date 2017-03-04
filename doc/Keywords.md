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
context object, which is essentially a namespace. The name declared with the
`package` keyword is absolute (root level), not relative to the current package.
Anywhere that a package has not been declared, `package main` is inferred.

```
package Hello 1.0
```

Packages may be organized into different namespaces using the namespace operator
(`::`). Packages inherit from the namespaces above them. For example, package
`Math::Trig` inherits from the `Math` package.

```
package A::B    # A::B inherits all of A's symbols
```

Once declared, the package extends until whichever of these comes first:
* a corresponding [`end`](#end) keyword, which sets the package back to `main`
* another `package` declaration
* the end of the file

See [Contexts](Scopes.md#context) for general information on namespaces.

### class

```
class <name> [<version>]
```

Declares a class. Many class declarations can exist within a single document.
Terminated with the [`end`](#end) keyword or another `class` declaration.

```
class Person 1.0
```

See [Classes](Classes.md) for general information on classes.

### end

```
end
```

Terminates a [`class`](#class) or [`package`](#class).

### load

```
load <package_name>
```

Explicitly indicates that a package should be loaded. Packages are loaded
automatically simply by referencing their names, so `load` is **almost never
required**. Its occasional use case is when a package should be loaded but is
not actually referenced within the current file.

With normal autoloading, all requirements referenced anywhere with in the file
are loaded before beginning the execution of the code within the file. When
using `load`, this is not the case; instead, the requirement is loaded when the
execution within the file reaches the `load` statement.

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
to share a variable from a package or class.

Sharing a variable inside a class makes it a public property of the class
itself. Sharing a variable at file scope makes it a public variable of the
current package. The keyword is also used to access public package variables
in files other than where they are declared.

`share` is valid only at file and class scopes.

```
package Hello
share $x        # perhaps $x already exists in another
                # file with the same package name
$x              # no reference error since shared
```

### var

```
var $<name> [= <value>]
```

Local variable declaration. When a variable is declared with this keyword, the
operations involving the variable will not affect a variable of the same name in
any outer scope. Because a simple assignment to a nonexistent variable has the
same effect, `var` is typically used as a convenient way to declare a variable
with an initial undefined value. However, it is also useful when creating a new
variable distinct from another of the same name in an external scope.

```
$x = 1

func wontChangeX {
    var $x = 2
    return $x
}

wontChangeX()   # returns 2

# out here, $x is still 1
```

### want

```
want ($ | @)<argument_name>[: <type>] [= <fallback_value>]
```

Function optional argument declaration.

Typically used at the start of a function body to indicate the name and type of
an optional argument. Multiple comma-separated declarations can exist with a
single `want` statement.

If the bareword `type` is provided, the value of the variable will be undefined
if the passed argument is not of that type.

If `fallback_value` is provided, the variable will be set to that value when the
argument is not provided or is of an incorrect type.

Within a class method, `want` may contain instance variables. This is especially
useful for providing initial property values within `init {}`.

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
need ($ | @)<argument_name>[: <type>] [= <required_value>]
```

Function required argument declaration.

Typically used at the start of a function body to indicate the name and type of
a required argument. Multiple comma-separated declarations can exist with a
single `need` keyword.

If the bareword `type` is provided, the function will not be executed if the
passed argument is not of that type.

If `required_value` is provided, the function will only be executed when the
passed argument is equal to that value (according to the
[`==`](Operators.md#equality-operator) operator). This is useful for events
where certain callbacks are only applicable to specific argument values.

Within a class method, `need` may contain instance variables. This is especially
useful for providing initial property values within `init {}`.

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

These modifiers can be used on mutable variables, properties, and indices.

### delete

```
delete <variable_name>
```
```
delete <object>.<property_name>
```
```
delete <object>[<index>]
```

Deletes the association between the given variable, property, or index and its
value.

This does NOT necessarily destroy an object; it only destroys the reference to
it. Garbage collection will only destroy the object if no other references
exist.

```
delete $noLongerNeeded
delete $message.temporaryValue
delete $myList[7]
```

### weaken

```
weaken <variable_name>
```
```
weaken <object>.<property_name>
```
```
weaken <object>[<index>]
```

Weakens the association between the given variable, property, or index and its
value. In other words, it decreases the value's reference count by one. This is
useful in the case of cyclical references.

If the object is not referred to elsewhere, it will be immediately consumed by
the garbage collector upon the `weaken` statement.

```
weaken $cyclical
weaken $person.parent
weaken $myHash["somewhere"]
```

## Functions and events

### func

```
func [<name>] { <statements> }
```

Declares an event or anonymous function. It is spelled `func` because all
named functions are implemented as events.

If `name` is provided, the event will be assigned to a property of the
[scope of interest](Scopes.md#scope-of-interest). Named functions can be nested
within one another.

Without a name, `func` becomes an expression representing an anonymous function.
Anonymous functions are permitted everywhere that expressions are accepted.

```
func spam {
    want $start: Num = 1, $end: Num = 100
    func nested {
        need $which
        say("$which of $end")
    }
    for $i in $start..$end
        nested($i)
}

spam(end: 30)
```

```
# Anonymous function
$anon = func {
    need $x: Num, $y: Num
    return $x + $y
}

doSomethingWithAnon($anon, $other_args)
```

See also the function argument declarations [`want`](#want) and [`need`](#need).

### on

```
on <event>[ <priority_hints>][, :<callback_name>] { <statements> }
```

Attaches an event callback.

The `event` may be a bareword, variable, or property only. Other expressions,
such as the return value of a function call, will raise a compile-time error.

The `event` must evaluate at runtime to either an existing Event or `undefined`.
In the case of `undefined`, a new event is created. Other values will throw a
runtime error.

Callbacks are specific to the object on which they are attached. An exception to
this is when you attach a callback directly to a class prototype object, in
which case all instances of the class will respect the callback.

The order of callback execution for a given event depends on `priority_hints`
associated with each of its callbacks. See the below example and the
[`before`](#before) and [`after`](#after) keywords for info about priorities.

The use of a [symbol](Variables.md#symbols) `callback_name` is optional but
strongly recommended. This allows the callback to be referred to in priority
hints among other purposes.

Within the callback body, [this variables](Variables.md#this-variables) refer to
the object on which the event was called.

```
# suppose class Person exists and has a method haveBirthday
# which increments the person's age

$jake = Person(name: "Jake", sex: :male, age: 22)

# the below callback has a 'before' hint,
# so that %age will not yet be updated

on $jake.haveBirthday before :default, :sayHappy {
    say("Happy Birthday %name. Say goodbye to %age!")
}

# example of a callback with no priority hints or callback name.
# it will be executed after :default, and %age will be updated.
#
# also, it is attached to the prototype,
# so it applies to all Persons, not just Jake.

on Person.proto.haveBirthday {
    say("%name is now %age!")
}
```

### before

```
before :<callback_name>
```

Indicates a "call before" priority hint for an event callback.

When hints are supplied, the runtime will do its best to resolve priorities
if at all possible. Many space-searated priority hints may be utilized for a
single callback.

```
on $obj.someEvent before :lateCallback after :earlyCallback { ... }
```

### after

```
after :<callback_name>
```

Indicates a "call after" priority" hint for an event callback.

When hints are supplied, the runtime will do its best to resolve priorities
if at all possible. Many space-searated priority hints may be utilized for a
single callback.

```
on $obj.someEvent before :lateCallback after :earlyCallback { ... }
```

### stop

```
stop
```

Stops the propagation of the event and cancels all remaining callbacks for this
particular call.

This does not affect any future calls, only the current one. Also note that it
does not emulate a function return; any statements below it will still execute
unless it is followed by an explicit `return` statement.

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

### detail

```
$ret = detail someFunction()
```

Requests "more detail" in the return value of a function call.

This means that, regardless of any explicit `return` statements that may exist,
the call will always return the [return object](Variables.md#special-variables).

If at least one explicit `return` did exist, the most recent one determines the
value of the `result` property of the return object.

Consider this example:
```
func A {
    x -> "a return value"
    y -> "another value"
    return "the ultimate value"
}
A()
```

`A()` will always be `"the ultimate value"`, and the others are inaccessible.
Detail fixes this with:

```
$ret = detail A()
$ret.x          # "a return value"
$ret.y          # "another value"
$ret.result     # "the ultimate value"
```

## Classes

These keywords are to be used within classes only.

### method

```
method <name> { <statements> }
```

Declares a class instance method.

All methods are implemented as events. The event will be assigned to the
property `name` of the class's prototype object.

```
class Person

method haveBirthday {
    @age++
}
```

### hook

```
hook <name> [{ <statements> }]
```

Exactly the same as the [`method`](#method) keyword, except that it is used by
convention for event hooks.

Usually the body is omitted, but you can still provide one if your class needs
a default responder for its own hook.

```
class MySocket 1.0

hook connected
hook disconnected
```

### init

```
init { <statements> }
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
prop[?] <name> { <statements> }
```

Declares a computed property (instance variable).

If the keyword is spelled `prop?` with a question mark, its value will
only be computed once. After the first evaluation, the returned value will be
stored as the semi-permanent property value. This works similarly to lazy
assignment with the [`?=`](Operators.md#lazy-assignment-operator).

```
class Line

prop midpoint {
    return @pt1.midpoint(@pt2)
}
```

```
$line.midpoint  # returns a Point, created on the spot
```

### operator

```
operator <op> { <statements> }
```

Defines an operator overload method for the operator `op`. This allows you to
add custom operator implementations involving the instances of the class.

The implementation should [`need`](#need) one of `$rhs`, `$lhs`, or `$ehs`:
* `$rhs` - Right operand.
* `$lhs` - Left operand. This will only be used if an implementation from the
  left operand could not be resolved.
* `$ehs` - Either operand. This is useful for commutative operations where the
  side of the operand does not matter (e.g. scalar addition and multiplication).

For all operations, the Ferret runtime first attempts to resolve it
left-to-right. If the left operand offers an implementation observing `$rhs` or
`$ehs` with the given types, that is what determines the result of the
operation.

If the left operand does not offer a suitable implementation, the runtime will
look to the right operand for an implementation observing `$lhs` or `$ehs` for
the given types.

If no implementation exists for a given operation, a runtime error is thrown.

```
package Time
class Duration

operator + {
    need $ehs: Duration # the side does not matter for addition
    return @addDuration($rhs)
}

operator - {
    need $rhs: Duration # the side matters for subtraction
    return @subtractDuration($rhs)
}
```

## Control flow

### if

```
if <condition> { <statements> }
```

Conditional statement.

The code within the block will be executed only if `condition` represents a true
value. In Ferret, all values are true other than `false`,
`undefined`, and empty [return objects](Variables.md#special-variables).

If the body of the conditional is a single statement, the curly brackets `{` and
`}` may be omitted, provided that the statement occurs on a separate line from
the condition.

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

# one-statement conditional
if "hi".length == 2
    doOneThingOnly()
```

### else

```
else { <statements> }
```

Compliment to [`if`](#if). Specifies an alternate set of operations in the case
of a false condition.

If the body of the else is a single statement, the curly brackets `{` and
`}` may be omitted, provided that the statement occurs on a separate line from
the `else` keyword.

```
if false {
    say("Nothing here will happen")
}

else {
    say("This will be said")
}

# one-statement conditional
if false
    say("Nothing here will happen")
else
    say("This will be said")
```

### else if

`else if` (always spelled as two separate words) is a combination keyword
tokenized as `KEYWORD_ELSIF`.

It allows you to chain [`if`](#if) conditional statements. The chain will
continue until one of the conditions has a boolean true value. In that case,
none of the remaining `else if` or `else` statements will be executed.

If the body of the `else if` is a single statement, the curly brackets `{` and
`}` may be omitted, provided that the statement occurs on a separate line from
the `else if` keyword.

```
if false {
    say("Nothing here will happen")
}

else if true {
    say("This will be said")
}

else {
    say("This will not be reached")
}

# one-statement conditional
if false
    say("Nothing here will happen")
else if true
    say("This will be said")
else
    say("This will not be reached")
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
explicit `return` statement, the value of the lattermost statement is used.

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

See also the return operator [`->`](Operators.md#return-operator).

### for

`for` is a diverse keyword whose behavior depends on its arguments. The single
keyword is used for all forms of loops. See the proper section.

* [__Iterations__](#for-iteration): `for..in {}`; like `foreach`.
* [__Conditional loops__](#for-conditional): `for condition {}`; like `while`.
* [__Infinite loops__](#for-infinite): `for {}`; like `while (true)`.

### for (iteration)

```
for $<value_var> in <collection> { <statements> }
```
```
for ($<key_var>, $<value_var>) in <collection> { <statements> }
```

Performs an iteration over a collection.

Collection types include `List`, `Hash`, and `Set`. Right of the keyword must be
a lexical variable representing the current value. If the `collection` has a key
or index, you may optionally specify two lexical variables in the form of
`($key, $val)`.

The parentheses are required when using two variables and forbidden when using
one. The variable(s) are defined only within the body of the `for` statement.

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

### for (conditional)

```
for <condition> { <statements> }
```

Loops while the provided `condition` is true.

The statements in the block will be executed repeatedly until the first time the
condition evaluates to boolean false or an exit of the loop via [`last`](#last)
or some other form of goto statement.

If the `condition` is not true at the time when the `for` is reached, the block
will never be executed.

This is functionally equivalent to `while (condition)` in C and others alike.

```
$fiveEs = ""

for $fiveEs.length < 5 {
    $fiveEs += "e"
}

say($fiveEs)    # eeeee
```

### for (infinite)

```
for { <statements> }
```

Loops indefinitely.

The statements in the block will be executed repeatedly until a possible exit of
the loop via [`last`](#last) or some other form of goto statement.

Only use `for {}` when you have intentions of eventually exiting the loop.
It is not advisable to base a program around a master loop. The runtime itself
is a master loop which manages asynchronous I/O among other things, so truly
infinite loops will block it. Instead utilize runtime notifiers.

This is functionally equivalent to `while (true)` or `while (1)` in many
languages.

```
$dontSayIt = true

for {
    if $dontSayIt
        last
    say("Hey!")
    last
}
```

### in

Compliment to [`for`](#for-iteration) while iterating over a collection.
Expects an expression over which to iterate.

## next

```
next
```

Jumps to the next iteration of the current [`for`](#for) loop. This is like
`continue` in C.

## last

```
last
```

Immediately exits the current [`for`](#for) loop. This is like `break` in C.

## redo

```
redo
```

Restarts the current [`for`](#for) loop iteration without reevaluating the
conditional.

### \_\_END\_\_

```
__END__
```

Terminates the document before the EOF.

```
$x = 1
doStuff()

__END__

non-code down here
```

### defer

```
defer { <statements> }
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
type[?] <name> { <conditions/transforms/expressions> }
```

Defines a type interface for dynamic type checking. This is especially useful
for functions or methods utilizing [`want`](#want) or [`need`](#need).

Interfaces are generally declared at document or class level, but they are valid
within almost any scope.

In order for an object to conform to an interface, it must meet **all** of the
provided conditions. These keywords can be used in a type declaration:

* [`isa`](#isa) - specifies another type to which the object must conform.
* [`satisfies`](#satisfies) - specifies a condition which the object must meet.
* [`can`](#can) - specifies a method or computed property which the object must
  implement.
* [`transform`](#transform) - specifies an object transformation.

Conditions are checked in the order that they are specified. Transforms are also
executed in the provided order. See the documentation for each of the above
keywords for additional information on their usage.

A `type` construct can also contain standalone expressions. They must occur
below any possible conditions or transforms. If expression(s) are provided, an
object will conform to the type only if it is equal
(according to the [`==`](Operators.md#equality-operator) operator)
to at least **one** of them. Although this feature is most
often used with [symbols](Variables.md#symbols), any expressions are valid.

```
type Gender {
    :male
    :female
}
```

Anywhere within the `type` construct, the test object is the object of
interest for [property variables](Variables.md#property-variables). Therefore,
the test object's properties can be easily accessed using the `.property`
syntax. If you need to access the object itself, use the topic variable `$_`.

```
type Even {
    isa Num
    satisfies .even
}
```

Behind the scenes, `type` creates a function which tests an object's
conformance. If an object matches, `TypeName($obj)` will output that object
or another object returned by a [`transform`](#transform). If it fails,
`undefined` is returned.

The finished type function will be available only within the
[scope of interest](Scopes.md#scope-of-interest).

If the keyword is spelled `type?` with a question mark, the interface
is marked as lazy. Lazy interfaces are evaluated only once per object. If an
object conforms to the interface once, it will be assumed to conform
permanently, and all further checks will be skipped.

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
can .<methodName>(<arguments>)
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

## Error handling

### throw

```
throw <error_expression>
```

Throws a fatal exception. `throw` requires one argument: an error object.

When `throw` is reached, the default behavior is to print the human-readable
version of the error and terminate the process with a nonzero status. This is
similar to Perl's [`die`](http://perldoc.perl.org/functions/die.html) function.

However, these "fatal" errors can be handled with a [`catch`](#catch) statement.
If a fatal error occurs in an instruction with a `catch` clause, that clause
will be executed, and the process will continue from the next statement,
respecting standard control flow.

```
func somethingFatal {
    throw Error(:Unimplemented, "This function is not yet implemented")
}

somethingFatal() catch $e {
    say("Caught an error! $e")
}
```

### fail

```
fail <error_expression>
```

Throws a nonfatal exception. `fail` is valid only within functions, methods, and
callbacks. It requires one argument: an error object.

When `fail` is reached, the `error` return pair is set to the provided error
object. The current function yields the
[return object](Variables.md#special-variables) `*return` with this error
property set. If used within an event, it will stop the propagation, cancelling
any remaining callbacks.

This is useful because the [`catch`](#catch) keyword relies on the `error`
property for nonfatal error handling.

Based on its behavior, `fail $x` is functionally equivalent to the following:
`error -> $x; stop; return`.

```
func alwaysFails {
    fail Error(:Unimplemented, "This function is not yet implemented")

    # this will never be reached because fail returns
    say("goodbye")

}

alwaysFails() catch $e {

    # this will be reached
    say("Found an error! $e")

}
```

### catch

```
catch [$<err_var>] { <statements> }
```

Allows handling of both fatal and nonfatal exceptions. Unlike in many
programming languages, `catch` does not have a compliment keyword `try`.
Instead, `catch` must occur at the end of a potentially failable instruction.

If a fatal exception occurs in the execution of the instruction, the `catch`
block will be immediately executed, optionally with the error object as its
sole argument.

If no fatal exception occurs, and the instruction was a function or method call,
`catch` will look for a nonfatal exception within the call's return object. This
`error` property is generally set automatically by a [`fail`](#fail) statement.

Example involving a fatal exception

```
undefined() catch $e {
    # this will be executed because cannot call undefined.
    say("Found a fatal $e.type!")      # "Found a fatal :CallOnNonFunction!"
}
```

Example involving a nonfatal exception

```
func alwaysFails {
    fail Error(:Unimplemented, "This function is not yet implemented")
}

alwaysFails() catch $e {
    # this will be reached

    # "Found a nonfatal error! This function..."
    say("Found a nonfatal error! $e")
}
```

## Miscellaneous

### alias

```
alias[?] (<type_name>|<func_name>) = (<other_type_name>|<other_func_name>)
```

Declares that a function, method, or type is an alias for another.

For functions, this is similar to `func <func_name> { <other_func_name>() }`,
without considering arguments. For types, this is functionally equivalent to
`type <type_name> { isa <other_type_name> }`.

If the keyword is spelled `alias?` with a question mark, the alias
will not be created until the first time it is referenced. This is only useful
when the target itself is lazy-evaluated, such as a `type?` or `prop?`.
This works similarly to lazy assignment with the
[`?=`](Operators.md#lazy-assignment-operator)) operator.

The finished type or function will be available only within the
[scope of interest](Scopes.md#scope-of-interest).

```
alias println = say
alias Str = String
```

### inside

```
inside <object> { <statements> }
```

Temporarily sets a focal object for a shorthand syntax using
[property variables](Variables.md#property-variables). Rather than writing
`$obj.x`, simply `.x` works within the block. This is useful when accessing or
altering several properties at once.

This is similar to JavaScript's
[`with`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/with),
but it is safer and lacks the ambiguity because the sigil `.` distinguishes
properties from lexical variables with `$`.

```
$x = 5

inside $person {
    .age  = $x * 4 + 6
    .name = "Pam"
    say("Hello " + .firstName)
}

inspect($person) # (age: 26, name: "Pam")
```

### if inside

`if inside` (always spelled as two separate words) is a combination keyword,
tokenized as `KEYWORD_IFINS`. It provides a convenient way to write the common
scenario of [`if`](#if) and [`inside`](#for) together:
`if $x { inside $x { ... } }` can be written simply as `if inside $x { ... }`.

```
func getNames {
    need $first: Str, $last: Str
    firstName -> $first
    lastName -> $last
}

# this will work. it will say "Hello, Sam Smith!"
if inside getNames("Sam", "Smith") {
    $name = .firstName + " " + .lastName
    say("Hello, $name!")
}

# this will do nothing because the second argument is unsatisfied,
# and therefore, the function returns false.
if inside getNames("Sam", 0) {
    $name = .firstName + " " + .lastName
    say("Hello, $name!")
}
else {
    say("This will be reached")
}
```

### gather

```
gather { <statements> }
```

Constructs a list by consolidating the provided expression values of each
[`take`](#take) statement within its body.

`gather` constructs are standard expressions and can therefore be used in
assignments, function calls, and almost anywhere else.

```
$evenSingleDigits = gather {
    for $n in 0..9 {
        if $n.even
            take $n
    }
}

inspect($evenSingleDigits)  # [ 0, 2, 4, 6, 8 ]
```

See [`gather for`](#gather-for) for an even better version of the above example.

### take

```
take <expression>
```

Compliment to [`gather`](#gather). Adds a value to a consolidated list.

### gather for

`gather for` (always spelled as two separate words) is a combination keyword,
tokenized as `KEYWORD_GATHFOR`. It provides a convenient way to write the common
scenario of [`gather`](#gather) and [`for`](#for) together:
`gather { for { ... } }` can be written simply as `gather for { ... }`.

```
$evenSingleDigits = gather for $n in 0..9 {
    if $n.even
        take $n
}

inspect($evenSingleDigits)  # [ 0, 2, 4, 6, 8 ]
```
