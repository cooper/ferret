class Stack <Element>

init {
    @items = []
}

.push {
    need $item: Element
    -> @items.push($item)
}

method pop -> @items.pop()

.description -> "Stack " + @items.*description

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
