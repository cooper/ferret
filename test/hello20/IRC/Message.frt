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
    if @foundCommand:
        return @foundCommand;

    # find it
    if @parts[0].hasPrefix(".") {
        @foundCommand = @parts[0].copy().trimPrefix(".");
        return @foundCommand;
    }

    @foundCommand = false;
    return @foundCommand;
}

# get a phrase starting with word N.
method fromWord {
    need $wordN: Num;
    return @message.split(separator: " ", limit: $wordN + 1)[$wordN];
}
