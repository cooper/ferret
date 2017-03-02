package Math
class Matrix

init {
    need @m: Int
    want @items: Num...
}

prop rows {
    return @m
}

prop columns {
    return @items.length / @m
}

prop dimensionHR {
    return @rows + "x" + @columns
}

prop rowList {
    $items = @items.copy!
    return gather for $row = $items.splice(0, @columns) {
        take $row
    }
}

method map {
    need $code: Code
    return Matrix(m: @m, items: @items.map($code))
}

method mapWith {
    need $rhs: Matrix
    need $code: Code
    if @dimensionHR != $rhs.dimensionHR
        throw Error(:DimensionError, "Dimension mismatch @dimensionHR != $rhs.dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take $code(*self.items[$i], $rhs.items[$i])
    }
    return Matrix(m: @m, items: $items)
}

operator + {
    need $ehs: Num
    return @map! { -> $_ + $ehs }
}

operator - {
    need $rhs: Num
    return @map! { -> $_ - $rhs }
}

operator + {
    need $ehs: Matrix
    return @mapWith($ehs) {
        need $a, $b
        -> $a + $b
    }
}

operator - {
    need $rhs: Matrix
    return @mapWith($rhs) {
        need $a, $b
        -> $a - $b
    }
}

method description {
    $str = ""
    for $row in @rowList
        $str += "[ " + $row.join(" ") + " ]" + "\n"
    return $str
}
