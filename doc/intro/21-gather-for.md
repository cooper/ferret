# gather for

There's a shorthand syntax for the common scenario
of using `gather` and `for` together:
[`gather for`](../Keywords.md#gather-for).

The same example from the last page is better written like this.

    $evenSingleDigits = gather for $n in 0..9 {
        if $n.even
            take $n
    }

    inspect($evenSingleDigits)  # [ 0, 2, 4, 6, 8 ]

[Next: ]