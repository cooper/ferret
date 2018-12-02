# For conditional

This use of `for` is functionally equivalent
to `while (condition)` in C and others alike.

```
$fiveEs = ""

for $fiveEs.length < 5 {
    $fiveEs += "e"
}

say($fiveEs)    # eeeee
```

You can break out of a conditional `for` loop early using
[`last`](../Keywords.md#last).

[Next: Infinite loops](14-infinite-loops.md)