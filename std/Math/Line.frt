package Math
class Line
#< represents a line

#> creates a line given slope and y-intercept
init {
    need @m: Num #< slope
    need @c: Num #< y-intercept
}

#> creates a line given slope and a point
init {
    need @m: Num        #< slope
    need $pt: Point     #< point on the line
    @c = $pt.y - @m * $pt.x
}

.m              #< slope
.slope -> @m    #< slope. Same as `m`

#> formula in slope-intercept notation
.formula {
    if @c < 0:
        -> "y = @m" + "x - " + @c.abs
    -> "y = @m" + "x + @c"
}

.description -> @formula

#> equality of two lines
op == {
    need $ehs: Line
    -> $ehs.m == @m && $ehs.c == @c
}