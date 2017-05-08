# Math::Point

This is the Math::Point class.

Represents a 2D point.


## Initializer

```
$point = Point($x: Num, $y: Num)
```

Creates a point given x- and y- coordinates.


### Arguments

* __x__: [Num](/std/doc/Number.md) - X-coordinate.

* __y__: [Num](/std/doc/Number.md) - Y-coordinate.

## Methods

### distanceTo

```
$point.distanceTo($pt2: Point)
```

Returns the distance between this point and another.


#### Arguments

* __pt2__: Point  



### midpoint

```
$point.midpoint($pt2: Point)
```

Given another point, returns the point centered between them.


#### Arguments

* __pt2__: Point  



### distanceFromOrigin

```
$point.distanceFromOrigin
```

Computed property. Distance between this point and the origin `(0, 0)`.



### description

```
$point.description()
```

## Class properties

### origin

```
Point.origin
```

The point `(0,0)`.



End of the Math::Point class.

This file was generated automatically by the Ferret compiler from
Point.frt.