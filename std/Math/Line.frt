package Math
class Line
#< represents a line

#> creates a line given slope and y-intercept
init {
    need @m: Num #< slope
    need @c: Num #< slope
}

#> creates a line given slope and a point
init {
    need @m: Num        #< slope
    need $pt: Point     #< point on the line
    @c = $pt.y - @m * $pt.x
}

#> slope
prop m

#> slope. same as `m`
prop slope {
    return @m
}

prop formula {
    if @c < 0:
        return "y = @m" + "x - " + @c.abs
    return "y = @m" + "x + @c"
}

method description {
    return @formula
}

operator == {
    need $ehs: Line
    return $ehs.m == @m && $ehs.c == @c
}