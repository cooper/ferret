# Shorthands, next, redo, last

By the way, for all types of `for` statements, the braces may
be omitted if only one statement occurs.

```
for
    say("Infinite spam!")

say("This part is outside the for loop")
```

And as a one-liner, the colon may be used instead:
```
for $x in [1,2,3]: say($x)
```

Also, for all `for` statements, [`next`](../Keywords.md#next)
can be used to skip an iteration, [`redo`](../Keywords.md#redo) to
re-evaluate and restart an iteration, and [`last`](../Keywords.md#last)
to break out of the loop entirely.



[Next: If](16-if.md)