class Stack <T?>

init {
    want @items: List = []  # TODO: List<T>
}

method push {
    need $item: T
    @items.push($item)
}

method pop {
    return @items.pop()
}

method description {
    $name = T.name
    return "Stack<$name> " + @items.*description
}
