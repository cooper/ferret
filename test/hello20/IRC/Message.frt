package IRC
class Message

init {
    need @line: Str;
    $lineSplit = @line.split(separator: " ", limit: 4);
    @channel = $lineSplit[2];

    # find nickname
    @nickname = $lineSplit[0].split(separator: "!", limit: 2)[0];
    @nickname.trimPrefix(":");

    # find message
    @message = $lineSplit[3];
    @message.trimPrefix(":");

    # split into parts
    @parts = @message.split(" ");

}

# find the command
method command {

    # already found it
    if @_foundCommand:
        return @_foundCommand;

    # find it
    if @parts[0].hasPrefix(".") {
        @_foundCommand = @parts[0].copy().trimPrefix(".");
        return @_foundCommand;
    }

    @_foundCommand = false;
    return @_foundCommand;
}

# get a phrase starting with word N.
method fromWord {
    need $wordN: Num;
    return @message.split(separator: " ", limit: $wordN + 1)[$wordN];
}
