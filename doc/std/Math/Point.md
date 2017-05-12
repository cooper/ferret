# Math::Point

This is the Math::Point class.

Represents a 2D point.


## Initializer

```
$pt = Point($x: Num, $y: Num)
```

Creates a point given x- and y- coordinates.


### Arguments

* __x__: [Num](/doc/std/Number.md) - X-coordinate.

* __y__: [Num](/doc/std/Number.md) - Y-coordinate.

## Methods

### distanceTo

```
$pt.distanceTo($pt2: Point)
```

Returns the distance between this point and another.


#### Arguments

* __pt2__: Point  



### midpoint

```
$pt.midpoint($pt2: Point)
```

Given another point, returns the point centered between them.


#### Arguments

* __pt2__: Point  



### distanceFromOrigin

```
$pt.distanceFromOrigin
```

Computed property. Distance between this point and the origin `(0, 0)`.

## Class properties

### origin

```
Point.origin
```

The point `(0,0)`.



End of the Math::Point class.

This file was generated automatically by the Ferret compiler from
Point.frt.