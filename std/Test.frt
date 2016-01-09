class Test 1.0
#< Provides a basic test suite.

init {

    #> the test name
    want @name  = "Test"

    #> If true, a failed test will throw a fatal error.
    #| This is the default behavior.
    want @fatal = true

    @tested = 0
    @passed = 0
}

#> Test succeeds if `bool($a) === true`.
method trueValue {
    need $a #< test object
    return @_test(Bool($a), "Value must be true")
}

#> Test succeeds if `$a === true`.
method veryTrue {
    need $a #< test object
    return @_test($a === true, "Value must be exactly true")
}

#> Test succeeds if `$a == $b`.
method equal {
    need $a #< test object
    need $b #< test object
    return @_test($a == $b, "Values must be equal")
}

#> Test succeeds if `$a === $b`.
method objectsEqual {
    need $a #< test object
    need $b #< test object
    return @_test($a === $b, "Objects must be exactly equal")
}

#> Test succeeds if `$a != $b`.
method notEqual {
    need $a #< test object
    need $b #< test object
    return @_test($a != $b, "Values must not be equal")
}

#> Test succeeds if `$a !== $b`.
method objectsNotEqual {
    need $a #< test object
    need $b #< test object
    return @_test($a !== $b, "Objects must not be equal")
}

#> Prints the test review.
method review {
    $failed = @tested - @passed
    say("[@name] @tested tests @passed passed $failed failed")

    tests   -> @tested
    fails   -> $failed
    passes  -> @passed
    allOK   -> @passed == @tested
}

method _test {
    need $yes, $message

    @tested = @tested + 1
    pass -> $yes

    if $yes {
        @passed = @passed + 1
        return
    }

    if @fatal:
        throw Error(:TestFailure, $message)

    message -> $message
}
