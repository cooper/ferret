# Type generics continued

Below is the entire standard library implementation of Stacks in Ferret.
A stack is a basic collection to which you can push elements and pop
them off the end. Last in, first out.

    class Stack <T?>

    init {
        want @items: T...
    }

    .push {
        need $item: T
        @items.push($item)
    }

    method pop
        -> @items.pop()

    .description {
        $name = T.name
        -> "Stack<$name> " + @items.*description
    }

You'd create a stack like this.

    $s = Stack(1,2,3)                           # T is Any
    $s = Stack<Str>("one", "two", "three")      # T is Str

So there's an example of type generics.

[Next: Type interfaces](44-type-interfaces.md)