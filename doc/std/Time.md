# Time

This is the Time class version 1.0.




## Initializer

```
$time = Time()
```

Creates a new time given date components.


### Arguments

* *optional* __year__: Year - Year `>= 1`.

* *optional* __month__: Month - Month symbol (e.g. `:January`) or 1-12.

* *optional* __day__: Day - Day of the month, 1-31.

* *optional* __hour__: Hour - Hour, 0-23.

* *optional* __minute__: Minute - Minute, 0-59.

* *optional* __second__: Second - Second, 0-59.

* *optional* __nanosecond__: Nanosecond - Nanoseconds >= 0.

* *optional* __timeZone__: [Str](/doc/std/String.md) - Time zone identifier (e.g. `"America/Chicago"`) or offset
string (e.g. `"+0630"`) or `"local"` for the local timezone.
If omitted, no timezone will be associated with this timepoint.

## Methods

### year

```
$time.year
```

Computed property. Year.



### month

```
$time.month
```

Computed property. Month.



### monthName

```
$time.monthName
```

Computed property. Name of the month.



### day

```
$time.day
```

Computed property. Day of the month, 1-31.



### weekday

```
$time.weekday
```

Computed property. Day of the week.



### weekdayName

```
$time.weekdayName
```

Computed property. Name of the day of the week.



### Addition operator (+)

```
$time + $ehs: Duration
```

Add a duration to a timepoint.


#### Arguments

* __ehs__: Duration  



### Subtraction operator (-)

```
$time - $rhs: Duration
```

Subtract a duration from a timepoint.


#### Arguments

* __rhs__: Duration  



### copy

```
$time.copy()
```

Make a copy of this timepoint.





### description

```
$time.description()
```

## Class functions

### now

```
Time.now()
```

Returns the current time.





### today

```
Time.today()
```

Returns a time at the moment the current day started.





### tomorrow

```
Time.tomorrow()
```

Returns a time at the start of tomorrow.


## Type interfaces

### Month

Month type accepting a month symbol or integer 1-12.
Yields a MonthSym.


#### Restraints and transforms

In order to comply, the object must satisfy the following condition.

1. __transform__: Determined at runtime; see code.


### MonthSym

Symbol month names, accepted for the month time component.


#### Restraints and transforms

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Sym](/doc/std/Symbol.md).
2. __satisfies__: Determined at runtime; see code.


### Weekday

Weekday type accepting a weekday symbol or integer 1-7, starting with Monday.
Yields a WeekdaySym.


#### Restraints and transforms

In order to comply, the object must satisfy the following condition.

1. __transform__: Determined at runtime; see code.


### WeekdaySym

Symbol weekday names.


#### Restraints and transforms

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Sym](/doc/std/Symbol.md).
2. __satisfies__: Determined at runtime; see code.


### Hour

Hour 0-23.


#### Restraints and transforms

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Num](/doc/std/Number.md).
2. __satisfies__: Determined at runtime; see code.


### Nanosecond

Nanosecond >= 0.


#### Restraints and transforms

In order to comply, the object must satisfy each of the following conditions.

1. __isa__: Must be an instance of [Int](/doc/std/Number.md).
2. __satisfies__: Determined at runtime; see code.


End of the Time class.

This file was generated automatically by the Ferret compiler from
Time.frt.