class Test 1.0
#< Provides a basic test suite.

init {

    #> test name
    want @name = "Test"

    #> If true, a failed test will throw a fatal error.
    #| This is the default behavior.
    want @fatal = true

    @tested = 0
    @passed = 0
}

#> Test succeeds if `Bool($a) === true`.
.trueValue {
    need $a #< test object
    -> @_test(Bool($a), "Value must be true")
}

#> Test succeeds if `$a === true`.
.veryTrue {
    need $a #< test object
    -> @_test($a === true, "Value must be exactly true")
}

#> Test succeeds if `$a == $b`.
.equal {
    need $a #< test object 1
    need $b #< test object 2
    -> @_test($a == $b, "Values must be equal")
}

#> Test succeeds if `$a === $b`.
.objectsEqual {
    need $a #< test object 1
    need $b #< test object 2
    -> @_test($a === $b, "Objects must be exactly equal")
}

#> Test succeeds if `$a != $b`.
.notEqual {
    need $a #< test object 1
    need $b #< test object 2
    -> @_test($a != $b, "Values must not be equal")
}

#> Test succeeds if `$a !== $b`.
.objectsNotEqual {
    need $a #< test object 1
    need $b #< test object 2
    -> @_test($a !== $b, "Objects must not be equal")
}

#> Test succeeds of `$a` is an instance of class `$b`.
.instanceOfClass {
    need $a #< test object
    need $b #< test class
    -> @_test($a.*instanceOfClass($b), "Object must be an instance of the class")
}

#> Test succeeds of `$a` satisfies type `$b`.
.fitsType {
    need $a #< test object
    need $b #< test type
    -> @_test($a.*isa($b), "Object must satisfy the type")
}

#> Prints the test review.
.review {
    want $quiet: Bool
    $failed = @tested - @passed
    $allOK  = @passed == @tested

    # human-readable review
    $review = "[@name] ran @tested tests; @passed passed; $failed failed"
    if $allOK
        $review += "; all OK"
    if !$quiet
        say($review)

    string  -> $review
    tests   -> @tested      #< number of tests run
    fails   -> $failed      #< number of tests that failed
    passes  -> @passed      #< number of tests that passed
    allOK   -> $allOK       #< true if all tests passed
}

._test {
    need $yes, $message
    @tested += 1

    # it passed
    if $yes {
        @passed += 1
        pass -> true
        ->
    }

    # it failed. stop now if this should be fatal
    $e = Error(:TestFailureError, $message)
    if @fatal
        throw $e

    # otherwise just fail
    fail $e
}
