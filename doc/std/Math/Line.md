# Math::Line

This is the Math::Line class.

Represents a line.


## Initializer

```
$line = Line($m: Num, $c: Num)
```

Creates a line given slope and y-intercept.


### Arguments

* __m__: [Num](/doc/std/Number.md) - Slope.

* __c__: [Num](/doc/std/Number.md) - Y-intercept.



## Initializer

```
$line = Line($m: Num, $pt: Point)
```

Creates a line given slope and a point.


### Arguments

* __m__: [Num](/doc/std/Number.md) - Slope.

* __pt__: Point - Point on the line.

## Methods

### m

```
$line.m
```

Computed property. Slope.



### slope

```
$line.slope
```

Computed property. Slope. Same as `m`.



### formula

```
$line.formula
```

Computed property. Formula in slope-intercept notation.



### Equality operator (==)

```
$line == ($ehs: Line)
```

Equality of two lines.





End of the Math::Line class.

This file was generated automatically by the Ferret compiler from
Line.frt.