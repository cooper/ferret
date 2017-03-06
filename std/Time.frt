class Time 1.0

alias _PO = NATIVE::PerlObject

type _timeUnitMeasuedFromZero {
    isa Num
    satisfies $_ >= 0
}

type _timeUnitMeasuedFromOne {
    isa Num
    satisfies $_ >= 1
}

type _timeUnit0to59 {
    isa Num
    satisfies $_ >= 0 && $_ <= 59
}

alias Year = _timeUnitMeasuedFromZero

#> month type accepting a month symbol or integer 1-12
type Month { transform numberToMonth }

$months = [
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

type MonthSym {
    isa Sym
    satisfies $months.contains($_)
}

alias Day = _timeUnitMeasuedFromOne

type Hour {
    isa Num
    satisfies $_ >= 0 && $_ <= 23
}

alias Minute = _timeUnit0to59

alias Second = _timeUnit0to59

type Nanosecond {
    isa Int
    satisfies $_ >= 0
}

init {
    want $year:         Year
    want $month:        Month
    want $day:          Day
    want $hour:         Hour
    want $minute:       Minute
    want $second:       Second
    want $nanosecond:   Nanosecond

    _PO.require("DateTime") catch $err
        fail Error(:PerlRequireError,
            "Unable to load DateTime",
            subError: $err
        )

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
        if $val == undefined
            next
        $args.push($arg, $val)
    }

    # create the underlying DateTime object
    @dt = _PO("DateTime", args: $args)

    # want @locale
    # want @timeZone
}

func numberToMonth {
    need $num: Int | MonthSym
    if $num.*instanceOf(Num)
        $num = $months[$num - 1]
    return $num : MonthSym
}
