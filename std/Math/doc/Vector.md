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



### Multiplication operator (*)

```
$vector * $ehs: Num
```

Scalar multiplication of the vector.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



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

Dot product of two vectors.


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

Angle between two vectors, measured in radians.


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