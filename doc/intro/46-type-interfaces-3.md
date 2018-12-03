# Type interfaces continued

In order for an object to conform to a type interface, it must meet **all** of the
provided conditions. These keywords can be used in a type declaration:

* [`isa`](../Keywords.md#isa) - Specifies another type to which the object must conform. This
  might be a built-in type, class, or other type interface.
* [`satisfies`](../Keywords.md#satisfies) - Specifies a condition which the object must meet.
  It can be any expression that evaluates to a boolean.
* [`can`](../Keywords.md#can) - Specifies a method or computed property which the object must
  implement.
* [`transform`](../Keywords.md#transform) - Specifies an object transformation. The type
  interface yields the object with the transformation applied. If the transform yields
  `undefined`, the object does not comply to the interface.

Here's an example of a transform type.

    type LowercaseString {
        isa Str
        transform .lowercase
    }

    func turnLowercase {
        need $str: LowercaseString
        # by the time we reach here, it's already transformed
        -> $str
    }

    turnLowercase("MAGIC")  # magic

 That's the built-in `String::Lowercase` (or `Str::LC`), by the way.

 [Next: ]