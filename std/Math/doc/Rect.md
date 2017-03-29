# Math::Rect

This is the Math::Rect class.

Represents a rectangle.


## Initializer

```
$rect = Rect($x: Num, $y: Num, $width: Num, $height: Num)
```

Creates a rectangle, given its origin (bottom-left vertex) and dimensions.


### Arguments

* __x__: [Num](/std/doc/Number.md) - X-coordinate of the rectangle's origin.

* __y__: [Num](/std/doc/Number.md) - Y-coordinate of the rectangle's origin.

* __width__: [Num](/std/doc/Number.md) - Width of the rectangle.

* __height__: [Num](/std/doc/Number.md) - Height of the rectangle.

## Methods

### vertices

```
$rect.vertices
```

Computed property. A list of the four vertices of the rectangle.



### bottomLeft

```
$rect.bottomLeft
```

Computed property. Bottom left vertex of the rectangle.



### bottomRight

```
$rect.bottomRight
```

Computed property. Bottom right vertex of the rectangle.



### topLeft

```
$rect.topLeft
```

Computed property. Top left vertex of the rectangle.



### topRight

```
$rect.topRight
```

Computed property. Top right vertex of the rectangle.



### bottomLine

```
$rect.bottomLine
```

Computed property. Line segment formed by the bottom vertices of the rectangle.



### topLine

```
$rect.topLine
```

Computed property. Line segment formed by the top vertices of the rectangle.



### center

```
$rect.center
```

Computed property. Center point of the rectangle.



### description

```
$rect.description()
```





End of the Math::Rect class.

This file was generated automatically by the Ferret compiler from
[Rect.frt](../Rect.frt).