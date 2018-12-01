# on TERM, exit immediately
on Signal.TERM.trap before :default {
    say("Got TERM. Terminating!")
}

# on INT, ask "are you sure?"
# then kill on the second INT
$asked = false
on Signal.INT.trap before :default {

    # have we asked if sure?
    if !$asked {
        say("Are you sure?")
        $asked = true
        stop    # cancel further callbacks
        ->      # note that stop does not affect the remainder of the callback
    }

    say("Got second INT. Terminating!")
}

# run a timer indefinitely
Timer(5).start()
