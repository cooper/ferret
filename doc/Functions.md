# Functions

In Ferret, all named functions and methods are implemented transparently as
**events**. This means that for every
function or method name, any number of responders may exist, each of which
can accept its own arguments and spit out its own return values.

The result? Ferret libraries and programs are like super dynamimcally
extensible through modules and other whatnot.

### Function vs Event

Technically, a *Function* (with a capital F) is the same as in many other
languages - a group of statements which accepts zero or more values as input
and returns zero or more values as output.

An *Event*, on the other hand, is a collection of Functions hidden behind
a single name.

However, because all named functions (`func NAME`) and methods
(`method NAME`, `op OP`, `hook NAME`, etc.) are implemented as events, the
word *function* is usually used to describe events. The only way you can
create a true Function is with an inline or anonymous function
(`func {}` without a name), and the docs will hopefully explicitly denote
such as anonymous functions.


For cases where anything callable is an acceptable value, the *Code*
type represents something callable. Events as well as anonymous
functions conform to it.

## Writing functions

Take a look at this example.

```
func checkID {
    want $name: Str = "sir"
    need $age: Num

    # not old enough
    if $age < 21 {
        underage -> true : Bool
        say("Sorry, $name. Come back later.")
        return
    }

    say("Welcome, $name.")
}

checkID("John Doe", 43)     # "Welcome, John Doe."
checkID(age: 12)            # "Sorry, sir. Come back later."
checkID("Jane Roe")         # no output (unsatisfied 'need')
```

### Arguments

The first thing you likely noticed is these weird *wants* and *needs*.

