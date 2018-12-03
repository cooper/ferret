# Type generics

On the last page, our List class extension started like this.

    class List <T?>

Here, `<T?>` is a **type generic**. It means you're allowed to construct
a list that only accepts a certain type of elements. Within the
class definition, `T` refers to whichever type was specified when
the list was created.

    $l = List<Str>()    # For this list, T is Str

The optional question mark `?` indicates that you can still create a
list without specifying a type. In that case, `T` becomes `Any` which
is a type to which all objects conform.

This is not specific to lists. Any class can accept type generics.
For instance, Hash allows you to specify types for keys, values, or both.

    class Hash <K?, V?>

[Next: Type generics continued](43-type-generics-2.md)