package Math
class Matrix
#< Represents a [matrix](https://en.wikipedia.org/wiki/Matrix_(mathematics))
#| of any dimensions.

$docOption_instanceName = "mtrx"

#> creates a matrix with the given entries and row count
init {
    need @m: Int            #< number of rows
    want @items: Num...     #< list of entries
}

#> number of rows
.m

#> number of rows. Same as `m`
.rows -> @m

#> number of columns
.columns -> @items.length / @m

#> human-readable dimensions
.dimensionHR -> @rows + "x" + @columns

#> a list whose elements are lists of items in each row
.rowList {
    $items = @items.copy!
    -> gather for $row = $items.splice(0, @columns) {
        take $row
    }
}

#> creates a matrix with the given transformation applied to each entry
.map {
    need $code: Code
    -> Matrix(m: @m, items: @items.map($code))
}

#> creates a matrix with the given operation performed between each entry and
#| its corresponding entry in another matrix of the same dimensions
.mapWith {
    need $rhs: Matrix   #< another matrix of the same dimensions
    need $code: Code    #< code which returns a new entry when given the
                        #| corresponding entries of the two existing matrices
    if @dimensionHR != $rhs.dimensionHR
        throw Error(:DimensionError, "Dimension mismatch @dimensionHR != $rhs.dimensionHR")
    $items = gather for $i in 0..@items.lastIndex {
        take $code(*self.items[$i], $rhs.items[$i])
    }
    -> Matrix(m: @m, items: $items)
}

#> scalar addition
operator + {
    need $ehs: Num
    -> @map! { -> $_ + $ehs }
}

#> scalar subtraction
operator - {
    need $rhs: Num
    -> @map! { -> $_ - $rhs }
}

#> allows you to take the opposite matrix
operator - {
    need $lhs: Num
    if $lhs != 0
        throw(:InvalidOperation, "Unsupported operation")
    -> @map! { -> -$_ }
}

#> scalar multiplication
operator * {
    need $ehs: Num
    -> @map! { -> $_ * $ehs }
}

#> scalar division
operator / {
    need $rhs: Num
    -> @map! { -> $_ / $rhs }
}

#> entry-wise matrix addition
operator + {
    need $ehs: Matrix   #< another matrix of the same dimensions
    -> @mapWith($ehs) {
        need $a, $b
        -> $a + $b
    }
}

#> entry-wise matrix subtraction
operator - {
    need $rhs: Matrix   #< another matrix of the same dimensions
    -> @mapWith($rhs) {
        need $a, $b
        -> $a - $b
    }
}

method description {
    $str = ""
    for $row in @rowList
        $str += "[ " + $row.join(" ") + " ]" + "\n"
    -> $str
}
