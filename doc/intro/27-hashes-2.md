# Hashes continued

Also unlike objects, hash keys do not have to be strings. Any value
which is Hashable is permitted. If an object is Hashable, it means
another distinct object representing the same value can be compared
against it in a consistent way.

    $hash["One"] = 1
    $hash[2] = "Two"
    $hash[/regex/] = "Not sure why you'd do this, but you can"

Hashes, too, can span multiple lines.

    $hash = [
        key:        "Value",
        other:      11,
        /regex/:    "That one has a weird non-string key",
        lastOne:    "no comma needed after this"
    ]

There's even such thing as an ordered hash.

    $hash = OrderedHash()
    $hash["first"]  = "this is the first item"
    $hash["second"] = "this is the second item"

    for ($k, $v) in $hash {
        say("$k = $v")
    }

    # It'll always spit them out in the order they were added

[Next: Typed lists and hashes](28-typed-lists-hashes.md)