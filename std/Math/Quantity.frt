package Math
class Quantity
#< A number associated with a unit

$docOption_instanceName = "q"

init {
    need @num:  Num
    need @unit: Unit
}

method toBase {
    if @unit.isBase
        -> *self
    -> Quantity(@unit.multiplier * @num, @unit.base)
}

.to {
    need $unit: Unit
    $baseQ = @toBase!
    if $baseQ.unit == $unit
        -> $baseQ
    if $baseQ.unit != $unit.base
        throw Error(:notpossible, "sorry")
    -> Quantity($baseQ.num / $unit.multiplier, $unit)
}

.description -> @num.*description + " " + @unit.suffix
