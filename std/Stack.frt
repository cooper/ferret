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
