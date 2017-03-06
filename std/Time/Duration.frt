package Time
class Duration 1.0

alias _PO = NATIVE::PerlObject

#> creates a new duration given the time components
init {
    want $years:        Int
    want $months:       Int
    want $weeks:        Int
    want $days:         Int
    want $hours:        Int
    want $minutes:      Int
    want $seconds:      Int
    want $nanoseconds:  Int

    _PO.require("DateTime::Duration")

    # determine args to DateTime constructor
    $args = []
    $possible = [
        years:          $years,
        months:         $months,
        weeks:          $weeks,
        days:           $days,
        hours:          $hours,
        minutes:        $minutes,
        seconds:        $seconds,
        nanoseconds:    $nanoseconds
    ]
    for ($arg, $val) in $possible {
        if !$val || $val == 0
            next
        $args.push($arg, $val)
    }


    # create the underlying DateTime object
    @dtd = _PO("DateTime::Duration", args: $args) catch $e
        throw Error(:Bad, "sorry")

    # want @locale
    # want @timeZone
}

prop years          { -> @dtd.years!        : Int }
prop months         { -> @dtd.months!       : Int }
prop weeks          { -> @dtd.weeks!        : Int }
prop days           { -> @dtd.days!         : Int }
prop hours          { -> @dtd.hours!        : Int }
prop minutes        { -> @dtd.minutes!      : Int }
prop seconds        { -> @dtd.seconds!      : Int }
prop nanoseconds    { -> @dtd.nanoseconds!  : Int }

operator + {
    need $ehs: Duration
    $d = @copy!
    $d.dtd.add_duration($ehs.dtd)
    return $d
}

operator - {
    need $rhs: Duration
    $d = @copy!
    $d.dtd.subtract_duration($rhs.dtd)
    return $d
}

method copy {
    $d = Duration()
    $d.dtd = @dtd.clone!
    return $d
}

method description {
    $possible = [
        "years",          @years,
        "months",         @months,
        "weeks",          @weeks,
        "days",           @days,
        "hours",          @hours,
        "minutes",        @minutes,
        "seconds",        @seconds,
        "nanoseconds",    @nanoseconds
    ]
    $items = gather for !$possible.empty {
        $name = $possible.shift!
        $val  = $possible.shift!
        if !$val || $val == 0
            next
        take "$val $name"
    }
    if $items.empty
        return "0 seconds"
    return $items.join(", ")
}
