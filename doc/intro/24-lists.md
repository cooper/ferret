# Lists

[Lists](../std/List.md) are ordered collections or arrays.

They're delimited by square brackets `[` and `]`.

The empty list looks like this.

    []

Values of mixed types can coexist within a single list.

    $list = [ 1, 2, "three" ]

Ferret manages list size and memory management automatically. You
do not have to specify a length or capacity. The list grows as
needed when you add more elements to it.

    $list.push("four", "five")

Lists can be added and subtracted from one another, so here's a
cuter way to write the same thing as above.

    $list += [ "four", "five" ]

And to undo that...

    $list -= [ "four", "five" ]     # Removes all occurrences of those

FYI, lists can span multiple lines.

    $list = [
        1,
        2,
        3           # Comma is not needed after last item.
                    # Compiler is smart enough to keep the
                    # instruction open until the list terminates.
    ]

[Next: Hashes](26-hashes.md)