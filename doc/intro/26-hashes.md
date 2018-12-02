# Hashes

[Hashes](../std/Hash.md) are key-value maps or dictionaries.

Like lists, they're delimited by square brackets `[` and `]`,
but they're distinguished from them by the presence of the colon `:`
key-value delimiter.

The empty hash looks like this.

    [:]

Mixed types are allowed in a single hash.

    $hash = [ key: "Value", other: 11 ]

You might be wondering why Ferret has both objects in hashes.
Well, in JavaScript, in order for frameworks to add features that
apply to objects used in the sense of hashes, they have to do weird
hacks so as to not clutter the Object prototype, since doing so would
cause the properties/methods to appear in literally every iteration
over any Object in the entire program. You also end up seeing a lot of
`.hasOwnProperty()` calls for this same reason.

Instead, I wanted to use normal property and method notation for
common hash data type features while preserving the minimalistic
empty object with zero clutter and zero properties. It's for this same
reason that Ferret does not allow direct access to the Object prototype.

    # this will ALWAYS return an empty list, since you can be assured
    # the empty object inherits no properties!

    (:).*allProperties      

[Next: Hashes continued](27-hashes-2.md)