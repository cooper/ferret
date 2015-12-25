# on TERM, exit immediately
on Signal.TERM.catch before :default {
    say("Got TERM. Terminating!")
}

# on INT, ask "are you sure?"
# then kill on the second INT
$asked = false
on Signal.INT.catch before :default {
    if !$asked {
        say("Are you sure?")
        # stop
        return
    }
    say("Got second INT. Terminating!")
}

# run a timer indefinitely
Timer(5).start()
