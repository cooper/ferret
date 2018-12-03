# Multiple return values

That cute little arrow [`->`](../Operators.md#return-operator)
does neat things when prefaced by a bareword. Ferret has named return
values just like it has named arguments.

    func performMath {
        need $x: Num, $y: Num

        sum         -> $x + $y
        quotient    -> $x * $y
    }

    performMath(1, 2)               # Returns object (sum: 3, quotient: 2)
    performMath(x: 3, y: 4).sum     # 7

Note how, unlike `->` in previous examples, these named return pair
statements do not halt execution of the function. It continues until
the end, and the function yields its
[return object](../Functions.md#return-objects).

[Next: detail](7.5-detail.md)