# for iterations

Use `for..in` to iterate over a list.
```
$list = [ 1, 2, 3 ]
for $x in $list {
    say("Found $x")
}
```

For hashes, you can iterate over keys and values simultaneously.
```
$hash = [ hi: "there", how: "are you" ]
for ($key, $val) in $hash {
    say("$key = $val")
}
```

The parentheses are required when using two variables and forbidden
when there's just one. The variable(s) are defined only within the
body of the `for` closure.

[Next: for conditionals](13-for-conditional.md)