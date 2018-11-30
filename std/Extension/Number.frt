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

#> square root of the number, returning a complex number if `N < 0`
.sqrt {
    if *self < 0
        -> *self.abs.sqrt * i
    -> NATIVE::Math.sqrt(*self)
}

#> cube root of the number
.cbrt -> @root(3)

#> the number, squared
.square -> *self ^ 2

#> absolute value of the number
.abs {
    if *self < 0
        -> -*self
    -> *self
}

#> true if the number is even
.even -> *self % 2 == 0

#> true if the number is odd
.odd -> *self % 2 != 0

#> Nth root of the number M, returning a complex number if `N` is even and
#| `M < 0`.
.root {
    need $root: Num
    
    # negative number
    if *self < 0 {
        if $root.even
            -> *self.abs.root($root) * i
            
        # odd root, fixes things like (-2)^(1/3) returning nan
        else
            -> -*self.abs.root($root)
    }
    
    # non-negative number
    -> *self ^ (1 / $root)
}

#> The number's factorial. This can also be written `N!`.
method factorial {
    $new = 1
    if *self < 2:
        -> *self
    for $i in *self..2:
        $new *= $i
    -> $new
}

#> Calling a number returns its factorial. Example: `4!` yields `24`.
method toFunction {
    -> @factorial
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
