# Typed lists and hashes

For those cases where you want to ensure all values in a list
conform to a type, you can construct it like this.

    $list = List<Num>()

And use it normally...

    $list.push(1, 2, "three")

The last element there is quietly ignored since it doesn't fit the type.
And since you know the list allows only numbers, you can now safely do this.

    $list.sum   # 3

For hashes, you can specify types for both the keys and values.

    $hash = Hash<Str, Num>()
    $hash["one"] = 1
    $hash["two"] = 2
    $hash[3]     = "three"  # ignored

Of course, this works for ordered hashes too.

[Next: Classes](30-classes.md)