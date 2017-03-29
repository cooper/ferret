# main

This is the main package.




## Test

This is the Test class version 1.0.

Provides a basic test suite.


### Initializer

```
$test = Test()
```

Creates a new Test class instance.


#### Arguments

* *optional* __name__: Any - Test name.

* *optional* __fatal__: Any - If true, a failed test will throw a fatal error.
This is the default behavior.

### Methods

#### trueValue

```
$test.trueValue($a)
```

Test succeeds if `Bool($a) === true`.


##### Arguments

* __a__: Any - Test object.



#### veryTrue

```
$test.veryTrue($a)
```

Test succeeds if `$a === true`.


##### Arguments

* __a__: Any - Test object.



#### equal

```
$test.equal($a, $b)
```

Test succeeds if `$a == $b`.


##### Arguments

* __a__: Any - Test object 1.

* __b__: Any - Test object 2.



#### objectsEqual

```
$test.objectsEqual($a, $b)
```

Test succeeds if `$a === $b`.


##### Arguments

* __a__: Any - Test object 1.

* __b__: Any - Test object 2.



#### notEqual

```
$test.notEqual($a, $b)
```

Test succeeds if `$a != $b`.


##### Arguments

* __a__: Any - Test object 1.

* __b__: Any - Test object 2.



#### objectsNotEqual

```
$test.objectsNotEqual($a, $b)
```

Test succeeds if `$a !== $b`.


##### Arguments

* __a__: Any - Test object 1.

* __b__: Any - Test object 2.



#### instanceOfClass

```
$test.instanceOfClass($a, $b)
```

Test succeeds of `$a` is an instance of class `$b`.


##### Arguments

* __a__: Any - Test object.

* __b__: Any - Test class.



#### fitsType

```
$test.fitsType($a, $b)
```

Test succeeds of `$a` satisfies type `$b`.


##### Arguments

* __a__: Any - Test object.

* __b__: Any - Test type.



#### review

```
$test.review()
```

Prints the test review.


##### Arguments

* *optional* __quiet__: [Bool](/std/doc/Bool.md)  





End of the Test class.






End of the main package.

This file was generated automatically by the Ferret compiler from
[Test.frt](../Test.frt).