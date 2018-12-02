# for conditional

This use of `for` is functionally equivalent
to `while (condition)` in C and others alike.

```
$fiveEs = ""

for $fiveEs.length < 5 {
    $fiveEs += "e"
}

say($fiveEs)    # eeeee
```

[Next: Infinite loops](14-infinite-loops.md)