* A [`want`](Keywords.md#want) is an argument the function is hopeful for but
  does not require. When it's missing, the code still executes, and in this
  case, the variable falls back to a specified default value.
* A [`need`](Keywords.md#need) is an argument the function simply cannot
  function(!) without. When the value is omitted or does not conform to the
  specified type, the call fails with an invalid argument error.

Argument variable names are not arbitrary, nor is their order. Both are used
in determining the function's [signature](#signatures). These names can be
used when passing named arguments in any order, while the signature is used
in determining the argument order when names are omitted from a call.

The simplest form of an argument declaration is `want` or `need` followed by
a variable name. Optionally, as shown in the above example, you can specify
accepted types and fallback values.


```
need $x
```
```
need $x: Num
```
```
want $verbose: Bool = true
```

By the way, you can use the comma to split minimize this a little:
```
need $name: Str, $age: Num
```
```
want $x = 0, $y = 0
```

### Returns

Functions can return any number of values. Yeah.

That might sound confusing at first, but um, it's kind of a lie too,
because really functions just return a single normal-ish object with
normally-ish named properties.

Like arguments, returns are named in the function's
[signature](#signatures). 

Each return value is associated with a name, and these become the
properties of the [return object](#return-objects) yielded by the function.
Execution of the function continues beyond each return pair.

Here's what a return pair statement looks like.
```
name -> $value
```

For simple functions, one value may be returned in the usual way. This, of
course, stops the execution of the function at that point. The function then
yields the returned value instead of the [return object](#return-objects).

```
return $value
```

A return with no value stops the execution of the function, yielding the
[return object](#return-objects) as-is (NOT a void value). This is demonstrated
in the `checkID()` example.

```
return
```

Functions with no return value do not need an explicit return statement.

A return object with no values associated is false in boolean context,
which allows functions returning nothing to yield false as expected.

### Breakdown

This is a line-by-line breakdown of the same `checkID()` example from above.

```
# func checkID is actually an event!
func checkID {

    # optional argument $name
    # if not provided OR not a Str, fallback to default value "sir"
    want $name: Str = "sir"

    # required argument $age
    # if not provided OR not a Num, the function is unsatisfied
    # and will fail with an invalid argument error
    need $age: Num

    # not old enough
    if $age < 21 {

        # return pair 'underage'
        # this will be a property of the return object,
        # such as in checkID("John Doe", 43).underage
        #
        # the Bool at the end is specifying the type of the
        # return pair 'underage' and will appear in the signature
        #
        # this is optional, but when present, guarantees that if
        # the 'underage' pair is present, it will be of type Bool
        #
        underage -> true : Bool

        say("Sorry, $name. Come back later.")

        # return statement with no value means stop the
        # execution of the function here. the function
        # yields the return object (with 'underage' set),
        # NOT void!
        #
        # if there were other callbacks for this event,
        # they would continue execution--
        # return does NOT stop event propagation.
        #
        return

    }

    say("Welcome, $name.")
}

checkID("John Doe", 43)     # "Welcome, John Doe."
checkID(age: 12)            # "Sorry, sir. Come back later."
checkID("Jane Roe")         # no output (unsatisfied 'need')
```

## Function features

These features apply to Functions and Events alike.

### Signatures

A signature describes the arguments and returns of a function. When passing
unnamed arguments to a function call, the signature is used in determining which
names the ordered arguments are associated with.

This is the human-readable signature of the `checkID()` function:
```
?$name:Str $age:Num -> $underage:Bool
```

### Return objects

For each function call, a return object is created. The
[return values](#returns) of the function are assigned to properties of this
object.

Calls always yield the return object except when the return value is overridden
by an explicit return statement. In such a case, the return object can still be
accessed with [`detail`](#detail).

Remember: A return object with no values associated is false in boolean context,
which allows functions returning nothing to yield false as expected.

### Detail

If a function has an explicit return statement, its value overrides the
[return object](#return-objects). The [`detail`](Keywords.md#detail) keyword
allows you to access the return object when it would have otherwise been masked
by the override value.

The idea behind this is that, since Ferret is extensible through modules, 
dynamically added callbacks can still contribute return values to events that
would normally yield only a single value.

### Fail

[`fail`](Keywords.md#fail) is an alternative to [`throw`](Keywords.md#throw) for
indicating the failure of a function call.

```
fail Error(:Unimplemented, "This function is not yet implemented")
```

`fail` does NOT throw an exception, nor does it stop the execution of the
thread. It only stops the execution of the current function and stores the
error. You should use `fail` in place of `return` any time the function did not
achieve what it intended to or in place of `throw` when non-fatal errors occur
but execution of the thread can continue.

In events, however, `fail` serves another purpose. All callbacks dependent on
the one which failed (due to [`after`](#priority-hints) priority hints) are
canceled with failure status.

An event call only ever fails if every callback fails. The error message is set
to the first error which occurred (usually that of the default callback).

### Ellipsis arguments

Functions may accept a variable number of arguments.

```
func getSum {
    need $nums: Num...
    return $nums.sum
}

getSum(1, 2, 3, 4, 5)   # 15
```

You can also pass a list as a named argument.

```
$list = [6, 7, 8, 9]
getSum(nums: $list)
```

See the [ellipsis](Operators.md#ellipsis) for more.

## Event features

These features are available to Events only.

### Callback names

Callback names allow callbacks to be identified by each other. This is useful
for [priority hints](#priority-hints), [cancellation](#cancel), and tracebacks.

Callback names follow the [`func`](Keywords.md#func),
[`method`](Keywords.md#method), or [`on`](Keywords.md#on) declaration and are
identified by [symbols](Variables.md#symbols).

You should make a habit of specifying a callback name any time it might be
useful for other modules to tack on additional functionality.

```
on $myObj.someEvent, :doSomething {
    statements
}
```

When the callback name is omitted from a function or method declaration,
`:default` is implicit. For this reason it is not useful to specify a
callback name for every function or method declaration, only those which
are extensions of the event rather than the default responder.

### Priority hints

The priority hints [`before`](Keywords.md#before) and
[`after`](Keywords.md#after) allow you to specify that a callback should be
executed at some point relative to another callback's execution time.

```
func enterBar {
    need $name: Str
    say("Welcome $name.")
}

func enterBar before :default, :checkID {
    want $age: Int = 0
    want $name: Str = "stranger"
    if $age >= 21
        return
    stop # cancel all remaining callbacks
    fail Error(:UnderageError, "Sorry $name...")
}

enterBar("John", age: 39)       # "Welcome John."
enterBar("Chip", age: 12)       # :UnderageError "Sorry Chip..."
enterBar("Mark")                # :UnderageError "Sorry Mark..."
enterBar(age: 15)               # :UnderageError "Sorry stranger..."
```

### Stop

[`stop`](Keywords.md#stop) cancels any remaining callbacks for the particular
call but does NOT stop the execution of the current callback function.

Remember: The [`return`](Keywords.md#return) statement stops the execution
of the current callback function but does NOT stop the propagation of the event.

Use them in conjunction to achieve both.

### Cancel

The [`cancel`](Keywords.md#cancel) statement cancels the execution of a named
callback. If no such callback exists by the specified name, or if the callback
was already executed (due to a higher priority than the current one), `cancel`
quietly does nothing.

```
on say before :default, :censor {
    need $message: Str
    if $message == "shit"
        cancel :default
}
```

## Other types of functions

### Methods

Like named functions, all class instance methods are implemented as events.
All of the same rules mentioned above apply to methods. They are written
with the `method` keyword rather than `func`:

```
method orthogonalTo {
    need $ehs: Vector
    -> @dot($ehs) == 0
}
```

As long as there is at least one `want` or `need` in the method body,
you can use this shorthand syntax:
```
.orthogonalTo {
    need $ehs: Vector
    -> @dot($ehs) == 0
}
```

If there are no arguments specified, it is interpreted as a computed
property implementation.

### Hooks

Hooks are literally exactly the same as methods, but using the `hook`
keyword makes it clear what your intention is and produces different
documentation.

Usually hooks have no body since they exist only for other modules to
latch onto. But, there's nothing stopping you from using the `hook`
keyword in place of `method` an implementation with a body
just to indicate that it's a good place to hook onto.

```
hook connected
```

### Operator implementations

Operator implementations are also just methods, but they're written
with the more appropriate `op` keyword.

```
#> addition of two vectors
op + {
    need $ehs: Vector
    if $ehs.dimension != @dimension
        throw Error(:DimensionError, "Dimension mismatch $ehs.dimensionHR != @dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take *self[$i] + $ehs[$i]
    }
    -> Vector(items: $items)
}
```

### Computed properties

Computed properties are methods also, except their return values are
evaluated at the time the property is accessed.

```
prop direction {
    if @dimension != 2
        throw Error(:DimensionError, "Direction only exists in 2D")
    -> Math.atan2(@y, @x)
}
```

Method short-hand syntax is allowed for computed properties.
```
# same as
.direction {
    if @dimension != 2
        throw Error(:DimensionError, "Direction only exists in 2D")
    -> Math.atan2(@y, @x)
}
```

For once-computed properties, add a question mark:
```
.odd? -> *self % 2 != 0
```

## One-liner functions

Functions with only a single return instruction can be condensed to one
line with curly brackets omitted. It also works for methods and computed
properties.

```
func scare -> "Boo!"
```
```
method copy -> Point(@x, @y)
```
```
# these are the same
prop description -> "Point(@x, @y)"
.description -> "Point(@x, @y)"
```

Functions, methods, and properties with no body can exist as well. This
is useful for hooks with no default callback. It's also used for
documenting normal non-computed properties.

```
hook connected
```
```
# these are the same
prop m  #< the line's slope
.m      #< the line's slope
```