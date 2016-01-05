say("test")

$str = "hi"

# the below callback is specific to $str, so only the
# first call to length should produce anything here

on $str.length {
    # note that *self and @variables may not refer to the string
    # instead, *this refers to the string.
    say("found '*this' length to be *return.override")
}

$str.length()

"hello".length()

# because the below callback is on the prototype property,
# it applies to all objects on which the length event is fired

on String.proto.length {
    say("found '*this' length to be *return.override")
}

"hello".length()
