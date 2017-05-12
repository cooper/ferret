# Math::Vector

This is the Math::Vector class.

Represents a [vector](https://en.wikipedia.org/wiki/Vector_space) of any
dimension.


## Initializer

```
$v = Vector()
```

Creates a vector with the given components.


### Arguments

* *optional* __items__: [Num](/doc/std/Number.md)...  Variable number of arguments. 

## Methods

### dimension

```
$v.dimension
```

Computed property. Dimension of the vector.



### dimensionHR

```
$v.dimensionHR
```

Computed property. Human-readable dimension of the vector.



### magnitude

```
$v.magnitude
```

Computed property. Magnitude of the vector.



### unitVector

```
$v.unitVector
```

Computed property. The unit vector in the direction of this vector.



### axisUnitVector

```
$v.axisUnitVector($axis: VectorAxis)
```

Returns the unit vector in the direction of the given axis.


#### Arguments

* __axis__: VectorAxis - Axis number or letter, starting at 1 or "i".



### x

```
$v.x
```

Computed property. For a >=1D vector, the first comonent.



### y

```
$v.y
```

Computed property. For a >=2D vector, the second component.



### z

```
$v.z
```

Computed property. For a >=3D vector, the third component.



### direction

```
$v.direction
```

Computed property. For a 2D vector, its direction, measured in radians.



### Addition operator (+)

```
$v + ($ehs: Vector)
```

Addition of two vectors.





### Subtraction operator (-)

```
$v - ($lhs: Num)
```

Allows you to take the opposite vector `-$u`.





### Subtraction operator (-)

```
$v - ($rhs: Vector)
```

Subtraction of a vector from another.





### Multiplication operator (*)

```
$v * ($ehs: Num)
```

Scalar multiplication of the vector.





### Division operator (/)

```
$v / ($rhs: Num)
```

Scalar division of the vector.





### Multiplication operator (*)

```
$v * ($ehs: Vector)
```

Dot product of two vectors.





### Equality operator (==)

```
$v == ($ehs: Vector)
```

Vector equality.





### dot

```
$v.dot($ehs: Vector)
```

Dot product of this vector and another of the same dimension.


#### Arguments

* __ehs__: Vector  



### cross

```
$v.cross($ehs: Vector)
```

Cross product of two 3D vectors.


#### Arguments

* __ehs__: Vector  



### angleBetween

```
$v.angleBetween($ehs: Vector)
```

Angle between this vector and another of the same dimension, measured in
radians.


#### Arguments

* __ehs__: Vector  



### orthogonalTo

```
$v.orthogonalTo($ehs: Vector)
```

True if this vector is orthogonal to another of the same dimension.


#### Arguments

* __ehs__: Vector  



### parallelTo

```
$v.parallelTo($ehs: Vector)
```

True if this vector is parallel to another of the same dimension.


#### Arguments

* __ehs__: Vector  



### getValue

```
$v.getValue($index: Num)
```

Fetches the component at the given index. Allows Vector to conform to
IndexedRead such that `$vector[N]` is the N+1th component.


#### Arguments

* __index__: [Num](/doc/std/Number.md)  



### copy

```
$v.copy()
```

Returns a copy of the vector.

## Class functions

### zeroVector

```
Vector.zeroVector($dimension: Num)
```

Returns the zero vector in the given dimension.


#### Arguments

* __dimension__: [Num](/doc/std/Number.md)  



### axisUnitVector

```
Vector.axisUnitVector($dimension: Num, $axis: VectorAxis)
```

Returns the unit vector for the given dimension and axis.


#### Arguments

* __dimension__: [Num](/doc/std/Number.md)  

* __axis__: VectorAxis - Axis number or letter, starting at 1 or "i".


## Type interfaces

### VectorAxis

An interface which accepts an axis letter starting at "i" or number starting
at 1. For instance, a 3D vector is represented by axes i, j, and k, which
correspond to the numbers 1, 2, and 3, respectively.


#### Restraints and transforms

In order to comply, the object must satisfy the following condition.

1. __transform__: Converts letters starting at 'i' to axis numbers.


End of the Math::Vector class.

This file was generated automatically by the Ferret compiler from
Vector.frt.