# Test

This is the Test class version 1.0.

Provides a basic test suite.


## Initializer

```
$test = Test()
```

Creates a new Test class instance.


### Arguments

* *optional* __name__: Any - the test name.

* *optional* __fatal__: Any - If true, a failed test will throw a fatal error.
This is the default behavior.

## Methods

### trueValue

```
$test.trueValue($a)
```

Test succeeds if `bool($a) === true`.


#### Arguments

* __a__: Any - test object.



### veryTrue

```
$test.veryTrue($a)
```

Test succeeds if `$a === true`.


#### Arguments

* __a__: Any - test object.



### equal

```
$test.equal($a, $b)
```

Test succeeds if `$a == $b`.


#### Arguments

* __a__: Any - test object.

* __b__: Any - test object.



### objectsEqual

```
$test.objectsEqual($a, $b)
```

Test succeeds if `$a === $b`.


#### Arguments

* __a__: Any - test object.

* __b__: Any - test object.



### notEqual

```
$test.notEqual($a, $b)
```

Test succeeds if `$a != $b`.


#### Arguments

* __a__: Any - test object.

* __b__: Any - test object.



### objectsNotEqual

```
$test.objectsNotEqual($a, $b)
```

Test succeeds if `$a !== $b`.


#### Arguments

* __a__: Any - test object.

* __b__: Any - test object.



### review

```
$test.review()
```

Prints the test review.






End of Test class.

This file was generated automatically by the Ferret compiler from
[Test.frtdoc](../Test.frtdoc).