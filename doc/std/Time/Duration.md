# Time::Duration

This is the Time::Duration class version 1.0.




## Initializer

```
$duration = Duration()
```

Creates a new duration given the time components.
All components are integers.


### Arguments

* *optional* __years__: [Int](/doc/std/Number.md)  

* *optional* __months__: [Int](/doc/std/Number.md)  

* *optional* __weeks__: [Int](/doc/std/Number.md)  

* *optional* __days__: [Int](/doc/std/Number.md)  

* *optional* __hours__: [Int](/doc/std/Number.md)  

* *optional* __minutes__: [Int](/doc/std/Number.md)  

* *optional* __seconds__: [Int](/doc/std/Number.md)  

* *optional* __nanoseconds__: [Int](/doc/std/Number.md)  

## Methods

### years

```
$duration.years
```

Computed property. Years.



### months

```
$duration.months
```

Computed property. Months.



### weeks

```
$duration.weeks
```

Computed property. Weeks.



### days

```
$duration.days
```

Computed property. Days.



### hours

```
$duration.hours
```

Computed property. Hours.



### minutes

```
$duration.minutes
```

Computed property. Minutes.



### seconds

```
$duration.seconds
```

Computed property. Seconds.



### nanoseconds

```
$duration.nanoseconds
```

Computed property. Nanoseconds.



### Addition operator (+)

```
$duration + ($ehs: Duration)
```

Add two durations.





### Subtraction operator (-)

```
$duration - ($rhs: Duration)
```

Subtract a duration from this one.





### copy

```
$duration.copy()
```

Make a copy of this duration.





End of the Time::Duration class.

This file was generated automatically by the Ferret compiler from
Duration.frt.