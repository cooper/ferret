# create an arbitrary object
$obj = "hi"

# become a point
#
# note how it infers the argument names
# from the actual Point initializer
#
Math::Point.init($obj)(1, 1)

say($obj.pretty!)
