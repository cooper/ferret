# gather

[`gather`](../Keywords.md#gather) constructs a list by pushing the
 values of each [`take`](#take) that occurs within its body.

These blocks are expressions and can therefore be used in
assignments, function calls, and almost anywhere else that a
value is accepted.

```
$evenSingleDigits = gather {
    for $n in 0..9 {
        if $n.even
            take $n
    }
}

inspect($evenSingleDigits)  # [ 0, 2, 4, 6, 8 ]
```

[Next: gather for](21-gather-for.md)