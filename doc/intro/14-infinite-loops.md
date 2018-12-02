# Infinite loops

This use of `for` is functionally equivalent to `while (true)`
or `while (1)` in many other languages.

```
$dontSayIt = randTrueFalse()

for {
    if $dontSayIt
        last
    say("Hey!")
}
```

[Next: Shorthands, next, redo, last](15-next-last.md)