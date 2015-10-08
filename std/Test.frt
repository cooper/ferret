class Test

init {
    want @name  = "Test";
    want @fatal = true;
    @tested = 0;
    @passed = 0;
}

# bool($a) === true
method trueValue {
    want $a;
    return @_test(Bool($a), "Value must be true");
}

# $a === true
method veryTrue {

}

# $a == $b
method equal {
    want $a, $b;
    return @_test($a == $b, "Values must be equal");
}

# $a === $b
method objectsEqual {
    want $a, $b;
    # return @_test($a === $b, Objects must be equal);
    # TODO
}

# $a != $b
method notEqual {
    want $a, $b;
    # return @_test($a != $b, Values must not be equal);
    # TODO
}

# $a !== $b
method objectsNotEqual {
    want $a, $b;
    # return @_test($a !== $b, Objects must not be equal);
    # TODO
}

method review {
    $failed = @tested - @passed;
    say("[@name] @tested tests; @passed passed; $failed failed");

    tests   -> @tested;
    fails   -> $failed;
    passes  -> @passed;
    allOK   -> @passed == @tested;
}

method _test {
    want $yes, $message;

    @tested = @tested + 1;
    pass -> $yes;

    if $yes {
        @passed = @passed + 1;
        return;
    }

    if @fatal:
        Error($message).panic();

    message -> $message;
}
