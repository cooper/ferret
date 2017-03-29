# Math

This is the Math package.




## Math::Vector

This is the Math::Vector class.

Represents a [vector](https://en.wikipedia.org/wiki/Vector_space) of any
dimension.


### Initializer

```
$vector = Vector()
```

Creates a vector with the given components.


#### Arguments

* *optional* __items__: [Num](/std/doc/Number.md)...  Variable number of arguments. 

### Methods

#### dimension

```
$vector.dimension
```

Computed property. Dimension of the vector.



#### dimensionHR

```
$vector.dimensionHR
```

Computed property. Human-readable dimension of the vector.



#### magnitude

```
$vector.magnitude
```

Computed property. Magnitude of the vector.



#### unitVector

```
$vector.unitVector
```

Computed property. The unit vector in the direction of this vector.



#### axisUnitVector

```
$vector.axisUnitVector($axis: VectorAxis)
```

Returns the unit vector in the direction of the given axis.


##### Arguments

* __axis__: VectorAxis - Axis number or letter, starting at 1 or "i".



#### x

```
$vector.x
```

Computed property. For a >=1D vector, the first comonent.



#### y

```
$vector.y
```

Computed property. For a >=2D vector, the second component.



#### z

```
$vector.z
```

Computed property. For a >=3D vector, the third component.



#### direction

```
$vector.direction
```

Computed property. For a 2D vector, its direction, measured in radians.



#### Addition operator (+)

```
$vector + $ehs: Vector
```

Addition of two vectors.


##### Arguments

* __ehs__: Vector  



#### Subtraction operator (-)

```
$vector - $lhs: Num
```

Allows you to take the opposite vector `-$u`.


##### Arguments

* __lhs__: [Num](/std/doc/Number.md)  



#### Subtraction operator (-)

```
$vector - $rhs: Vector
```

Subtraction of a vector from another.


##### Arguments

* __rhs__: Vector  



#### Multiplication operator (*)

```
$vector * $ehs: Num
```

Scalar multiplication of the vector.


##### Arguments

* __ehs__: [Num](/std/doc/Number.md)  



#### Division operator (/)

```
$vector / $rhs: Num
```

Scalar division of the vector.


##### Arguments

* __rhs__: [Num](/std/doc/Number.md)  



#### Multiplication operator (*)

```
$vector * $ehs: Vector
```

Dot product of two vectors.


##### Arguments

* __ehs__: Vector  



#### Equality operator (==)

```
$vector == $ehs: Vector
```

Vector equality.


##### Arguments

* __ehs__: Vector  



#### dot

```
$vector.dot($ehs: Vector)
```

Dot product of this vector and another of the same dimension.


##### Arguments

* __ehs__: Vector  



#### cross

```
$vector.cross($ehs: Vector)
```

Cross product of two 3D vectors.


##### Arguments

* __ehs__: Vector  



#### angleBetween

```
$vector.angleBetween($ehs: Vector)
```

Angle between this vector and another of the same dimension, measured in
radians.


##### Arguments

* __ehs__: Vector  



#### orthogonalTo

```
$vector.orthogonalTo($ehs: Vector)
```

True if this vector is orthogonal to another of the same dimension.


##### Arguments

* __ehs__: Vector  



#### parallelTo

```
$vector.parallelTo($ehs: Vector)
```

True if this vector is parallel to another of the same dimension.


##### Arguments

* __ehs__: Vector  



#### getValue

```
$vector.getValue($index: Num)
```

Fetches the component at the given index. Allows Vector to conform to
IndexedRead such that `$vector[N]` is the N+1th component.


##### Arguments

* __index__: [Num](/std/doc/Number.md)  



#### copy

```
$vector.copy()
```

Returns a copy of the vector.





#### description

```
$vector.description()
```

### Class functions

#### zeroVector

```
Vector.zeroVector($dimension: Num)
```

Returns the zero vector in the given dimension.


##### Arguments

* __dimension__: [Num](/std/doc/Number.md)  



#### axisUnitVector

```
Vector.axisUnitVector($dimension: Num, $axis: VectorAxis)
```

Returns the unit vector for the given dimension and axis.


##### Arguments

* __dimension__: [Num](/std/doc/Number.md)  

* __axis__: VectorAxis - Axis number or letter, starting at 1 or "i".


### Type interfaces

#### VectorAxis




##### Restraints and transforms

In order to comply, the test object must satisfy each of the following conditions and transforms.

1. __transform__: Requirement determined at runtime.


End of the Math::Vector class.





End of the Math package.

This file was generated automatically by the Ferret compiler from
[Vector.frt](../Vector.frt).