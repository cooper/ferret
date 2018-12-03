# Class extensions

When you declare a [`class`](../Keywords.md#class), it creates an
object for that class only if one does not already exist.

Thus, to extend a class, you don't have to do anything special.
Just know that it already exists and that you're adding to it.

Part of the Ferret standard library is written in Ferret itself
using class extensions. Here's an excerpt of the List class.

    class List <T?>

    #> Returns the sum of all elements in the list or `0` (zero) if the list is
    #| empty. Useful for lists of numbers.
    .sum0 {
        $c = 0
        for $el in *self {
            $c += $el
        }
        -> $c
    }

    #> Returns the first element in the list.
    .firstItem -> *self[0]

    #> Returns the last element in the list.
    .lastItem -> *self[@lastIndex]

[Next: Type generics](42-type-generics.md)