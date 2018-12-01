# Inheritance

Perhaps Ferret's most unique feature is its ISA inheritance system. The name
ISA is borrowed from Perl, where package variables `@ISA` consist of parent
package names. However, Ferret's inheritance system is quite different.

Ferret objects do not inherit from classes; they inherit from other objects.
As silly as it may sound, objects can belong to any number of classes.
But they don't inherit from those classes; they inherit from their prototype
objects.

If an object is an instance of the String class, for instance, its `*ISA`
(list of parent objects) would include the `String.proto` object.

## Example class

Below is an example of a Ferret class from the standard library.

```
package Math
class Point

init {
    need @x: Num, @y: Num
}

.distanceTo {
    need $pt2: Point
    $dx = @x - $pt2.x
    $dy = @y - $pt2.y
    -> sqrt($dx ^ 2 + $dy ^ 2)
}

.distanceFromOrigin
    -> @distanceTo(*class(0, 0))

.pretty -> "(@x, @y)"

.toString -> @pretty

.description -> "Point" + @pretty

func midpoint {
    need $pt1: Point, $pt2: Point
    -> *class(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    )
}

func distanceBetween {
    need $pt1: Point, $pt2: Point
    -> $pt1.distanceTo($pt2)
}
```

Initializing an object as a certain type is as simple as adding an object to
its `*ISA` list. However, this is not typically done directly. Consider this
example.

```
# Create an empty object. This is like {} in JavaScript.
$obj = (:)

# Make the object an instance of Point.
Math::Point.init($obj)(0, 0)

# The object is now a Point representing the origin.
# Therefore, $obj.*ISA includes Math::Point.proto.
inspect($obj)
```

Output

```
[ Point ](
    x = 0
    y = 0
)
```

This is equivalent to below, as calling a class creates an empty object and
initializes it in one step.

```
$obj = Math::Point(0, 0)
```

## Example of basic inheritance

Because Ferret objects can inherit from any objects, a class is not required
for inheritance. Below is an example of basic inheritance without a class.

```
# create a basic object representing a male being.
$male = (gender: "male")

# create a basic object representing a specific person.
$person = (name: "Jake", age: 22)

# add $male to $person's *ISA list
$person.*ISA.push($male)

inspect($person)
```

Output

```
[ Object ](
    age = 22
    name = "Jake"
    (gender) = "male"
)
```
