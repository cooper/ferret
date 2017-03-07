package Math
class Unit

#> default initializer creates a unit given a base unit and a multipler
init {
    need @suffix:       Str     #< Human-readable suffix or abbreviation
    need @base:         Unit    #< Base unit
    need @multiplier:   Num     #< Multiplier. One of these is base * multipler

    # store the relationship in the base
    @base.relationships[ *self.*addr ] = @multiplier
}

#> creates a base unit with multiplier 1
init {
    need @suffix: Str           #< Human-readable suffix or abbreviation
    need @isBase: Bool = true   #< True if this is a base unit
    @multiplier = 1
    @relationships = [:]
}

method description {
    if @isBase
        return "Unit @suffix"
    return "Unit @suffix = " + @multiplier.*description  + " @base.suffix"
}

# useless
share $byte = Unit("byte", isBase: true)
share $kb   = Unit("KB", $byte, 1000)
share $mb   = Unit("MB", $byte, 1000000)
share $gb   = Unit("GB", $byte, 1000000000)
share $tb   = Unit("TB", $byte, 1000000000000)

# also useless
share $meter = Unit("m", isBase: true)
share $mm    = Unit("mm", $meter, 0.001)
share $cm    = Unit("cm", $meter, 0.01)
share $km    = Unit("km", $meter, 1000)
