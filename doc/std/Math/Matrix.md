# Math::Matrix

This is the Math::Matrix class.

Represents a [matrix](https://en.wikipedia.org/wiki/Matrix_(mathematics))
of any dimensions.


## Initializer

```
$mtrx = Matrix($m: Int)
```

Creates a matrix with the given entries and row count.


### Arguments

* __m__: [Int](/doc/std/Number.md) - Number of rows.

* *optional* __items__: [Num](/doc/std/Number.md)... - Variable number of arguments. List of entries.

## Methods

### rows

```
$mtrx.rows
```

Computed property. Number of rows.



### columns

```
$mtrx.columns
```

Computed property. Number of columns.



### dimensionHR

```
$mtrx.dimensionHR
```

Computed property. Human-readable dimensions.



### rowList

```
$mtrx.rowList
```

Computed property. A list whose elements are lists of items in each row.



### map

```
$mtrx.map($code: Code)
```

Creates a matrix with the given transformation applied to each entry.


#### Arguments

* __code__: Code  



### mapWith

```
$mtrx.mapWith($rhs: Matrix, $code: Code)
```

Creates a matrix with the given operation performed between each entry and
its corresponding entry in another matrix of the same dimensions.


#### Arguments

* __rhs__: Matrix - Another matrix of the same dimensions.

* __code__: Code - Code which returns a new entry when given the.



### Addition operator (+)

```
$mtrx + ($ehs: Num)
```

Scalar addition.





### Subtraction operator (-)

```
$mtrx - ($rhs: Num)
```

Scalar subtraction.





### Subtraction operator (-)

```
$mtrx - ($lhs: Num)
```

Allows you to take the opposite matrix.





### Multiplication operator (*)

```
$mtrx * ($ehs: Num)
```

Scalar multiplication.





### Division operator (/)

```
$mtrx / ($rhs: Num)
```

Scalar division.





### Addition operator (+)

```
$mtrx + ($ehs: Matrix)
```

Entry-wise matrix addition.





### Subtraction operator (-)

```
$mtrx - ($rhs: Matrix)
```

Entry-wise matrix subtraction.





End of the Math::Matrix class.

This file was generated automatically by the Ferret compiler from
Matrix.frt.