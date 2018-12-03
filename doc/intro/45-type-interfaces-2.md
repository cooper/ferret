# Type interfaces continued

> Concern ourselves with whether it can perform the roles we need it to.

We can achieve that with [**`type` interfaces**](../Keywords.md#type).

    type EvenNumber {
        isa Num
        satisfies .even
    }

Note the permitted use of
[property variables](../Variables.md#property-variables) in type
interfaces.

Now we can use this as a type.

    func addEvenNumbers {
        need $nums: EvenNumber...
        $sum = 0
        for $x in $nums
            $sum += $x
        -> $sum
    }

    addEvenNumbers(2, 4, 6)     # 12
    addEvenNumbers(4, 5, 6)     # 10    Odd numbers ignored

p.s. `Num::Even` and `Num::Odd` are existing type interfaces.

[Next: Type interfaces continued](46-type-interfaces-3.md)