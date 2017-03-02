# Math::Matrix

This is the Math::Matrix class.

Represents a [matrix](https:
of any dimensions.


## Initializer

```
$matrix = Matrix($m: Int)
```

Creates a matrix with the given entries and row count.


### Arguments

* __m__: [Number (auto-integer)](/std/doc/Number.md) - Number of rows.

* *optional* __items__: [Number](/std/doc/Number.md)... - Variable number of arguments. List of entries.

## Methods

### rows

```
$matrix.rows
```

Computed property. Number of rows.



### columns

```
$matrix.columns
```

Computed property. Number of columns.



### dimensionHR

```
$matrix.dimensionHR
```

Computed property. Human-readable dimensions.



### rowList

```
$matrix.rowList
```

Computed property. A list whose elements are lists of items in each row.



### map

```
$matrix.map($code: Code)
```

Creates a matrix with the given transformation applied to each entry.


#### Arguments

* __code__: Code  



### mapWith

```
$matrix.mapWith($rhs: Matrix, $code: Code)
```

Creates a matrix with the given operation performed between each entry and
its corresponding entry in another matrix of the same dimensions.


#### Arguments

* __rhs__: Matrix - Another matrix of the same dimensions.

* __code__: Code - Code which returns a new entry when given the.



### Addition operator (+)

```
$matrix + $ehs: Num
```

Scalar addition.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



### Subtraction operator (-)

```
$matrix - $rhs: Num
```

Scalar subtraction.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### Subtraction operator (-)

```
$matrix - $lhs: Num
```

Allows you to take the opposite matrix.


#### Arguments

* __lhs__: [Number](/std/doc/Number.md)  



### Multiplication operator (*)

```
$matrix * $ehs: Num
```

Scalar multiplication.


#### Arguments

* __ehs__: [Number](/std/doc/Number.md)  



### Division operator (/)

```
$matrix / $rhs: Num
```

Scalar division.


#### Arguments

* __rhs__: [Number](/std/doc/Number.md)  



### Addition operator (+)

```
$matrix + $ehs: Matrix
```

Entry-wise matrix addition.


#### Arguments

* __ehs__: Matrix - Another matrix of the same dimensions.



### Subtraction operator (-)

```
$matrix - $rhs: Matrix
```

Entry-wise matrix subtraction.


#### Arguments

* __rhs__: Matrix - Another matrix of the same dimensions.



### description

```
$matrix.description()
```







End of Math::Matrix class.

This file was generated automatically by the Ferret compiler from
[Matrix.frt](../Matrix.frt).