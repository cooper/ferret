# Else, else if

`else if` is spelled as two words in Ferret.

    if false {
        say("Nothing here will happen")
    }

    else if true {
        say("This will be said")
    }

    else {
        say("This will not be reached")
    }

And an example without braces.

    if false
        say("Nothing here will happen")
    else if true
        say("This will be said")
    else
        say("This will not be reached")

[Next: Inside](18-inside.md)