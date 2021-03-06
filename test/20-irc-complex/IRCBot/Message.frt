package IRCBot
class Message

init {
    need @line: Str
    $lineSplit = @line.split(" ", limit: 4)
    @channel = $lineSplit[2]

    # find nickname
    @nickname = $lineSplit[0].split("!", limit: 2)[0]
    @nickname = @nickname.trimPrefix(":")

    # find message
    @message = $lineSplit[3]
    @message = @message.trimPrefix(":")

    # split into parts
    @parts = @message.split(" ")

}

# find the command
.command? {

    # find it
    if @parts.length != 0 && @parts[0].hasPrefix(".") {
        $cmd = @parts[0].trimPrefix(".")
        if $cmd.length
            -> $cmd
    }

    -> false
}

.commandHasParameters? -> @parts.length > 1

# get a phrase starting with word N.
.fromWord {
    need $wordN: Num
    -> @message.split(" ", limit: $wordN + 1)[$wordN]
}
