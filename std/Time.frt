class Time 1.0

alias _PO = NATIVE::PerlObject

############################
### DATE COMPONENT TYPES ###
############################

#> generic type for time components measured from zero
type _timeUnitMeasuredFromZero {
    isa Num
    satisfies $_ >= 0
}

#> generic type for time components measured from one
type _timeUnitMeasuredFromOne {
    isa Num
    satisfies $_ >= 1
}

#> generic type for minutes and seconds
type _timeUnit0to59 {
    isa Num
    satisfies $_ >= 0 && $_ <= 59
}

#> years, starting at year 0
alias Year = _timeUnitMeasuredFromZero

$months = [
    undefined,
    :January,
    :February,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November,
    :December
];

#> Month type accepting a month symbol or integer 1-12.
#| Yields a MonthSym.
type Month {
    transform func {
        need $num: Int | MonthSym
        if $num.*isa(Num)
            $num = $months[$num]
        return $num : MonthSym
    }
}

type MonthSym {
    isa Sym
    satisfies $months.contains($_)
}

#> day of the month, 1-31
alias Day = _timeUnitMeasuredFromOne

$weekdays = [
    undefined,
    :Monday,
    :Tuesday,
    :Wednesday,
    :Thursday,
    :Friday,
    :Saturday,
    :Sunday
]

#> Weekday type accepting a weekday symbol or integer 1-7, starting with Monday.
#| Yields a WeekdaySym.
type Weekday {
    transform func {
        need $num: Int | WeekdaySym
        if $num.*isa(Num)
            $num = $weekdays[$num]
        return $num : WeekdaySym
    }
}

type WeekdaySym {
    isa Sym
    satisfies $weekdays.contains($_)
}

#> hour 0-23
type Hour {
    isa Num
    satisfies $_ >= 0 && $_ <= 23
}

#> minute 0-59
alias Minute = _timeUnit0to59

#> second 0-59
alias Second = _timeUnit0to59

#> nanosecond >= 0
type Nanosecond {
    isa Int
    satisfies $_ >= 0
}



#> creates a new time given date components
init {
    want $year:         Year
    want $month:        Month
    want $day:          Day
    want $hour:         Hour
    want $minute:       Minute
    want $second:       Second
    want $nanosecond:   Nanosecond

    _PO.require("DateTime")

    # determine args to DateTime constructor
    $args = []
    $possible = [
        year:           $year,
        month:          $months.indexOf($month),
        day:            $day,
        hour:           $hour,
        minute:         $minute,
        second:         $second,
        nanosecond:     $nanosecond
    ]
    for ($arg, $val) in $possible {
        if !$val || $val == 0
            next
        $args.push($arg, $val)
    }

    # use current time if no options provided
    $init = "new"
    if $args.empty
        $init = "now"

    # create the underlying DateTime object
    @dt = _PO("DateTime", INIT: $init, args: $args) catch $e
        throw Error(:Bad, "sorry")

    # want @locale
    # want @timeZone
}

#######################
### DATE COMPONENTS ###
#######################

#> year
prop year {
    return Year(@dt.year!) : Year
}

#> month
prop month {
    return Month(@dt.month!) : MonthSym
}

prop monthName {
    return @month.name
}

#> day of the month, 1-31
prop day {
    return Day(@dt.day!) : Day
}

#> day of the week
prop weekday {
    return Weekday(@dt.day_of_week!) : WeekdaySym
}

#> string name of the day of the week
prop weekdayName {
    return @weekday.name
}

#################
### OPERATORS ###
#################

#####################
### MISCELLANEOUS ###
#####################

method description {
    return @dt.ymd("-") + " "  + @dt.hms(":")
}

#> returns the current time
func now {
    return Time()
}

#> returns a time at the moment the current day started
func today {
    $t = Time()
    $t.dt.truncate(to: "day")
    return $t
}
