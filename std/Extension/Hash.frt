class Hash <K?, V?>

.empty -> @length == 0
.iterator -> *self

method reset {
    say("RESET")
    @keysLeft = @keys.copy()
}

.more -> !@keysLeft.empty

.nextElement {
    $key = @keysLeft.pop()
    -> *self[$key]
}

.nextElements {
    $key = @keysLeft.pop()
    -> [ $key, *self[$key] ]
}