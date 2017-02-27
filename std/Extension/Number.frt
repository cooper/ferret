class Number

#> Even numbers conform to this interface.
type Even {
    isa *class
    satisfies .even
}

#> Odd numbers conform to this interface.
type Odd {
    isa *class
    satisfies .odd
}

#> This interface guarantees an integer value, returning the `.floor` property
#> of non-integer numbers.
type Integer {
    isa *class
    transform .floor
}

alias Int = Integer

#> square root of the number
prop sqrt {
    return Math.sqrt(*self)
}

#> cube root of the number
prop cbrt {
    return @root(3)
}

#> the number, squared
prop square {
    return *self ^ 2
}

#> true if the number is even
prop even {
    return *self % 2 == 0
}

#> true if the number is odd
prop odd {
    return *self % 2 != 0
}

#> the Nth root of the number
method root {
    need $root: Num
    return Math.root($root, *self)
}

#> The number's factorial. This can also be written `N!`.
method factorial {
    $new = 1
    if *self < 2:
        return *self
    for $i in *self..2:
        $new *= $i
    return $new
}

#> Calling a number returns its factorial. Example: `4!` yields `24`.
method toFunction {
    return @factorial
}

#> Infinity
share $Inf = Num("inf")

#> Not a number
share $NaN = Num("nan")

end

# Aliases in the global context

alias Int = Num::Int
alias Inf = Num::Inf
alias NaN = Num::NaN
