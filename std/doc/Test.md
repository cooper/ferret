# Test

This is the Test class version 1.0.

Provides a basic test suite.


## Initializer

```
$test = Test()
```

Creates a new Test class instance.


### Arguments

* *optional* __name__: Any - The test name.

* *optional* __fatal__: Any - If true, a failed test will throw a fatal error.
This is the default behavior.

## Methods

### trueValue

```
$test.trueValue($a)
```

Test succeeds if `bool($a) === true`.


#### Arguments

* __a__: Any - Test object.



### veryTrue

```
$test.veryTrue($a)
```

Test succeeds if `$a === true`.


#### Arguments

* __a__: Any - Test object.



### equal

```
$test.equal($a, $b)
```

Test succeeds if `$a == $b`.


#### Arguments

* __a__: Any - Test object.

* __b__: Any - Test object.



### objectsEqual

```
$test.objectsEqual($a, $b)
```

Test succeeds if `$a === $b`.


#### Arguments

* __a__: Any - Test object.

* __b__: Any - Test object.



### notEqual

```
$test.notEqual($a, $b)
```

Test succeeds if `$a != $b`.


#### Arguments

* __a__: Any - Test object.

* __b__: Any - Test object.



### objectsNotEqual

```
$test.objectsNotEqual($a, $b)
```

Test succeeds if `$a !== $b`.


#### Arguments

* __a__: Any - Test object.

* __b__: Any - Test object.



### review

```
$test.review()
```

Prints the test review.







End of Test class.

This file was generated automatically by the Ferret compiler from
[Test.frt](../Test.frt).