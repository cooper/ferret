# this entire call acts as an instruction no need for a semicolon.

delay(5) {
    say("been five seconds")
}

say("waiting...")

# this one does not start the instruction it is wrapped in something.
# therefore, the semicolon is required.

say(something() {
    return "any second now"
}.message)

func something {
    need $code
    message -> $code()
}
