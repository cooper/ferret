# Math::Circle

This is the Math::Circle class.

Represents a circle.


## Initializer

```
$circle = Circle($r: Num, $h: Num, $k: Num)
```

Creates a circle given radius and center coordinates.


### Arguments

* __r__: [Num](/doc/std/Number.md) - Radius.

* __h__: [Num](/doc/std/Number.md) - X-coordinate of center.

* __k__: [Num](/doc/std/Number.md) - Y-coordinate of center.



## Initializer

```
$circle = Circle($r: Num, $center: Point)
```

Creates a circle given radius and center.


### Arguments

* __r__: [Num](/doc/std/Number.md) - Radius.

* __center__: Point - Center.



## Initializer

```
$circle = Circle($area: Num)
```

Creates a circle at the origin given area.


### Arguments

* __area__: [Num](/doc/std/Number.md) - Area.

## Methods

### r

```
$circle.r
```

Computed property. Radius.



### h

```
$circle.h
```

Computed property. Center x-coordinate.



### k

```
$circle.k
```

Computed property. Center y-coordinate.



### center

```
$circle.center
```

Once-computed property. Center point.



### r2

```
$circle.r2
```

Once-computed property. Squared radius.



### area

```
$circle.area
```

Computed property. Area.



### d

```
$circle.d
```

Once-computed property. Diameter.



### c

```
$circle.c
```

Computed property. Circumference.



### formula

```
$circle.formula
```

Computed property. Formula in center-radius notation.



### diameter

```
$circle.diameter
```

Computed property. Diameter. Same as `d`.



### circumference

```
$circle.circumference
```

Computed property. Circumference. Same as `c`.



### hasPoint

```
$circle.hasPoint($pt: Point)
```

Tests whether a point is on the circle.


#### Arguments

* __pt__: Point  



### isTangent

```
$circle.isTangent($line: Line)
```

Tests whether a line is tangent to the circle.


#### Arguments

* __line__: Line  



### Equality operator (==)

```
$circle == ($ehs: Circle)
```

Equality of two circles.

## Class properties

### unit

```
Circle.unit
```



End of the Math::Circle class.

This file was generated automatically by the Ferret compiler from
Circle.frt.