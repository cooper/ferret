class Test

init {
    want @name  = "Test"
    want @fatal = true
    @tested = 0
    @passed = 0
}

# bool($a) === true
method trueValue {
    want $a
    return @_test(Bool($a), "Value must be true")
}

# $a === true
method veryTrue {
    want $a
    return @_test($a === true, "Value must be exactly true")
}

# $a == $b
method equal {
    want $a, $b
    return @_test($a == $b, "Values must be equal")
}

# $a === $b
method objectsEqual {
    want $a, $b
    return @_test($a === $b, "Objects must be exactly equal")
}

# $a != $b
method notEqual {
    want $a, $b
    return @_test($a != $b, "Values must not be equal")
}

# $a !== $b
method objectsNotEqual {
    want $a, $b
    return @_test($a !== $b, "Objects must not be equal")
}

method review {
    $failed = @tested - @passed
    say("[@name] @tested tests; @passed passed; $failed failed")

    tests   -> @tested
    fails   -> $failed
    passes  -> @passed
    allOK   -> @passed == @tested
}

method _test {
    want $yes, $message

    @tested = @tested + 1
    pass -> $yes

    if $yes {
        @passed = @passed + 1
        return
    }

    if @fatal:
        Error($message).panic()

    message -> $message
}
