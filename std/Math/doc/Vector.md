# Math::Vector

This is the Math::Vector class.




## Initializer

```
$vector = Vector()
```

Creates a vector with the given components.


### Arguments

* *optional* __items__: [Number](/std/doc/Number.md)...  Variable number of arguments. 

## Methods

### dimension

```
$vector.dimension
```

Computed property. Dimension of the vector.



### magnitude

```
$vector.magnitude
```

Computed property. Magnitude of the vector.



### unitVector

```
$vector.unitVector
```

Computed property. Returns the unit vector in the direction of this vector.



### Addition operator (+)

```
$vector + $ehs: Vector
```

Addition of two vectors.


#### Arguments

* __ehs__: Vector  



### Subtraction operator (-)

```
$vector - $lhs: Num
```

Allows you to take the opposite vector.


#### Arguments

* __lhs__: [Number](/std/doc/Number.md)  



### Subtraction operator (-)

```
$vector - $rhs: Vector
```

Subtraction of a vector from another.


#### Arguments

* __rhs__: Vector  



### Multiplication operator (*)

```
$vector * $ehs: Num
```

Scalar multiplication of the vector.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



### Division operator (/)

```
$vector / $rhs: Num
```

Scalar division of the vector.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### Multiplication operator (*)

```
$vector * $ehs: Vector
```

Dot product of two vectors.


#### Arguments

* __ehs__: Vector  



### Equality operator (==)

```
$vector == $ehs: Vector
```

Vector equality.


#### Arguments

* __ehs__: Vector  



### dot

```
$vector.dot($ehs: Vector)
```

Dot product of this vector and another of the same dimension.


#### Arguments

* __ehs__: Vector  



### cross

```
$vector.cross($ehs: Vector)
```

Cross product of two 3D vectors.


#### Arguments

* __ehs__: Vector  



### angleBetween

```
$vector.angleBetween($ehs: Vector)
```

Angle between this vector and another of the same dimension, measured in
radians.


#### Arguments

* __ehs__: Vector  



### orthogonalTo

```
$vector.orthogonalTo($ehs: Vector)
```

True if this vector is orthogonal to another of the same dimension.


#### Arguments

* __ehs__: Vector  



### parallelTo

```
$vector.parallelTo($ehs: Vector)
```

True if this vector is parallel to another of the same dimension.


#### Arguments

* __ehs__: Vector  



### getValue

```
$vector.getValue($index: Num)
```

Fetches the component at the given index. Allows Vector to conform to
IndexedRead such that `$vector[N]` is the N+1th component.


#### Arguments

* __index__: [Number](/std/doc/Number.md)  



### copy

```
$vector.copy()
```

Returns a copy of the vector.





### description

```
$vector.description()
```







End of Math::Vector class.

This file was generated automatically by the Ferret compiler from
[Vector.frt](../Vector.frt).