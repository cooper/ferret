# Functions

In Ferret, all named functions and methods are implemented transparently as
[events](https://github.com/cooper/evented-object). This means that for every
function or method name, any number of responders may exist, each of which
accepts its own arguments and spits out its own return values. The result is
that Ferret libraries and programs are extremely extensible.

### Function vs Event

Technically, a *Function* (with a capital F, as in an object of type Function)
is the same as in many other languages - a group of statements which accepts
zero or more values as input and returns zero or more values as output. An
*Event*, on the other hand, is a collection of Functions hidden behind a
single name.

However, because all named functions (`func NAME {}`) and methods
(`method NAME {}`, `hook NAME`) are implemented as events, the word *function*
is usually used to describe events. The only way you can create a true Function
is with an inline or anonymous function (`func {}` without a name).

The *Code* type represents something callable. Events as well as anonymous
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
  does not require.
* A [`need`](Keywords.md#need) is an argument the function simply cannot
  function (ha) without.

The argument variable names are not arbitrary, nor is their order. Both are used
in determining the function's [signature](#signatures).

The simplest form of an argument declaration is `want` or `need` followed by
a variable name. Optionally you can specify accepted types and a fallback value.


```
need $x
```
```
need $x: Num
```
```
want $verbose: Bool = true
```

### Returns

Functions can return any number of values. Like arguments, these values are
named in the function's [signature](#signatures).

Each return value is associated with a name. These will be properties of the
[return object](#return-objects) yielded by the function. Execution of the
function continues beyond each return pair.

```
name -> $value
```

For simple functions, one value may returned in the usual way. This, of course,
stops the execution of the function at that point. The function then yields the
returned value instead of the [return object](#return-objects).

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

### Breakdown

This is a line-by-line breakdown of the same `checkID()` example from above.

```
# func checkID is actually an event!
func checkID {

    # optional argument $name
    # if not provided OR not a Str, fallback to "sir"
    want $name: Str = "sir"

    # required argument $age
    # if not provided OR not a Num, the function is unsatisfied
    # and will not be executed
    need $age: Num

    # not old enough
    if $age < 21 {

        # return pair 'underage'
        # this will be a property of the return object,
        # such as in checkID("John Doe", 43).underage
        underage -> true : Bool

        say("Sorry, $name. Come back later.")

        # return statement with no value means stop the
        # execution of the function here. the function
        # yields the return object (with 'underage' set),
        # NOT void
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
names the arguments are associated with.

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

### Detail

If a function has an explicit return statement, its value overrides the
[return object](#return-objects). The [`detail`](Keywords.md#detail) keyword
allows you to access the return object when it would have otherwise been masked
by the override value.

### Fail

[`fail`](Keywords.md#fail) is an alternative to [`throw`](Keywords.md#throw) for
indicating the failure of a function call.

```

```

`fail` does NOT throw an exception, nor does it stop the execution of the
thread. It only stops the execution of the current function and stores the
error. You should use `fail` in place of `return` any time the function did not
achieve what it intended to.

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

See the [ellipsis](Operators.md#ellipsis).

## Event features

These features are available to Events only.

### Callback names

Callback names allow callbacks to be identified by each other. This is useful
for [priority hints](#priority-hints), [cancellation](#cancel), and tracebacks.

Callback names follow the [`func`](Keywords.md#func),
[`method`](Keywords.md#method), or [`on`](Keywords.md#on) declaration and are
identified by [symbols](Variables.md#symbols).

```
on $myObj.someEvent, :doSomething {
    statements
}
```

When the callback name is omitted, `:default` is implicit. It is not useful to
specify a callback name for every function or method, only those which are
extensions of the event rather than the default responder.

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
    fail Error(:UnderageError, "Sorry $name...")
    stop # cancel all remaining callbacks
}

enterBar("John", age: 39)       # "Welcome John."
enterBar("Chip", age: 12)       # :UnderageError "Sorry Chip..."
enterBar("Mark")                # :UnderageError "Sorry Mark..."
enterBar(age: 15)               # :UnderageError "Sorry stranger..."
```

### Stop

[`stop`](Keywords.md#stop) cancels any remaining callbacks for the particular
call but does NOT stop the execution of the current callback function.

The [`return`](Keywords.md#return) statement stops the execution of the current
callback function but does NOT stop the propagation of the event.

### Cancel

The [`cancel`](Keywords.md#cancel) statement cancels the execution of the
callback with the provided name. If no such callback exists, or if the callback
was already executed (due to a higher priority than the current one), `cancel`
does nothing.

```
on say before :default, :censor {
    need $message: Str
    if $message == "shit"
        cancel :default
}
```
