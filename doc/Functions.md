# Functions

In Ferret, all named functions and methods are implemented transparently as
events. This means that for every function or method name, any number of
responders may exist, each of which accepts its own arguments and spits out its
own return values. The result is that Ferret libraries and programs are
extremely extensible.

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
return object yielded by the function. Execution of the function continues
beyond each return pair.

```
name -> $value
```

For simple functions, one value may returned in the usual way. This, of course,
stops the execution of the function at that point. The function then yields the
returned value instead of the return object.

```
return $value
```

A return with no value stops the execution of the function, yielding the return
object as-is (NOT a void value). This is demonstrated in the `checkID` example.

```
return
```

Functions with no return value do not need an explicit return statement.

### Signatures

A signature describes the arguments and returns of a function. When passing
unnamed arguments to a function call, the signature is used in determining which
names the arguments are associated with.

This is the human-readable signature of the `checkID` function:
```
$name:Str ?$age:Num
```

### Breakdown

This is a line-by-line breakdown of the same `checkID` example from above.

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

## Function stuff

### Return objects

### Detail

### Ellipsis arguments

## Event stuff

one return object. default function determines signature
