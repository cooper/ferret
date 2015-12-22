package IRC
class Message

init {
    need @line: Str;
    $lineSplit = @line.split(separator: " ", limit: 4);
    @channel = $lineSplit[2];

    # find nickname
    @nickname = $lineSplit[0].split(separator: "!", limit: 2)[0];
    @nickname = @nickname.trimPrefix(":");

    # find message
    @message = $lineSplit[3];
    @message = @message.trimPrefix(":");

    # split into parts
    @parts = @message.split(" ");

}

# find the command
set prop command {

    # find it
    if @parts[0].hasPrefix(".") {
        $cmd = @parts[0].trimPrefix(".");
        if $cmd.length:
            return $cmd;
    }

    return false;
}

set prop commandHasParameters {
    return @parts.length != 1; # ge once implemented
}

# get a phrase starting with word N.
method fromWord {
    need $wordN: Num;
    return @message.split(separator: " ", limit: $wordN + 1)[$wordN];
}
