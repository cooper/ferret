class Stack <Element>

init {
    @items = []
}

method push {
    need $item: Element
    return @items.push($item)
}

method pop {
    return @items.pop()
}

method description {
    return "Stack " + @items.*description
}

end

# this should fail because the class requires a type
$stack = Stack() catch $e
    say("Error! $e")

# this should work.
$numstack = Stack<Num>()

$numstack.push(1)
$numstack.push("this should be ignored")    # strings not allowed
$numstack.push(2)

inspect($numstack)
